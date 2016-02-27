
LIBRARY IEEE;
LIBRARY IEEE_proposed;

USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;
USE IEEE.float_pkg.ALL;
USE WORK.fp_mult;
USE WORK.fp_mult_data_pak.ALL;

ENTITY fp_mult_tb IS
END ENTITY fp_mult_tb;

ARCHITECTURE tb OF fp_mult_tb IS
	SIGNAL opcode : std_logic_vector(1 DOWNTO 0);
	SIGNAL a, b, expected, actual : std_logic_vector(31 DOWNTO 0);
	SIGNAL clk : std_logic := '0';
BEGIN

	clk <= not clk AFTER 10 ns;
	
	E1 : ENTITY fp_mult PORT MAP(opcode => opcode, dataa => a, datab => b, result=>actual);
	
	P1 : PROCESS IS
		VARIABLE rec : data_t_rec;
	BEGIN
		WAIT UNTIL rising_edge(clk);
		
		FOR i IN data'RANGE LOOP
			rec := data(i);
			opcode <= rec.op;
			a <= rec.dataa;
			b <= rec.datab;
			expected <= rec.result;
			
			-- Allow a clock cycle for output to appear
			FOR j IN 0 TO 10 LOOP
				WAIT UNTIL rising_edge(clk);
			end loop;
			
			-- Check output
			ASSERT actual = expected 
			REPORT "CYCLE " & integer'image(i) & " EXPECTED " & to_string(to_float(expected)) & " BUT RECEIVED " & to_string(to_float(actual))
			SEVERITY failure;
		END LOOP;
		
		REPORT "ALL TESTS FINISHED CORRECTLY" SEVERITY FAILURE;
		
	END PROCESS P1;

END ARCHITECTURE tb;