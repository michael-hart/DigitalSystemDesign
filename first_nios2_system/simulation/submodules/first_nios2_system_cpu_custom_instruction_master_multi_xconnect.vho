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

 LIBRARY sgate;
 USE sgate.sgate_pack.all;

--synthesis_resources = oper_less_than 2 
 LIBRARY ieee;
 USE ieee.std_logic_1164.all;

 ENTITY  first_nios2_system_cpu_custom_instruction_master_multi_xconnect IS 
	 PORT 
	 ( 
		 ci_master0_a	:	OUT  STD_LOGIC_VECTOR (4 DOWNTO 0);
		 ci_master0_b	:	OUT  STD_LOGIC_VECTOR (4 DOWNTO 0);
		 ci_master0_c	:	OUT  STD_LOGIC_VECTOR (4 DOWNTO 0);
		 ci_master0_clk	:	OUT  STD_LOGIC;
		 ci_master0_clken	:	OUT  STD_LOGIC;
		 ci_master0_dataa	:	OUT  STD_LOGIC_VECTOR (31 DOWNTO 0);
		 ci_master0_datab	:	OUT  STD_LOGIC_VECTOR (31 DOWNTO 0);
		 ci_master0_done	:	IN  STD_LOGIC;
		 ci_master0_estatus	:	OUT  STD_LOGIC;
		 ci_master0_ipending	:	OUT  STD_LOGIC_VECTOR (31 DOWNTO 0);
		 ci_master0_n	:	OUT  STD_LOGIC_VECTOR (7 DOWNTO 0);
		 ci_master0_readra	:	OUT  STD_LOGIC;
		 ci_master0_readrb	:	OUT  STD_LOGIC;
		 ci_master0_reset	:	OUT  STD_LOGIC;
		 ci_master0_reset_req	:	OUT  STD_LOGIC;
		 ci_master0_result	:	IN  STD_LOGIC_VECTOR (31 DOWNTO 0);
		 ci_master0_start	:	OUT  STD_LOGIC;
		 ci_master0_writerc	:	OUT  STD_LOGIC;
		 ci_slave_a	:	IN  STD_LOGIC_VECTOR (4 DOWNTO 0);
		 ci_slave_b	:	IN  STD_LOGIC_VECTOR (4 DOWNTO 0);
		 ci_slave_c	:	IN  STD_LOGIC_VECTOR (4 DOWNTO 0);
		 ci_slave_clk	:	IN  STD_LOGIC;
		 ci_slave_clken	:	IN  STD_LOGIC;
		 ci_slave_dataa	:	IN  STD_LOGIC_VECTOR (31 DOWNTO 0);
		 ci_slave_datab	:	IN  STD_LOGIC_VECTOR (31 DOWNTO 0);
		 ci_slave_done	:	OUT  STD_LOGIC;
		 ci_slave_estatus	:	IN  STD_LOGIC;
		 ci_slave_ipending	:	IN  STD_LOGIC_VECTOR (31 DOWNTO 0);
		 ci_slave_n	:	IN  STD_LOGIC_VECTOR (7 DOWNTO 0);
		 ci_slave_readra	:	IN  STD_LOGIC;
		 ci_slave_readrb	:	IN  STD_LOGIC;
		 ci_slave_reset	:	IN  STD_LOGIC;
		 ci_slave_reset_req	:	IN  STD_LOGIC;
		 ci_slave_result	:	OUT  STD_LOGIC_VECTOR (31 DOWNTO 0);
		 ci_slave_start	:	IN  STD_LOGIC;
		 ci_slave_writerc	:	IN  STD_LOGIC
	 ); 
 END first_nios2_system_cpu_custom_instruction_master_multi_xconnect;

 ARCHITECTURE RTL OF first_nios2_system_cpu_custom_instruction_master_multi_xconnect IS

	 ATTRIBUTE synthesis_clearbox : natural;
	 ATTRIBUTE synthesis_clearbox OF RTL : ARCHITECTURE IS 1;
	 SIGNAL  wire_first_nios2_system_cpu_custom_instruction_master_multi_xconnect_lessthan0_1_a	:	STD_LOGIC_VECTOR (7 DOWNTO 0);
	 SIGNAL  wire_first_nios2_system_cpu_custom_instruction_master_multi_xconnect_lessthan0_1_b	:	STD_LOGIC_VECTOR (7 DOWNTO 0);
	 SIGNAL  wire_vcc	:	STD_LOGIC;
	 SIGNAL  wire_first_nios2_system_cpu_custom_instruction_master_multi_xconnect_lessthan0_1_o	:	STD_LOGIC;
	 SIGNAL  wire_first_nios2_system_cpu_custom_instruction_master_multi_xconnect_lessthan1_2_a	:	STD_LOGIC_VECTOR (7 DOWNTO 0);
	 SIGNAL  wire_first_nios2_system_cpu_custom_instruction_master_multi_xconnect_lessthan1_2_b	:	STD_LOGIC_VECTOR (7 DOWNTO 0);
	 SIGNAL  wire_gnd	:	STD_LOGIC;
	 SIGNAL  wire_first_nios2_system_cpu_custom_instruction_master_multi_xconnect_lessthan1_2_o	:	STD_LOGIC;
	 SIGNAL  wire_w431w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w462w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w465w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w468w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w471w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w474w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w477w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w480w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w483w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w486w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w489w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w435w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w492w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w495w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w498w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w501w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w504w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w507w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w510w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w513w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w516w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w519w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w438w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w522w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w525w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w441w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w444w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w447w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w450w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w453w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w456w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w459w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  s_wire_first_nios2_system_cpu_custom_instruction_master_multi_xconnect_select0_3_dataout :	STD_LOGIC;
	 SIGNAL  wire_w_ci_master0_result_range430w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_ci_master0_result_range461w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_ci_master0_result_range464w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_ci_master0_result_range467w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_ci_master0_result_range470w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_ci_master0_result_range473w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_ci_master0_result_range476w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_ci_master0_result_range479w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_ci_master0_result_range482w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_ci_master0_result_range485w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_ci_master0_result_range488w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_ci_master0_result_range434w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_ci_master0_result_range491w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_ci_master0_result_range494w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_ci_master0_result_range497w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_ci_master0_result_range500w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_ci_master0_result_range503w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_ci_master0_result_range506w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_ci_master0_result_range509w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_ci_master0_result_range512w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_ci_master0_result_range515w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_ci_master0_result_range518w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_ci_master0_result_range437w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_ci_master0_result_range521w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_ci_master0_result_range524w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_ci_master0_result_range440w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_ci_master0_result_range443w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_ci_master0_result_range446w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_ci_master0_result_range449w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_ci_master0_result_range452w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_ci_master0_result_range455w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_ci_master0_result_range458w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
 BEGIN

	wire_gnd <= '0';
	wire_vcc <= '1';
	wire_w431w(0) <= s_wire_first_nios2_system_cpu_custom_instruction_master_multi_xconnect_select0_3_dataout AND wire_w_ci_master0_result_range430w(0);
	wire_w462w(0) <= s_wire_first_nios2_system_cpu_custom_instruction_master_multi_xconnect_select0_3_dataout AND wire_w_ci_master0_result_range461w(0);
	wire_w465w(0) <= s_wire_first_nios2_system_cpu_custom_instruction_master_multi_xconnect_select0_3_dataout AND wire_w_ci_master0_result_range464w(0);
	wire_w468w(0) <= s_wire_first_nios2_system_cpu_custom_instruction_master_multi_xconnect_select0_3_dataout AND wire_w_ci_master0_result_range467w(0);
	wire_w471w(0) <= s_wire_first_nios2_system_cpu_custom_instruction_master_multi_xconnect_select0_3_dataout AND wire_w_ci_master0_result_range470w(0);
	wire_w474w(0) <= s_wire_first_nios2_system_cpu_custom_instruction_master_multi_xconnect_select0_3_dataout AND wire_w_ci_master0_result_range473w(0);
	wire_w477w(0) <= s_wire_first_nios2_system_cpu_custom_instruction_master_multi_xconnect_select0_3_dataout AND wire_w_ci_master0_result_range476w(0);
	wire_w480w(0) <= s_wire_first_nios2_system_cpu_custom_instruction_master_multi_xconnect_select0_3_dataout AND wire_w_ci_master0_result_range479w(0);
	wire_w483w(0) <= s_wire_first_nios2_system_cpu_custom_instruction_master_multi_xconnect_select0_3_dataout AND wire_w_ci_master0_result_range482w(0);
	wire_w486w(0) <= s_wire_first_nios2_system_cpu_custom_instruction_master_multi_xconnect_select0_3_dataout AND wire_w_ci_master0_result_range485w(0);
	wire_w489w(0) <= s_wire_first_nios2_system_cpu_custom_instruction_master_multi_xconnect_select0_3_dataout AND wire_w_ci_master0_result_range488w(0);
	wire_w435w(0) <= s_wire_first_nios2_system_cpu_custom_instruction_master_multi_xconnect_select0_3_dataout AND wire_w_ci_master0_result_range434w(0);
	wire_w492w(0) <= s_wire_first_nios2_system_cpu_custom_instruction_master_multi_xconnect_select0_3_dataout AND wire_w_ci_master0_result_range491w(0);
	wire_w495w(0) <= s_wire_first_nios2_system_cpu_custom_instruction_master_multi_xconnect_select0_3_dataout AND wire_w_ci_master0_result_range494w(0);
	wire_w498w(0) <= s_wire_first_nios2_system_cpu_custom_instruction_master_multi_xconnect_select0_3_dataout AND wire_w_ci_master0_result_range497w(0);
	wire_w501w(0) <= s_wire_first_nios2_system_cpu_custom_instruction_master_multi_xconnect_select0_3_dataout AND wire_w_ci_master0_result_range500w(0);
	wire_w504w(0) <= s_wire_first_nios2_system_cpu_custom_instruction_master_multi_xconnect_select0_3_dataout AND wire_w_ci_master0_result_range503w(0);
	wire_w507w(0) <= s_wire_first_nios2_system_cpu_custom_instruction_master_multi_xconnect_select0_3_dataout AND wire_w_ci_master0_result_range506w(0);
	wire_w510w(0) <= s_wire_first_nios2_system_cpu_custom_instruction_master_multi_xconnect_select0_3_dataout AND wire_w_ci_master0_result_range509w(0);
	wire_w513w(0) <= s_wire_first_nios2_system_cpu_custom_instruction_master_multi_xconnect_select0_3_dataout AND wire_w_ci_master0_result_range512w(0);
	wire_w516w(0) <= s_wire_first_nios2_system_cpu_custom_instruction_master_multi_xconnect_select0_3_dataout AND wire_w_ci_master0_result_range515w(0);
	wire_w519w(0) <= s_wire_first_nios2_system_cpu_custom_instruction_master_multi_xconnect_select0_3_dataout AND wire_w_ci_master0_result_range518w(0);
	wire_w438w(0) <= s_wire_first_nios2_system_cpu_custom_instruction_master_multi_xconnect_select0_3_dataout AND wire_w_ci_master0_result_range437w(0);
	wire_w522w(0) <= s_wire_first_nios2_system_cpu_custom_instruction_master_multi_xconnect_select0_3_dataout AND wire_w_ci_master0_result_range521w(0);
	wire_w525w(0) <= s_wire_first_nios2_system_cpu_custom_instruction_master_multi_xconnect_select0_3_dataout AND wire_w_ci_master0_result_range524w(0);
	wire_w441w(0) <= s_wire_first_nios2_system_cpu_custom_instruction_master_multi_xconnect_select0_3_dataout AND wire_w_ci_master0_result_range440w(0);
	wire_w444w(0) <= s_wire_first_nios2_system_cpu_custom_instruction_master_multi_xconnect_select0_3_dataout AND wire_w_ci_master0_result_range443w(0);
	wire_w447w(0) <= s_wire_first_nios2_system_cpu_custom_instruction_master_multi_xconnect_select0_3_dataout AND wire_w_ci_master0_result_range446w(0);
	wire_w450w(0) <= s_wire_first_nios2_system_cpu_custom_instruction_master_multi_xconnect_select0_3_dataout AND wire_w_ci_master0_result_range449w(0);
	wire_w453w(0) <= s_wire_first_nios2_system_cpu_custom_instruction_master_multi_xconnect_select0_3_dataout AND wire_w_ci_master0_result_range452w(0);
	wire_w456w(0) <= s_wire_first_nios2_system_cpu_custom_instruction_master_multi_xconnect_select0_3_dataout AND wire_w_ci_master0_result_range455w(0);
	wire_w459w(0) <= s_wire_first_nios2_system_cpu_custom_instruction_master_multi_xconnect_select0_3_dataout AND wire_w_ci_master0_result_range458w(0);
	ci_master0_a <= ( ci_slave_a(4 DOWNTO 0));
	ci_master0_b <= ( ci_slave_b(4 DOWNTO 0));
	ci_master0_c <= ( ci_slave_c(4 DOWNTO 0));
	ci_master0_clk <= ci_slave_clk;
	ci_master0_clken <= ci_slave_clken;
	ci_master0_dataa <= ( ci_slave_dataa(31 DOWNTO 0));
	ci_master0_datab <= ( ci_slave_datab(31 DOWNTO 0));
	ci_master0_estatus <= ci_slave_estatus;
	ci_master0_ipending <= ( ci_slave_ipending(31 DOWNTO 0));
	ci_master0_n <= ( ci_slave_n(7 DOWNTO 0));
	ci_master0_readra <= (s_wire_first_nios2_system_cpu_custom_instruction_master_multi_xconnect_select0_3_dataout AND ci_slave_readra);
	ci_master0_readrb <= (s_wire_first_nios2_system_cpu_custom_instruction_master_multi_xconnect_select0_3_dataout AND ci_slave_readrb);
	ci_master0_reset <= ci_slave_reset;
	ci_master0_reset_req <= ci_slave_reset_req;
	ci_master0_start <= (s_wire_first_nios2_system_cpu_custom_instruction_master_multi_xconnect_select0_3_dataout AND ci_slave_start);
	ci_master0_writerc <= (s_wire_first_nios2_system_cpu_custom_instruction_master_multi_xconnect_select0_3_dataout AND ci_slave_writerc);
	ci_slave_done <= (s_wire_first_nios2_system_cpu_custom_instruction_master_multi_xconnect_select0_3_dataout AND ci_master0_done);
	ci_slave_result <= ( wire_w525w & wire_w522w & wire_w519w & wire_w516w & wire_w513w & wire_w510w & wire_w507w & wire_w504w & wire_w501w & wire_w498w & wire_w495w & wire_w492w & wire_w489w & wire_w486w & wire_w483w & wire_w480w & wire_w477w & wire_w474w & wire_w471w & wire_w468w & wire_w465w & wire_w462w & wire_w459w & wire_w456w & wire_w453w & wire_w450w & wire_w447w & wire_w444w & wire_w441w & wire_w438w & wire_w435w & wire_w431w);
	s_wire_first_nios2_system_cpu_custom_instruction_master_multi_xconnect_select0_3_dataout <= (wire_first_nios2_system_cpu_custom_instruction_master_multi_xconnect_lessthan0_1_o AND wire_first_nios2_system_cpu_custom_instruction_master_multi_xconnect_lessthan1_2_o);
	wire_w_ci_master0_result_range430w(0) <= ci_master0_result(0);
	wire_w_ci_master0_result_range461w(0) <= ci_master0_result(10);
	wire_w_ci_master0_result_range464w(0) <= ci_master0_result(11);
	wire_w_ci_master0_result_range467w(0) <= ci_master0_result(12);
	wire_w_ci_master0_result_range470w(0) <= ci_master0_result(13);
	wire_w_ci_master0_result_range473w(0) <= ci_master0_result(14);
	wire_w_ci_master0_result_range476w(0) <= ci_master0_result(15);
	wire_w_ci_master0_result_range479w(0) <= ci_master0_result(16);
	wire_w_ci_master0_result_range482w(0) <= ci_master0_result(17);
	wire_w_ci_master0_result_range485w(0) <= ci_master0_result(18);
	wire_w_ci_master0_result_range488w(0) <= ci_master0_result(19);
	wire_w_ci_master0_result_range434w(0) <= ci_master0_result(1);
	wire_w_ci_master0_result_range491w(0) <= ci_master0_result(20);
	wire_w_ci_master0_result_range494w(0) <= ci_master0_result(21);
	wire_w_ci_master0_result_range497w(0) <= ci_master0_result(22);
	wire_w_ci_master0_result_range500w(0) <= ci_master0_result(23);
	wire_w_ci_master0_result_range503w(0) <= ci_master0_result(24);
	wire_w_ci_master0_result_range506w(0) <= ci_master0_result(25);
	wire_w_ci_master0_result_range509w(0) <= ci_master0_result(26);
	wire_w_ci_master0_result_range512w(0) <= ci_master0_result(27);
	wire_w_ci_master0_result_range515w(0) <= ci_master0_result(28);
	wire_w_ci_master0_result_range518w(0) <= ci_master0_result(29);
	wire_w_ci_master0_result_range437w(0) <= ci_master0_result(2);
	wire_w_ci_master0_result_range521w(0) <= ci_master0_result(30);
	wire_w_ci_master0_result_range524w(0) <= ci_master0_result(31);
	wire_w_ci_master0_result_range440w(0) <= ci_master0_result(3);
	wire_w_ci_master0_result_range443w(0) <= ci_master0_result(4);
	wire_w_ci_master0_result_range446w(0) <= ci_master0_result(5);
	wire_w_ci_master0_result_range449w(0) <= ci_master0_result(6);
	wire_w_ci_master0_result_range452w(0) <= ci_master0_result(7);
	wire_w_ci_master0_result_range455w(0) <= ci_master0_result(8);
	wire_w_ci_master0_result_range458w(0) <= ci_master0_result(9);
	wire_first_nios2_system_cpu_custom_instruction_master_multi_xconnect_lessthan0_1_a <= ( "0" & "0" & "0" & "0" & "0" & "0" & "0" & "0");
	wire_first_nios2_system_cpu_custom_instruction_master_multi_xconnect_lessthan0_1_b <= ( ci_slave_n(7 DOWNTO 0));
	first_nios2_system_cpu_custom_instruction_master_multi_xconnect_lessthan0_1 :  oper_less_than
	  GENERIC MAP (
		sgate_representation => 0,
		width_a => 8,
		width_b => 8
	  )
	  PORT MAP ( 
		a => wire_first_nios2_system_cpu_custom_instruction_master_multi_xconnect_lessthan0_1_a,
		b => wire_first_nios2_system_cpu_custom_instruction_master_multi_xconnect_lessthan0_1_b,
		cin => wire_vcc,
		o => wire_first_nios2_system_cpu_custom_instruction_master_multi_xconnect_lessthan0_1_o
	  );
	wire_first_nios2_system_cpu_custom_instruction_master_multi_xconnect_lessthan1_2_a <= ( ci_slave_n(7 DOWNTO 0));
	wire_first_nios2_system_cpu_custom_instruction_master_multi_xconnect_lessthan1_2_b <= ( "0" & "0" & "0" & "0" & "0" & "0" & "0" & "1");
	first_nios2_system_cpu_custom_instruction_master_multi_xconnect_lessthan1_2 :  oper_less_than
	  GENERIC MAP (
		sgate_representation => 0,
		width_a => 8,
		width_b => 8
	  )
	  PORT MAP ( 
		a => wire_first_nios2_system_cpu_custom_instruction_master_multi_xconnect_lessthan1_2_a,
		b => wire_first_nios2_system_cpu_custom_instruction_master_multi_xconnect_lessthan1_2_b,
		cin => wire_gnd,
		o => wire_first_nios2_system_cpu_custom_instruction_master_multi_xconnect_lessthan1_2_o
	  );

 END RTL; --first_nios2_system_cpu_custom_instruction_master_multi_xconnect
--synopsys translate_on
--VALID FILE
