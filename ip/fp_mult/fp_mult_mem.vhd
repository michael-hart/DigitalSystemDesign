-- File is intended to directly access the memory and instantiate fp_mult
LIBRARY IEEE;

USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY fp_mult_mem IS
	PORT(
		-- Inputs from NIOS
		-- Address is given is 32 bit integer
		start_addr : IN std_logic_vector(31 DOWNTO 0);
		-- Allow 32-bit integer number of data points
		vector_length : IN std_logic_vector(31 DOWNTO 0);
		-- Start, reset, and clock signals
		start, reset, clk : IN std_logic;
		-- Output back to NIOS, a floating-point number
		result : OUT std_logic_vector(31 DOWNTO 0);
		-- Done signal for NIOS
		done : OUT std_logic;

		-- SDRAM interface
		-- Address is 32 bits TODO check this
		read_addr : OUT std_logic_vector(31 DOWNTO 0);
		-- read boolean - assert to perform a READ operation
		read_mem : OUT std_logic;
		-- Response must be 00 to indicate OK
		response : IN std_logic_vector(1 DOWNTO 0);
		-- Readdatavalid is asserted when the current address matches the readdata
		-- waitrequest must be deasserted before read is perform
		readdatavalid, waitrequest : IN std_logic;
		-- Variables for burst transfer
		burstcount : OUT std_logic_vector(10 DOWNTO 0);

		-- Output data from SDRAM, 16 bits wide
		readdata : IN std_logic_vector(15 DOWNTO 0)

	);
END ENTITY;

ARCHITECTURE rtl OF fp_mult_mem IS 
	-- Current address to read from
	SIGNAL current_addr : std_logic_vector(31 DOWNTO 0);
	-- Start/done signals for fp_mult
	SIGNAL fp_start, fp_done : std_logic;
	SIGNAL fp_dataa, fp_datab : std_logic_vector(31 DOWNTO 0);
	SIGNAL fp_result : std_logic_vector(31 DOWNTO 0);

	-- Signals for use with memory
	SIGNAL read_mem_i : std_logic;

	-- FSM type definition
	TYPE fsm IS (IDLE, GET, CALC, FSMDONE);
	SIGNAL fp_fsm : fsm;
	TYPE burst_states IS (word1, word2);
	SIGNAL burst_fsm : burst_states;

	-- Signals for current module
	SIGNAL done_i : std_logic;
	SIGNAL result_i : std_logic_vector(31 DOWNTO 0);
	SIGNAL data1, data : std_logic_vector(15 DOWNTO 0);

BEGIN
	-- Instantiate entity fp_mult
	E1 : ENTITY WORK.fp_mult PORT MAP (
		clk => clk,
		reset => reset,
		start => fp_start,
		done => fp_done,
		dataa => fp_dataa, 
		datab => fp_datab,
		result => fp_result);

	P1 : PROCESS IS
		VARIABLE points_left : std_logic_vector(31 DOWNTO 0);
	BEGIN
		WAIT UNTIL rising_edge(clk);

		done_i <= '0';
		fp_start <= '0';
		read_mem_i <= '0';

		IF fp_fsm = IDLE THEN
			IF start = '1' THEN
				fp_fsm <= GET;
				current_addr <= start_addr;
				read_mem_i <= '1';
				points_left := std_logic_vector(unsigned(vector_length) - 1);
			END IF; -- start
		ELSIF fp_fsm = GET THEN
			-- Check memory read complete
			IF burst_fsm = word1 THEN
				read_mem_i <= '1';
				IF waitrequest = '0' AND response = "00" AND readdatavalid='1' THEN
					burst_fsm <= word2;
					data1 <= readdata;
				END IF;
			ELSIF burst_fsm = word2 THEN
				IF waitrequest = '0' AND response = "00" AND readdatavalid='1' THEN
					burst_fsm <= word1;

					-- Start fp_mult, assume endianness
					fp_dataa <= data1 & readdata;
					fp_datab <= result_i;
					fp_start <= '1';

					-- Next read operation
					--current_addr <= std_logic_vector(unsigned(current_addr) + 1);
					--read_mem_i <= '1';
					--points_left := std_logic_vector(signed(points_left) - 1);

					-- FSM transition
					fp_fsm <= CALC;
				ELSE
					-- Continue trying to read
					read_mem_i <= '1';
				END IF; -- GET state
			END IF; -- burst_fsm
		--ELSIF fp_fsm = GETCALC THEN
		--	-- Check both memory read and fp_mult are complete
		--	IF burst_fsm = word1 THEN
		--		read_mem_i <= '1';
		--		IF waitrequest = '0' AND response = "00" AND readdatavalid = '1' THEN
		--			data1 <= fp_result;
		--			burst_fsm <= word2;
		--		END IF;
		--	ELSIF burst_fsm = word2 THEN
		--		IF waitrequest = '1' OR readdatavalid = '0' THEN
		--			read_mem_i <= '1';
		--		END IF;
		--		IF waitrequest = '0' AND response = "00" AND readdatavalid = '1' AND fp_done = '1' THEN

		--			-- Store previous result
		--			result_i <= fp_result;

		--			-- Start fp_mult
		--			fp_dataa <= data1 & readdata;
		--			fp_datab <= fp_result;
		--			fp_start <= '1';

		--			-- If there are points left, stay in the same state
		--			IF points_left = X"00000000" THEN
		--				fp_fsm <= CALC;
		--			ELSE
		--				-- Next read operation
		--				current_addr <= std_logic_vector(unsigned(current_addr) + 1);
		--				read_mem_i <= '1';
		--				points_left := std_logic_vector(signed(points_left) - 1);
		--			END IF; 

		--		END IF; -- read complete
		--	END IF; -- burst_fsm
		-- If doing calculation, wait until complete, then assert complete
		ELSIF fp_fsm = CALC THEN
			IF fp_done = '1' THEN
				-- Store result and transition to read next data point
				result_i <= fp_result;

				IF points_left = X"00000000" THEN
					done_i <= '1';
					fp_fsm <= FSMDONE;
				ELSE
					fp_fsm <= GET;
					current_addr <= std_logic_vector(unsigned(current_addr) + 1);
					read_mem_i <= '1';
					points_left := std_logic_vector(unsigned(points_left) - 1);
				END IF; -- points_left
			END IF;
		END IF; -- FSM operation complete

		IF reset = '1' OR fp_fsm = FSMDONE THEN
			current_addr <= (OTHERS => '0');
			points_left := (OTHERS => '0');
			result_i <= (OTHERS => '0');
			fp_fsm <= IDLE;
			burst_fsm <= word1;
		END IF; --reset

	END PROCESS P1;

	-- Assign signals to output
	done <= done_i;
	result <= result_i;

	read_addr <= current_addr;
	read_mem <= read_mem_i;

	burstcount <= "00000000010";

END ARCHITECTURE rtl;