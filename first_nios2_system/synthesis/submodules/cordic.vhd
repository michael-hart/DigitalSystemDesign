LIBRARY IEEE;
LIBRARY ieee_proposed;

USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;
USE WORK.atan_pkg.ALL;

ENTITY cordic IS
	PORT(
		clk, start, reset : std_logic;
		done : OUT std_logic;
		angle : IN std_logic_vector(31 DOWNTO 0);
		cos : OUT std_logic_vector(31 DOWNTO 0)
	);
END ENTITY cordic;

ARCHITECTURE synth OF cordic IS
	SIGNAL done_i : std_logic;
	SIGNAL cos_i : std_logic_vector(31 DOWNTO 0);
	--CONSTANT INIT_X : std_logic_vector(31 DOWNTO 0) := (30 => '1', OTHERS => '0');
	--CONSTANT INIT_X : std_logic_vector(31 DOWNTO 0) := "00100110110110111100100010101010";
	CONSTANT INIT_X : std_logic_vector(31 DOWNTO 0) := X"26dd3b6a";
	
	--CONSTANT INIT_X : std_logic_vector(31 DOWNTO 0) := X"0000" & "1001011111001010";
	
BEGIN

	-- Assign signals to outputs
	done <= done_i;
	cos <= cos_i;

	P1 : PROCESS IS
		VARIABLE started : std_logic;
		VARIABLE count : INTEGER;
		VARIABLE X, Y, Z, Xprev : std_logic_vector(31 DOWNTO 0);
		VARIABLE sign_z : std_logic;
	BEGIN
		WAIT UNTIL rising_edge(clk);

		-- Default value
		done_i <= '0';

		IF start = '1' AND started = '0' THEN
			count := 0;
			started := '1';
			Z := angle;
			X := INIT_X;
			Y := (OTHERS => '0');
		END IF; -- start

		IF started = '1' THEN 
			
			-- Check sign of Z
			sign_z := Z(31);

			CASE sign_z IS
				WHEN '0' => 
					Xprev := X;
					X := std_logic_vector(signed(X) - SHIFT_RIGHT(signed(Y), count));
					Y := std_logic_vector(signed(Y) + SHIFT_RIGHT(signed(Xprev), count));
					Z := std_logic_vector(signed(Z) - signed(atan_table(count)));
				WHEN '1' => 
					Xprev := X;
					X := std_logic_vector(signed(X) + SHIFT_RIGHT(signed(Y), count));
					Y := std_logic_vector(signed(Y) - SHIFT_RIGHT(signed(Xprev), count));
					Z := std_logic_vector(signed(Z) + signed(atan_table(count)));
				WHEN OTHERS => NULL;
			END CASE; --sign_z

			-- Add one to count
			count := count + 1;

			IF count = 32 THEN
				done_i <= '1';
				cos_i <= X;
				started := '0';
			END IF; -- count

		END IF; --started

		-- Check for reset 
		IF reset = '1' THEN
			started := '0';
		END IF; --reset
	END PROCESS P1;

END ARCHITECTURE synth;