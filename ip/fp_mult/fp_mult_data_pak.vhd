LIBRARY IEEE;

USE IEEE.std_logic_1164.ALL;

PACKAGE fp_mult_data_pak IS

	-- Define data types array
	TYPE data_t_rec IS
		RECORD
      op : std_logic_vector(1 DOWNTO 0);
      dataa, datab, result : std_logic_vector(31 DOWNTO 0);
		END RECORD;
	TYPE data_t IS ARRAY (natural RANGE <>) OF data_t_rec;
	
	-- Define actual data
	CONSTANT data : data_t := (
		("00", X"3f800000", X"3e800000", X"3fa00000"),
		("01", X"3f800000", X"3e800000", X"3f400000"),
		("10", X"3f800000", X"3e800000", X"3e800000"),
		("11", X"3f800000", X"3e800000", X"40800000"),
		("00", X"40000000", X"3f000000", X"40200000"),
		("01", X"40000000", X"3f000000", X"3fc00000"),
		("10", X"40000000", X"3f000000", X"3f800000"),
		("11", X"40000000", X"3f000000", X"40800000"),
		("00", X"447a0000", X"41a00000", X"447f0000"),
		("01", X"447a0000", X"41a00000", X"44750000"),
		("10", X"447a0000", X"41a00000", X"469c4000"),
		("11", X"447a0000", X"41a00000", X"42480000"),
		("00", X"42440000", X"4007d3c3", X"424c7d3c"),
		("01", X"42440000", X"4007d3c3", X"423b82c4"),
		("10", X"42440000", X"4007d3c3", X"42cffc43"),
		("11", X"42440000", X"4007d3c3", X"41b8b48d")
	);
END PACKAGE fp_mult_data_pak;