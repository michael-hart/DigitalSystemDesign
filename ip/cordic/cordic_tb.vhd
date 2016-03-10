
LIBRARY IEEE;
LIBRARY IEEE_proposed;

USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;
USE IEEE_proposed.float_pkg.ALL;
USE WORK.cordic;
USE WORK.cos_data_pak.ALL;

ENTITY cordic_tb IS
END ENTITY cordic_tb;

ARCHITECTURE tb OF cordic_tb IS
	SIGNAL a, expected, actual : std_logic_vector(31 DOWNTO 0);
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
	
	E1 : ENTITY cordic PORT MAP(clk => clk, reset => reset, start => start, angle => a, cos=>actual, done => done);
	
	P1 : PROCESS IS
		VARIABLE rec : data_t_rec;
		VARIABLE act, exp, btm_lim, top_lim : float32;
		VARIABLE start_time : time ;
	BEGIN
		-- Reset hardware to have values
		reset <= '1';
		WAIT UNTIL rising_edge(clk);
		reset <= '0';
		
		-- Test vector without attempted pipelining
		FOR i IN data'RANGE LOOP
			start_time := now;
			rec := data(i);
			a <= rec.data;
			expected <= rec.result;
			-- Start calculation
			start <= '1';
			WAIT UNTIL rising_edge(clk);
			start <= '0';
			
			-- Done will be asserted when it is finished
			WAIT UNTIL rising_edge(done);

			-- Calculate some boundaries for output, as it is not perfect
			act := to_float(unsigned(actual));
			exp := to_float(unsigned(expected));
			btm_lim := exp * 0.9995;
			top_lim := exp * 1.0005;
			
			-- Check output
			IF act > btm_lim AND act < top_lim THEN
				REPORT "CYCLE " & integer'image(i) & " EXPECTED " & integer'image(to_integer(signed(expected))) & " AND RECEIVED " & integer'image(to_integer(signed(actual))) & " *** PASS ***";
				REPORT "Time taken for calculation is " & time'image(now - start_time);
			ELSE
				ASSERT FALSE
				REPORT "CYCLE " & integer'image(i) & " EXPECTED " & integer'image(to_integer(signed(expected))) & " BUT RECEIVED " & integer'image(to_integer(signed(actual)))
				SEVERITY failure;
			END IF; -- check
			
		END LOOP;
		
		REPORT "ALL TESTS FINISHED CORRECTLY" SEVERITY FAILURE;
		
	END PROCESS P1;

END ARCHITECTURE tb;