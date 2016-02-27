
LIBRARY IEEE;
LIBRARY ieee_proposed;

USE IEEE.std_logic_1164.ALL;
USE ieee_proposed.float_pkg.ALL;

ENTITY fp_mult IS 
	PORT(
		opcode : IN std_logic_vector(1 DOWNTO 0);
		dataa, datab: IN std_logic_vector(31 DOWNTO 0);
		result : OUT std_logic_vector(31 DOWNTO 0));
END ENTITY fp_mult;

ARCHITECTURE arch OF fp_mult IS
	SIGNAL result_i : std_logic_vector(31 DOWNTO 0);
BEGIN
	
	P1 : PROCESS(opcode, dataa, datab) IS
		VARIABLE a, b : float32;
	BEGIN
		a := to_float(dataa, a);
		b := to_float(datab, b);
		
		CASE opcode IS
			WHEN "00" => result_i <= to_std_logic_vector(a + b);
			WHEN "01" => result_i <= to_std_logic_vector(a - b);
			WHEN "10" => result_i <= to_std_logic_vector(a * b);
			WHEN "11" => result_i <= to_std_logic_vector(a / b);
			WHEN OTHERS => NULL;
		END CASE; --opcode

	END PROCESS P1;
	
	result <= result_i;
END ARCHITECTURE arch;
