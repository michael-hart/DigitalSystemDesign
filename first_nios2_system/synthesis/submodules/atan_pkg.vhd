LIBRARY IEEE;
LIBRARY IEEE_proposed;

USE IEEE.std_logic_1164.ALL;
USE IEEE_proposed.fixed_pkg.ALL;

PACKAGE atan_pkg IS

	-- Define data types array
	TYPE atan_table_t IS ARRAY (natural RANGE <>) OF sfixed(1 DOWNTO -22);

	CONSTANT atan_table : atan_table_t := (
		(X"3243F6"),
		(X"1DAC67"),
		(X"0FADBA"),
		(X"07F56E"),
		(X"03FEAB"),
		(X"01FFD5"),
		(X"00FFFA"),
		(X"007FFF"),
		(X"003FFF"),
		(X"001FFF"),
		(X"000FFF"),
		(X"0007FF"),
		(X"0003FF"),
		(X"0001FF"),
		(X"0000FF"),
		(X"00007F"),
		(X"00003F"),
		(X"00001F"),
		(X"00000F"),
		(X"000007"),
		(X"000003"),
		(X"000001"),
		(X"000000"),
		(X"000000"),
		(X"000000"),
		(X"000000"),
		(X"000000"),
		(X"000000"),
		(X"000000"),
		(X"000000"),
		(X"000000"),
		(X"000000")
	);

END PACKAGE atan_pkg;
