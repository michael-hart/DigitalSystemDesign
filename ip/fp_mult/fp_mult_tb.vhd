
LIBRARY IEEE;
LIBRARY IEEE_proposed;

USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;
USE IEEE_proposed.float_pkg.ALL;
USE WORK.fp_mult;
USE WORK.fp_mult_data_pak.ALL;

ENTITY fp_mult_tb IS
END ENTITY fp_mult_tb;

ARCHITECTURE tb OF fp_mult_tb IS
	SIGNAL a, b, expected, actual : std_logic_vector(31 DOWNTO 0);
	SIGNAL clk : std_logic := '0';
	SIGNAL reset : std_logic := '1';
	SIGNAL start : std_logic := '0';
	SIGNAL done : std_logic;

BEGIN

	C1: PROCESS IS
	BEGIN
		clk <= '0';
		WAIT FOR 35 ns;
		clk <= '1';
		WAIT FOR 35 ns;
	END PROCESS C1;
	
	E1 : ENTITY fp_mult PORT MAP(clk => clk, reset => reset, start => start, dataa => a, datab => b, result=>actual, done => done);
	
	P1 : PROCESS IS
		VARIABLE rec : data_t_rec;
		VARIABLE act, exp, btm_lim, top_lim : float32;
		VARIABLE start_time : time ;
		VARIABLE current_error, max_error : float32;
	BEGIN
		-- Reset hardware to have values
		reset <= '1';
		WAIT UNTIL rising_edge(clk);
		reset <= '0';

		-- Set max error to 0
		max_error := to_float(0);
		
		-- Test vector without attempted pipelining
		FOR i IN data'RANGE LOOP
			start_time := now;
			rec := data(i);
			a <= rec.dataa;
			b <= rec.datab;
			expected <= rec.result;
			-- Start calculation
			start <= '1';
			WAIT UNTIL rising_edge(clk);
			start <= '0';
			
			-- Done will be asserted when it is finished
			WAIT UNTIL rising_edge(done);
			
			-- Check output
			
			-- Want to check if output is within 10% of true result
			act := to_float(actual);
			exp := to_float(expected);
			-- Calculate limits, adapting to negative numbers
			IF exp < 0 THEN
				btm_lim := exp * 1.0004;
				top_lim := exp * 0.9996;
			ELSE
				btm_lim := exp * 0.9996;
				top_lim := exp * 1.0004;
			END IF; --expected
			REPORT "Actual is " & integer'image(to_integer(signed(act)));
			REPORT "BTM is " & integer'image(to_integer(signed(btm_lim)));
			REPORT "TOP is " & integer'image(to_integer(signed(top_lim)));
			
			IF (act < btm_lim) OR (act > top_lim) THEN
				ASSERT FALSE
				REPORT "CYCLE " & integer'image(i) & " EXPECTED " & to_string(to_float(expected)) & " BUT RECEIVED " & to_string(to_float(actual))
				SEVERITY failure;
			ELSE
				REPORT "CYCLE " & integer'image(i) & " EXPECTED " & integer'image(to_integer(signed(expected))) & " AND RECEIVED " & integer'image(to_integer(signed(actual))) & " *** PASS ***";
				REPORT "Time taken for calculation is " & time'image(now - start_time);

				-- Calculate error and track max error
				current_error := 100 * abs(act - exp)/abs(exp);
				IF current_error > max_error THEN
					max_error := current_error;
				END IF;

			END IF; -- limit check
		END LOOP;
		
		REPORT "MAXIMUM ERROR WAS " & integer'image(to_integer(signed(to_slv(max_error)))) & "%";
		REPORT "ALL TESTS FINISHED CORRECTLY" SEVERITY FAILURE;
		
	END PROCESS P1;

END ARCHITECTURE tb;