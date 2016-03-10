
LIBRARY IEEE;
LIBRARY ieee_proposed;
LIBRARY cordic;

USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;
USE ieee_proposed.float_pkg.ALL;
use ieee_proposed.fixed_float_types.ALL;
use ieee_proposed.fixed_pkg.ALL;

ENTITY fp_mult IS 
	PORT(
		clk, reset, start : IN std_logic;
		data : IN std_logic_vector(31 DOWNTO 0);
		done : OUT std_logic;
		result : OUT std_logic_vector(31 DOWNTO 0));
END ENTITY fp_mult;

ARCHITECTURE arch OF fp_mult IS
	SIGNAL cos_reset, cos_start, cos_done, done_i : std_logic;
	SIGNAL result_i, cos_argument, cos_out : std_logic_vector(31 DOWNTO 0);
	CONSTANT floor_divide : float32 := to_float(4.0);

	CONSTANT cos_subtract : std_logic_vector(7 DOWNTO 0) := X"20";
	CONSTANT pi : float32 := to_float(3.14159265359);
	CONSTANT twopi : float32 := 2*pi;
	CONSTANT halfpi : float32 := pi/2;
	CONSTANT threepitwo : float32 := halfpi*3;
	
	-- State machine definitions
	TYPE fp_mult_states IS (IDLE, MODULUS, COSINE);
	SIGNAL fp_fsm : fp_mult_states;
BEGIN

	-- Instantiate the CORDIC entity for cosine function
	C2 : ENTITY cordic.cordic GENERIC MAP (WIDTH => 32) PORT MAP (
		clk => clk,
		reset => cos_reset,
		angle => cos_argument,
		sin => OPEN,
		cos => cos_out,
		start => cos_start,
		done => cos_done
  	);
	
	-- cos_reset is active low, module reset is active high, so invert
	cos_reset <= not reset;

	P1 : PROCESS IS
		VARIABLE x : float32;
		VARIABLE halfx, x2, rightsum : float32;
		VARIABLE quarter_signed_x : float32;
		VARIABLE negative_cos_out : std_logic;
		VARIABLE cos_arg_rads : float32;
		VARIABLE cos_arg_rads_fixed : sfixed(1 DOWNTO -30);
		VARIABLE cos_out_float : float32;
		VARIABLE cos_out_fixed : sfixed(1 DOWNTO -30);
		VARIABLE usigned_x : ufixed(7 DOWNTO -10);
		VARIABLE signed_x : sfixed(8 DOWNTO -10);
	BEGIN
	
		-- Wait for positive edge of clock
		WAIT UNTIL rising_edge(clk);
		
		-- Default done, cos_start value
		done_i <= '0';
		cos_start <= '0';
		
		-- If start is asserted and system isn't started, start the calculation
		IF start = '1' AND fp_fsm = IDLE THEN
	    	-- Convert x and define some float operations
			x := to_float(data, x);
			halfx := x / 2;
			x2 := x * x;

			-- Floor and divide operation
			usigned_x := to_ufixed(x, usigned_x);
			usigned_x := "00" & usigned_x(7 DOWNTO 2) & "0000000000";
			
			-- Subtract 32 using integer subtraction
			signed_x := sfixed(usigned_x) - 32;
			
			-- Convert back to 
			quarter_signed_x := abs(to_float(signed_x, quarter_signed_x));
			fp_fsm <= MODULUS;
		ELSIF fp_fsm = MODULUS THEN
			IF quarter_signed_x > twopi THEN
				quarter_signed_x := quarter_signed_x - twopi;
			ELSE
				-- Need to convert quarter_signed_x - 32 to RADIANS in range 0-pi.
				cos_arg_rads := quarter_signed_x;
				negative_cos_out := '0';
				IF cos_arg_rads > threepitwo THEN
					cos_arg_rads := twopi - cos_arg_rads;
				ELSIF cos_arg_rads > pi THEN
					cos_arg_rads := cos_arg_rads - pi;
					negative_cos_out := '1';
				ELSIF cos_arg_rads > halfpi THEN
					cos_arg_rads := pi - cos_arg_rads;
					negative_cos_out := '1';
				END IF; -- cos_arg_rads
					
				-- Must convert to fixed point for use in CORDIC
				cos_arg_rads_fixed := to_sfixed(cos_arg_rads, cos_arg_rads_fixed);
			  	cos_argument <= std_logic_vector(cos_arg_rads_fixed);
			  	cos_start <= '1';
			  	fp_fsm <= COSINE;
			END IF;

		ELSIF fp_fsm = COSINE AND cos_done = '1' THEN
			-- If the cordic algorithm is complete, cos_done is high

			-- Convert std_logic_vector to sfixed and hence to float
			cos_out_fixed := sfixed(cos_out);
			cos_out_float := to_float(cos_out_fixed);

			-- Set top bit of float to negative_cos_out, to account for angles greater than pi
			-- Float has bit indices 8 downto -23, so top bit is bit 8
			cos_out_float(8) := negative_cos_out;

			rightsum := x2 * cos_out_float;
			result_i <= to_slv(rightsum + halfx);

			-- Calculations are done, so assert DONE
			done_i <= '1';
			
			-- Reset fp_fsm
			fp_fsm <= IDLE;
		END IF; -- cos_done
		
		-- Check for reset signal, and overwrite all signals if found
		IF reset = '1' THEN
			fp_fsm <= IDLE;
			result_i <= (OTHERS => '0');
			cos_argument <= (OTHERS => '0');
		END IF; -- reset

	END PROCESS P1;
	
	result <= result_i;
	done <= done_i;
END ARCHITECTURE arch;
