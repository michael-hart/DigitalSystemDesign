--IP Functional Simulation Model
--VERSION_BEGIN 13.1 cbx_mgl 2013:10:24:09:16:30:SJ cbx_simgen 2013:10:24:09:15:20:SJ  VERSION_END


-- Copyright (C) 1991-2013 Altera Corporation
-- Your use of Altera Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Altera Program License 
-- Subscription Agreement, Altera MegaCore Function License 
-- Agreement, or other applicable license agreement, including, 
-- without limitation, that your use is for the sole purpose of 
-- programming logic devices manufactured by Altera and sold by 
-- Altera or its authorized distributors.  Please refer to the 
-- applicable agreement for further details.

-- You may only use these simulation model output files for simulation
-- purposes and expressly not for synthesis or any other purposes (in which
-- event Altera disclaims all warranties of any kind).


--synopsys translate_off

--synthesis_resources = 
 LIBRARY ieee;
 USE ieee.std_logic_1164.all;

 ENTITY  first_nios2_system_cpu_custom_instruction_master_translator IS 
	 PORT 
	 ( 
		 ci_slave_multi_a	:	IN  STD_LOGIC_VECTOR (4 DOWNTO 0);
		 ci_slave_multi_b	:	IN  STD_LOGIC_VECTOR (4 DOWNTO 0);
		 ci_slave_multi_c	:	IN  STD_LOGIC_VECTOR (4 DOWNTO 0);
		 ci_slave_multi_clk	:	IN  STD_LOGIC;
		 ci_slave_multi_clken	:	IN  STD_LOGIC;
		 ci_slave_multi_dataa	:	IN  STD_LOGIC_VECTOR (31 DOWNTO 0);
		 ci_slave_multi_datab	:	IN  STD_LOGIC_VECTOR (31 DOWNTO 0);
		 ci_slave_multi_done	:	OUT  STD_LOGIC;
		 ci_slave_multi_n	:	IN  STD_LOGIC_VECTOR (7 DOWNTO 0);
		 ci_slave_multi_readra	:	IN  STD_LOGIC;
		 ci_slave_multi_readrb	:	IN  STD_LOGIC;
		 ci_slave_multi_reset	:	IN  STD_LOGIC;
		 ci_slave_multi_reset_req	:	IN  STD_LOGIC;
		 ci_slave_multi_result	:	OUT  STD_LOGIC_VECTOR (31 DOWNTO 0);
		 ci_slave_multi_start	:	IN  STD_LOGIC;
		 ci_slave_multi_writerc	:	IN  STD_LOGIC;
		 ci_slave_result	:	OUT  STD_LOGIC_VECTOR (31 DOWNTO 0);
		 comb_ci_master_result	:	IN  STD_LOGIC_VECTOR (31 DOWNTO 0);
		 multi_ci_master_a	:	OUT  STD_LOGIC_VECTOR (4 DOWNTO 0);
		 multi_ci_master_b	:	OUT  STD_LOGIC_VECTOR (4 DOWNTO 0);
		 multi_ci_master_c	:	OUT  STD_LOGIC_VECTOR (4 DOWNTO 0);
		 multi_ci_master_clk	:	OUT  STD_LOGIC;
		 multi_ci_master_clken	:	OUT  STD_LOGIC;
		 multi_ci_master_dataa	:	OUT  STD_LOGIC_VECTOR (31 DOWNTO 0);
		 multi_ci_master_datab	:	OUT  STD_LOGIC_VECTOR (31 DOWNTO 0);
		 multi_ci_master_done	:	IN  STD_LOGIC;
		 multi_ci_master_n	:	OUT  STD_LOGIC_VECTOR (7 DOWNTO 0);
		 multi_ci_master_readra	:	OUT  STD_LOGIC;
		 multi_ci_master_readrb	:	OUT  STD_LOGIC;
		 multi_ci_master_reset	:	OUT  STD_LOGIC;
		 multi_ci_master_reset_req	:	OUT  STD_LOGIC;
		 multi_ci_master_result	:	IN  STD_LOGIC_VECTOR (31 DOWNTO 0);
		 multi_ci_master_start	:	OUT  STD_LOGIC;
		 multi_ci_master_writerc	:	OUT  STD_LOGIC
	 ); 
 END first_nios2_system_cpu_custom_instruction_master_translator;

 ARCHITECTURE RTL OF first_nios2_system_cpu_custom_instruction_master_translator IS

	 ATTRIBUTE synthesis_clearbox : natural;
	 ATTRIBUTE synthesis_clearbox OF RTL : ARCHITECTURE IS 1;
 BEGIN

	ci_slave_multi_done <= multi_ci_master_done;
	ci_slave_multi_result <= ( multi_ci_master_result(31 DOWNTO 0));
	ci_slave_result <= ( comb_ci_master_result(31 DOWNTO 0));
	multi_ci_master_a <= ( ci_slave_multi_a(4 DOWNTO 0));
	multi_ci_master_b <= ( ci_slave_multi_b(4 DOWNTO 0));
	multi_ci_master_c <= ( ci_slave_multi_c(4 DOWNTO 0));
	multi_ci_master_clk <= ci_slave_multi_clk;
	multi_ci_master_clken <= ci_slave_multi_clken;
	multi_ci_master_dataa <= ( ci_slave_multi_dataa(31 DOWNTO 0));
	multi_ci_master_datab <= ( ci_slave_multi_datab(31 DOWNTO 0));
	multi_ci_master_n <= ( ci_slave_multi_n(7 DOWNTO 0));
	multi_ci_master_readra <= ci_slave_multi_readra;
	multi_ci_master_readrb <= ci_slave_multi_readrb;
	multi_ci_master_reset <= ci_slave_multi_reset;
	multi_ci_master_reset_req <= ci_slave_multi_reset_req;
	multi_ci_master_start <= ci_slave_multi_start;
	multi_ci_master_writerc <= ci_slave_multi_writerc;

 END RTL; --first_nios2_system_cpu_custom_instruction_master_translator
--synopsys translate_on
--VALID FILE
