LIBRARY IEEE;

USE IEEE.std_logic_1164.ALL;

PACKAGE fp_mult_data_pak IS

	-- Define data types array
	TYPE data_t_rec IS
		RECORD
			dataa, datab, result : std_logic_vector(31 DOWNTO 0);
		END RECORD;
	TYPE data_t IS ARRAY (natural RANGE <>) OF data_t_rec;
	
	-- Define actual data
	CONSTANT data : data_t := (
		(X"3f800000", X"3f800000", X"3f800000"),
		(X"40000000", X"3f000000", X"3f800000"),
		(X"447a0000", X"41a00000", X"469c4000"),
		(X"42440000", X"4007d3c3", X"42cffc43")
	);
END PACKAGE fp_mult_data_pak;