
LIBRARY IEEE;
LIBRARY ieee_proposed;

USE IEEE.std_logic_1164.ALL;
USE ieee_proposed.float_pkg.ALL;

ENTITY fp_mult IS 
	PORT(
		dataa, datab: IN std_logic_vector(31 DOWNTO 0);
		result : OUT std_logic_vector(31 DOWNTO 0));
END ENTITY fp_mult;

ARCHITECTURE arch OF fp_mult IS
	SIGNAL result_i : std_logic_vector(31 DOWNTO 0);
BEGIN
	
	P1 : PROCESS(dataa, datab) IS
		VARIABLE a, b : float32;
	BEGIN
		a := to_float(dataa, a);
		b := to_float(datab, b);
		result_i <= to_std_logic_vector(a*b);
	END PROCESS P1;
	
	result <= result_i;
END ARCHITECTURE arch;