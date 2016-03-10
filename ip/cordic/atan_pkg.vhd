LIBRARY IEEE;

USE IEEE.std_logic_1164.ALL;

PACKAGE atan_pkg IS

	-- Define data types array
	TYPE atan_table_t IS ARRAY (natural RANGE <>) OF std_logic_vector(31 DOWNTO 0);

	CONSTANT atan_table : atan_table_t := (
		(X"3243F6A8"),
		(X"1DAC6705"),
		(X"0FADBAFC"),
		(X"07F56EA6"),
		(X"03FEAB76"),
		(X"01FFD55B"),
		(X"00FFFAAA"),
		(X"007FFF55"),
		(X"003FFFEA"),
		(X"001FFFFD"),
		(X"000FFFFF"),
		(X"0007FFFF"),
		(X"0003FFFF"),
		(X"0001FFFF"),
		(X"0000FFFF"),
		(X"00007FFF"),
		(X"00003FFF"),
		(X"00001FFF"),
		(X"00000FFF"),
		(X"000007FF"),
		(X"000003FF"),
		(X"000001FF"),
		(X"000000FF"),
		(X"0000007F"),
		(X"0000003F"),
		(X"0000001F"),
		(X"0000000F"),
		(X"00000008"),
		(X"00000004"),
		(X"00000002"),
		(X"00000001"),
		(X"00000000")
	);

END PACKAGE atan_pkg;
