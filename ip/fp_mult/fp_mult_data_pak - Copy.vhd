LIBRARY IEEE;

USE IEEE.std_logic_1164.ALL;

PACKAGE fp_mult_data_pak IS

	-- Define data types array
	TYPE data_t_rec IS
		RECORD

		END RECORD;
	TYPE data_t IS ARRAY (natural RANGE <>) OF data_t_rec;
	
	-- Define actual data
	CONSTANT data : data_t := (
		
	
	);
END PACKAGE fp_mult_data_pak;