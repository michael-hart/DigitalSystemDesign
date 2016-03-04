
LIBRARY IEEE;
LIBRARY ieee_proposed;

USE IEEE.std_logic_1164.ALL;
USE ieee_proposed.float_pkg.ALL;

ENTITY fp_mult IS 
	PORT(
		clk, start, resetn : IN std_logic;
		done : OUT std_logic;
		opcode : IN std_logic_vector(1 DOWNTO 0);
		dataa, datab: IN std_logic_vector(31 DOWNTO 0);
		result : OUT std_logic_vector(31 DOWNTO 0));
END ENTITY fp_mult;

ARCHITECTURE arch OF fp_mult IS
	SIGNAL result_i : std_logic_vector(31 DOWNTO 0);
	SIGNAL done_i : std_logic;
	SIGNAL started_i : std_logic;
BEGIN
	
	P1 : PROCESS IS
		VARIABLE a, b : float32;
	BEGIN
		WAIT UNTIL rising_edge(clk);
		a := float(dataa);
		b := float(datab);
		
		done_i <= '0';

		IF start = '1' THEN
			started_i <= '1';
		END IF; -- start

		-- Forces a clock cycle delay
		IF started_i = '1' THEN
			CASE opcode IS
				WHEN "00" => result_i <= std_logic_vector(a + b);
				WHEN "01" => result_i <= std_logic_vector(a - b);
				WHEN "10" => result_i <= std_logic_vector(a * b);
				WHEN "11" => result_i <= std_logic_vector(a / b);
				WHEN OTHERS => NULL;
			END CASE; --opcode

			done_i <= '1';
			started_i <= '0';

		END IF; --started_i

		-- Do reset last to overwrite any signals
		IF resetn = '1' THEN
			done_i <= '0';
			result_i <= (others => '0');
			started_i <= '0';
		END IF; --resetn

	END PROCESS P1;
	
	result <= result_i;
	done <= done_i;
END ARCHITECTURE arch;
