// first_nios2_system.v

// Generated using ACDS version 13.1 162 at 2016.01.24.18:33:37

`timescale 1 ps / 1 ps
module first_nios2_system (
		input  wire       clk_clk,                            //                         clk.clk
		input  wire       reset_reset_n,                      //                       reset.reset_n
		output wire [7:0] led_pio_external_connection_export  // led_pio_external_connection.export
	);

	wire         cpu_data_master_waitrequest;                               // mm_interconnect_0:cpu_data_master_waitrequest -> cpu:d_waitrequest
	wire  [31:0] cpu_data_master_writedata;                                 // cpu:d_writedata -> mm_interconnect_0:cpu_data_master_writedata
	wire  [17:0] cpu_data_master_address;                                   // cpu:d_address -> mm_interconnect_0:cpu_data_master_address
	wire         cpu_data_master_write;                                     // cpu:d_write -> mm_interconnect_0:cpu_data_master_write
	wire         cpu_data_master_read;                                      // cpu:d_read -> mm_interconnect_0:cpu_data_master_read
	wire  [31:0] cpu_data_master_readdata;                                  // mm_interconnect_0:cpu_data_master_readdata -> cpu:d_readdata
	wire         cpu_data_master_debugaccess;                               // cpu:jtag_debug_module_debugaccess_to_roms -> mm_interconnect_0:cpu_data_master_debugaccess
	wire   [3:0] cpu_data_master_byteenable;                                // cpu:d_byteenable -> mm_interconnect_0:cpu_data_master_byteenable
	wire   [0:0] mm_interconnect_0_sysid_control_slave_address;             // mm_interconnect_0:sysid_control_slave_address -> sysid:address
	wire  [31:0] mm_interconnect_0_sysid_control_slave_readdata;            // sysid:readdata -> mm_interconnect_0:sysid_control_slave_readdata
	wire  [31:0] mm_interconnect_0_led_pio_s1_writedata;                    // mm_interconnect_0:led_pio_s1_writedata -> led_pio:writedata
	wire   [1:0] mm_interconnect_0_led_pio_s1_address;                      // mm_interconnect_0:led_pio_s1_address -> led_pio:address
	wire         mm_interconnect_0_led_pio_s1_chipselect;                   // mm_interconnect_0:led_pio_s1_chipselect -> led_pio:chipselect
	wire         mm_interconnect_0_led_pio_s1_write;                        // mm_interconnect_0:led_pio_s1_write -> led_pio:write_n
	wire  [31:0] mm_interconnect_0_led_pio_s1_readdata;                     // led_pio:readdata -> mm_interconnect_0:led_pio_s1_readdata
	wire         cpu_instruction_master_waitrequest;                        // mm_interconnect_0:cpu_instruction_master_waitrequest -> cpu:i_waitrequest
	wire  [17:0] cpu_instruction_master_address;                            // cpu:i_address -> mm_interconnect_0:cpu_instruction_master_address
	wire         cpu_instruction_master_read;                               // cpu:i_read -> mm_interconnect_0:cpu_instruction_master_read
	wire  [31:0] cpu_instruction_master_readdata;                           // mm_interconnect_0:cpu_instruction_master_readdata -> cpu:i_readdata
	wire         cpu_instruction_master_readdatavalid;                      // mm_interconnect_0:cpu_instruction_master_readdatavalid -> cpu:i_readdatavalid
	wire  [15:0] mm_interconnect_0_sys_clk_timer_s1_writedata;              // mm_interconnect_0:sys_clk_timer_s1_writedata -> sys_clk_timer:writedata
	wire   [2:0] mm_interconnect_0_sys_clk_timer_s1_address;                // mm_interconnect_0:sys_clk_timer_s1_address -> sys_clk_timer:address
	wire         mm_interconnect_0_sys_clk_timer_s1_chipselect;             // mm_interconnect_0:sys_clk_timer_s1_chipselect -> sys_clk_timer:chipselect
	wire         mm_interconnect_0_sys_clk_timer_s1_write;                  // mm_interconnect_0:sys_clk_timer_s1_write -> sys_clk_timer:write_n
	wire  [15:0] mm_interconnect_0_sys_clk_timer_s1_readdata;               // sys_clk_timer:readdata -> mm_interconnect_0:sys_clk_timer_s1_readdata
	wire         mm_interconnect_0_cpu_jtag_debug_module_waitrequest;       // cpu:jtag_debug_module_waitrequest -> mm_interconnect_0:cpu_jtag_debug_module_waitrequest
	wire  [31:0] mm_interconnect_0_cpu_jtag_debug_module_writedata;         // mm_interconnect_0:cpu_jtag_debug_module_writedata -> cpu:jtag_debug_module_writedata
	wire   [8:0] mm_interconnect_0_cpu_jtag_debug_module_address;           // mm_interconnect_0:cpu_jtag_debug_module_address -> cpu:jtag_debug_module_address
	wire         mm_interconnect_0_cpu_jtag_debug_module_write;             // mm_interconnect_0:cpu_jtag_debug_module_write -> cpu:jtag_debug_module_write
	wire         mm_interconnect_0_cpu_jtag_debug_module_read;              // mm_interconnect_0:cpu_jtag_debug_module_read -> cpu:jtag_debug_module_read
	wire  [31:0] mm_interconnect_0_cpu_jtag_debug_module_readdata;          // cpu:jtag_debug_module_readdata -> mm_interconnect_0:cpu_jtag_debug_module_readdata
	wire         mm_interconnect_0_cpu_jtag_debug_module_debugaccess;       // mm_interconnect_0:cpu_jtag_debug_module_debugaccess -> cpu:jtag_debug_module_debugaccess
	wire   [3:0] mm_interconnect_0_cpu_jtag_debug_module_byteenable;        // mm_interconnect_0:cpu_jtag_debug_module_byteenable -> cpu:jtag_debug_module_byteenable
	wire         mm_interconnect_0_jtag_uart_avalon_jtag_slave_waitrequest; // jtag_uart:av_waitrequest -> mm_interconnect_0:jtag_uart_avalon_jtag_slave_waitrequest
	wire  [31:0] mm_interconnect_0_jtag_uart_avalon_jtag_slave_writedata;   // mm_interconnect_0:jtag_uart_avalon_jtag_slave_writedata -> jtag_uart:av_writedata
	wire   [0:0] mm_interconnect_0_jtag_uart_avalon_jtag_slave_address;     // mm_interconnect_0:jtag_uart_avalon_jtag_slave_address -> jtag_uart:av_address
	wire         mm_interconnect_0_jtag_uart_avalon_jtag_slave_chipselect;  // mm_interconnect_0:jtag_uart_avalon_jtag_slave_chipselect -> jtag_uart:av_chipselect
	wire         mm_interconnect_0_jtag_uart_avalon_jtag_slave_write;       // mm_interconnect_0:jtag_uart_avalon_jtag_slave_write -> jtag_uart:av_write_n
	wire         mm_interconnect_0_jtag_uart_avalon_jtag_slave_read;        // mm_interconnect_0:jtag_uart_avalon_jtag_slave_read -> jtag_uart:av_read_n
	wire  [31:0] mm_interconnect_0_jtag_uart_avalon_jtag_slave_readdata;    // jtag_uart:av_readdata -> mm_interconnect_0:jtag_uart_avalon_jtag_slave_readdata
	wire  [31:0] mm_interconnect_0_onchip_mem_s1_writedata;                 // mm_interconnect_0:onchip_mem_s1_writedata -> onchip_mem:writedata
	wire  [13:0] mm_interconnect_0_onchip_mem_s1_address;                   // mm_interconnect_0:onchip_mem_s1_address -> onchip_mem:address
	wire         mm_interconnect_0_onchip_mem_s1_chipselect;                // mm_interconnect_0:onchip_mem_s1_chipselect -> onchip_mem:chipselect
	wire         mm_interconnect_0_onchip_mem_s1_clken;                     // mm_interconnect_0:onchip_mem_s1_clken -> onchip_mem:clken
	wire         mm_interconnect_0_onchip_mem_s1_write;                     // mm_interconnect_0:onchip_mem_s1_write -> onchip_mem:write
	wire  [31:0] mm_interconnect_0_onchip_mem_s1_readdata;                  // onchip_mem:readdata -> mm_interconnect_0:onchip_mem_s1_readdata
	wire   [3:0] mm_interconnect_0_onchip_mem_s1_byteenable;                // mm_interconnect_0:onchip_mem_s1_byteenable -> onchip_mem:byteenable
	wire         irq_mapper_receiver0_irq;                                  // jtag_uart:av_irq -> irq_mapper:receiver0_irq
	wire         irq_mapper_receiver1_irq;                                  // sys_clk_timer:irq -> irq_mapper:receiver1_irq
	wire  [31:0] cpu_d_irq_irq;                                             // irq_mapper:sender_irq -> cpu:d_irq
	wire         rst_controller_reset_out_reset;                            // rst_controller:reset_out -> [cpu:reset_n, irq_mapper:reset, jtag_uart:rst_n, led_pio:reset_n, mm_interconnect_0:cpu_reset_n_reset_bridge_in_reset_reset, onchip_mem:reset, rst_translator:in_reset, sys_clk_timer:reset_n, sysid:reset_n]
	wire         rst_controller_reset_out_reset_req;                        // rst_controller:reset_req -> [cpu:reset_req, onchip_mem:reset_req, rst_translator:reset_req_in]

	first_nios2_system_onchip_mem onchip_mem (
		.clk        (clk_clk),                                    //   clk1.clk
		.address    (mm_interconnect_0_onchip_mem_s1_address),    //     s1.address
		.clken      (mm_interconnect_0_onchip_mem_s1_clken),      //       .clken
		.chipselect (mm_interconnect_0_onchip_mem_s1_chipselect), //       .chipselect
		.write      (mm_interconnect_0_onchip_mem_s1_write),      //       .write
		.readdata   (mm_interconnect_0_onchip_mem_s1_readdata),   //       .readdata
		.writedata  (mm_interconnect_0_onchip_mem_s1_writedata),  //       .writedata
		.byteenable (mm_interconnect_0_onchip_mem_s1_byteenable), //       .byteenable
		.reset      (rst_controller_reset_out_reset),             // reset1.reset
		.reset_req  (rst_controller_reset_out_reset_req)          //       .reset_req
	);

	first_nios2_system_cpu cpu (
		.clk                                   (clk_clk),                                             //                       clk.clk
		.reset_n                               (~rst_controller_reset_out_reset),                     //                   reset_n.reset_n
		.reset_req                             (rst_controller_reset_out_reset_req),                  //                          .reset_req
		.d_address                             (cpu_data_master_address),                             //               data_master.address
		.d_byteenable                          (cpu_data_master_byteenable),                          //                          .byteenable
		.d_read                                (cpu_data_master_read),                                //                          .read
		.d_readdata                            (cpu_data_master_readdata),                            //                          .readdata
		.d_waitrequest                         (cpu_data_master_waitrequest),                         //                          .waitrequest
		.d_write                               (cpu_data_master_write),                               //                          .write
		.d_writedata                           (cpu_data_master_writedata),                           //                          .writedata
		.jtag_debug_module_debugaccess_to_roms (cpu_data_master_debugaccess),                         //                          .debugaccess
		.i_address                             (cpu_instruction_master_address),                      //        instruction_master.address
		.i_read                                (cpu_instruction_master_read),                         //                          .read
		.i_readdata                            (cpu_instruction_master_readdata),                     //                          .readdata
		.i_waitrequest                         (cpu_instruction_master_waitrequest),                  //                          .waitrequest
		.i_readdatavalid                       (cpu_instruction_master_readdatavalid),                //                          .readdatavalid
		.d_irq                                 (cpu_d_irq_irq),                                       //                     d_irq.irq
		.jtag_debug_module_resetrequest        (),                                                    //   jtag_debug_module_reset.reset
		.jtag_debug_module_address             (mm_interconnect_0_cpu_jtag_debug_module_address),     //         jtag_debug_module.address
		.jtag_debug_module_byteenable          (mm_interconnect_0_cpu_jtag_debug_module_byteenable),  //                          .byteenable
		.jtag_debug_module_debugaccess         (mm_interconnect_0_cpu_jtag_debug_module_debugaccess), //                          .debugaccess
		.jtag_debug_module_read                (mm_interconnect_0_cpu_jtag_debug_module_read),        //                          .read
		.jtag_debug_module_readdata            (mm_interconnect_0_cpu_jtag_debug_module_readdata),    //                          .readdata
		.jtag_debug_module_waitrequest         (mm_interconnect_0_cpu_jtag_debug_module_waitrequest), //                          .waitrequest
		.jtag_debug_module_write               (mm_interconnect_0_cpu_jtag_debug_module_write),       //                          .write
		.jtag_debug_module_writedata           (mm_interconnect_0_cpu_jtag_debug_module_writedata),   //                          .writedata
		.no_ci_readra                          ()                                                     // custom_instruction_master.readra
	);

	first_nios2_system_jtag_uart jtag_uart (
		.clk            (clk_clk),                                                   //               clk.clk
		.rst_n          (~rst_controller_reset_out_reset),                           //             reset.reset_n
		.av_chipselect  (mm_interconnect_0_jtag_uart_avalon_jtag_slave_chipselect),  // avalon_jtag_slave.chipselect
		.av_address     (mm_interconnect_0_jtag_uart_avalon_jtag_slave_address),     //                  .address
		.av_read_n      (~mm_interconnect_0_jtag_uart_avalon_jtag_slave_read),       //                  .read_n
		.av_readdata    (mm_interconnect_0_jtag_uart_avalon_jtag_slave_readdata),    //                  .readdata
		.av_write_n     (~mm_interconnect_0_jtag_uart_avalon_jtag_slave_write),      //                  .write_n
		.av_writedata   (mm_interconnect_0_jtag_uart_avalon_jtag_slave_writedata),   //                  .writedata
		.av_waitrequest (mm_interconnect_0_jtag_uart_avalon_jtag_slave_waitrequest), //                  .waitrequest
		.av_irq         (irq_mapper_receiver0_irq)                                   //               irq.irq
	);

	first_nios2_system_sys_clk_timer sys_clk_timer (
		.clk        (clk_clk),                                       //   clk.clk
		.reset_n    (~rst_controller_reset_out_reset),               // reset.reset_n
		.address    (mm_interconnect_0_sys_clk_timer_s1_address),    //    s1.address
		.writedata  (mm_interconnect_0_sys_clk_timer_s1_writedata),  //      .writedata
		.readdata   (mm_interconnect_0_sys_clk_timer_s1_readdata),   //      .readdata
		.chipselect (mm_interconnect_0_sys_clk_timer_s1_chipselect), //      .chipselect
		.write_n    (~mm_interconnect_0_sys_clk_timer_s1_write),     //      .write_n
		.irq        (irq_mapper_receiver1_irq)                       //   irq.irq
	);

	first_nios2_system_sysid sysid (
		.clock    (clk_clk),                                        //           clk.clk
		.reset_n  (~rst_controller_reset_out_reset),                //         reset.reset_n
		.readdata (mm_interconnect_0_sysid_control_slave_readdata), // control_slave.readdata
		.address  (mm_interconnect_0_sysid_control_slave_address)   //              .address
	);

	first_nios2_system_led_pio led_pio (
		.clk        (clk_clk),                                 //                 clk.clk
		.reset_n    (~rst_controller_reset_out_reset),         //               reset.reset_n
		.address    (mm_interconnect_0_led_pio_s1_address),    //                  s1.address
		.write_n    (~mm_interconnect_0_led_pio_s1_write),     //                    .write_n
		.writedata  (mm_interconnect_0_led_pio_s1_writedata),  //                    .writedata
		.chipselect (mm_interconnect_0_led_pio_s1_chipselect), //                    .chipselect
		.readdata   (mm_interconnect_0_led_pio_s1_readdata),   //                    .readdata
		.out_port   (led_pio_external_connection_export)       // external_connection.export
	);

	first_nios2_system_mm_interconnect_0 mm_interconnect_0 (
		.clk_0_clk_clk                           (clk_clk),                                                   //                         clk_0_clk.clk
		.cpu_reset_n_reset_bridge_in_reset_reset (rst_controller_reset_out_reset),                            // cpu_reset_n_reset_bridge_in_reset.reset
		.cpu_data_master_address                 (cpu_data_master_address),                                   //                   cpu_data_master.address
		.cpu_data_master_waitrequest             (cpu_data_master_waitrequest),                               //                                  .waitrequest
		.cpu_data_master_byteenable              (cpu_data_master_byteenable),                                //                                  .byteenable
		.cpu_data_master_read                    (cpu_data_master_read),                                      //                                  .read
		.cpu_data_master_readdata                (cpu_data_master_readdata),                                  //                                  .readdata
		.cpu_data_master_write                   (cpu_data_master_write),                                     //                                  .write
		.cpu_data_master_writedata               (cpu_data_master_writedata),                                 //                                  .writedata
		.cpu_data_master_debugaccess             (cpu_data_master_debugaccess),                               //                                  .debugaccess
		.cpu_instruction_master_address          (cpu_instruction_master_address),                            //            cpu_instruction_master.address
		.cpu_instruction_master_waitrequest      (cpu_instruction_master_waitrequest),                        //                                  .waitrequest
		.cpu_instruction_master_read             (cpu_instruction_master_read),                               //                                  .read
		.cpu_instruction_master_readdata         (cpu_instruction_master_readdata),                           //                                  .readdata
		.cpu_instruction_master_readdatavalid    (cpu_instruction_master_readdatavalid),                      //                                  .readdatavalid
		.cpu_jtag_debug_module_address           (mm_interconnect_0_cpu_jtag_debug_module_address),           //             cpu_jtag_debug_module.address
		.cpu_jtag_debug_module_write             (mm_interconnect_0_cpu_jtag_debug_module_write),             //                                  .write
		.cpu_jtag_debug_module_read              (mm_interconnect_0_cpu_jtag_debug_module_read),              //                                  .read
		.cpu_jtag_debug_module_readdata          (mm_interconnect_0_cpu_jtag_debug_module_readdata),          //                                  .readdata
		.cpu_jtag_debug_module_writedata         (mm_interconnect_0_cpu_jtag_debug_module_writedata),         //                                  .writedata
		.cpu_jtag_debug_module_byteenable        (mm_interconnect_0_cpu_jtag_debug_module_byteenable),        //                                  .byteenable
		.cpu_jtag_debug_module_waitrequest       (mm_interconnect_0_cpu_jtag_debug_module_waitrequest),       //                                  .waitrequest
		.cpu_jtag_debug_module_debugaccess       (mm_interconnect_0_cpu_jtag_debug_module_debugaccess),       //                                  .debugaccess
		.jtag_uart_avalon_jtag_slave_address     (mm_interconnect_0_jtag_uart_avalon_jtag_slave_address),     //       jtag_uart_avalon_jtag_slave.address
		.jtag_uart_avalon_jtag_slave_write       (mm_interconnect_0_jtag_uart_avalon_jtag_slave_write),       //                                  .write
		.jtag_uart_avalon_jtag_slave_read        (mm_interconnect_0_jtag_uart_avalon_jtag_slave_read),        //                                  .read
		.jtag_uart_avalon_jtag_slave_readdata    (mm_interconnect_0_jtag_uart_avalon_jtag_slave_readdata),    //                                  .readdata
		.jtag_uart_avalon_jtag_slave_writedata   (mm_interconnect_0_jtag_uart_avalon_jtag_slave_writedata),   //                                  .writedata
		.jtag_uart_avalon_jtag_slave_waitrequest (mm_interconnect_0_jtag_uart_avalon_jtag_slave_waitrequest), //                                  .waitrequest
		.jtag_uart_avalon_jtag_slave_chipselect  (mm_interconnect_0_jtag_uart_avalon_jtag_slave_chipselect),  //                                  .chipselect
		.led_pio_s1_address                      (mm_interconnect_0_led_pio_s1_address),                      //                        led_pio_s1.address
		.led_pio_s1_write                        (mm_interconnect_0_led_pio_s1_write),                        //                                  .write
		.led_pio_s1_readdata                     (mm_interconnect_0_led_pio_s1_readdata),                     //                                  .readdata
		.led_pio_s1_writedata                    (mm_interconnect_0_led_pio_s1_writedata),                    //                                  .writedata
		.led_pio_s1_chipselect                   (mm_interconnect_0_led_pio_s1_chipselect),                   //                                  .chipselect
		.onchip_mem_s1_address                   (mm_interconnect_0_onchip_mem_s1_address),                   //                     onchip_mem_s1.address
		.onchip_mem_s1_write                     (mm_interconnect_0_onchip_mem_s1_write),                     //                                  .write
		.onchip_mem_s1_readdata                  (mm_interconnect_0_onchip_mem_s1_readdata),                  //                                  .readdata
		.onchip_mem_s1_writedata                 (mm_interconnect_0_onchip_mem_s1_writedata),                 //                                  .writedata
		.onchip_mem_s1_byteenable                (mm_interconnect_0_onchip_mem_s1_byteenable),                //                                  .byteenable
		.onchip_mem_s1_chipselect                (mm_interconnect_0_onchip_mem_s1_chipselect),                //                                  .chipselect
		.onchip_mem_s1_clken                     (mm_interconnect_0_onchip_mem_s1_clken),                     //                                  .clken
		.sys_clk_timer_s1_address                (mm_interconnect_0_sys_clk_timer_s1_address),                //                  sys_clk_timer_s1.address
		.sys_clk_timer_s1_write                  (mm_interconnect_0_sys_clk_timer_s1_write),                  //                                  .write
		.sys_clk_timer_s1_readdata               (mm_interconnect_0_sys_clk_timer_s1_readdata),               //                                  .readdata
		.sys_clk_timer_s1_writedata              (mm_interconnect_0_sys_clk_timer_s1_writedata),              //                                  .writedata
		.sys_clk_timer_s1_chipselect             (mm_interconnect_0_sys_clk_timer_s1_chipselect),             //                                  .chipselect
		.sysid_control_slave_address             (mm_interconnect_0_sysid_control_slave_address),             //               sysid_control_slave.address
		.sysid_control_slave_readdata            (mm_interconnect_0_sysid_control_slave_readdata)             //                                  .readdata
	);

	first_nios2_system_irq_mapper irq_mapper (
		.clk           (clk_clk),                        //       clk.clk
		.reset         (rst_controller_reset_out_reset), // clk_reset.reset
		.receiver0_irq (irq_mapper_receiver0_irq),       // receiver0.irq
		.receiver1_irq (irq_mapper_receiver1_irq),       // receiver1.irq
		.sender_irq    (cpu_d_irq_irq)                   //    sender.irq
	);

	altera_reset_controller #(
		.NUM_RESET_INPUTS          (1),
		.OUTPUT_RESET_SYNC_EDGES   ("deassert"),
		.SYNC_DEPTH                (2),
		.RESET_REQUEST_PRESENT     (1),
		.RESET_REQ_WAIT_TIME       (1),
		.MIN_RST_ASSERTION_TIME    (3),
		.RESET_REQ_EARLY_DSRT_TIME (1),
		.USE_RESET_REQUEST_IN0     (0),
		.USE_RESET_REQUEST_IN1     (0),
		.USE_RESET_REQUEST_IN2     (0),
		.USE_RESET_REQUEST_IN3     (0),
		.USE_RESET_REQUEST_IN4     (0),
		.USE_RESET_REQUEST_IN5     (0),
		.USE_RESET_REQUEST_IN6     (0),
		.USE_RESET_REQUEST_IN7     (0),
		.USE_RESET_REQUEST_IN8     (0),
		.USE_RESET_REQUEST_IN9     (0),
		.USE_RESET_REQUEST_IN10    (0),
		.USE_RESET_REQUEST_IN11    (0),
		.USE_RESET_REQUEST_IN12    (0),
		.USE_RESET_REQUEST_IN13    (0),
		.USE_RESET_REQUEST_IN14    (0),
		.USE_RESET_REQUEST_IN15    (0),
		.ADAPT_RESET_REQUEST       (0)
	) rst_controller (
		.reset_in0      (~reset_reset_n),                     // reset_in0.reset
		.clk            (clk_clk),                            //       clk.clk
		.reset_out      (rst_controller_reset_out_reset),     // reset_out.reset
		.reset_req      (rst_controller_reset_out_reset_req), //          .reset_req
		.reset_req_in0  (1'b0),                               // (terminated)
		.reset_in1      (1'b0),                               // (terminated)
		.reset_req_in1  (1'b0),                               // (terminated)
		.reset_in2      (1'b0),                               // (terminated)
		.reset_req_in2  (1'b0),                               // (terminated)
		.reset_in3      (1'b0),                               // (terminated)
		.reset_req_in3  (1'b0),                               // (terminated)
		.reset_in4      (1'b0),                               // (terminated)
		.reset_req_in4  (1'b0),                               // (terminated)
		.reset_in5      (1'b0),                               // (terminated)
		.reset_req_in5  (1'b0),                               // (terminated)
		.reset_in6      (1'b0),                               // (terminated)
		.reset_req_in6  (1'b0),                               // (terminated)
		.reset_in7      (1'b0),                               // (terminated)
		.reset_req_in7  (1'b0),                               // (terminated)
		.reset_in8      (1'b0),                               // (terminated)
		.reset_req_in8  (1'b0),                               // (terminated)
		.reset_in9      (1'b0),                               // (terminated)
		.reset_req_in9  (1'b0),                               // (terminated)
		.reset_in10     (1'b0),                               // (terminated)
		.reset_req_in10 (1'b0),                               // (terminated)
		.reset_in11     (1'b0),                               // (terminated)
		.reset_req_in11 (1'b0),                               // (terminated)
		.reset_in12     (1'b0),                               // (terminated)
		.reset_req_in12 (1'b0),                               // (terminated)
		.reset_in13     (1'b0),                               // (terminated)
		.reset_req_in13 (1'b0),                               // (terminated)
		.reset_in14     (1'b0),                               // (terminated)
		.reset_req_in14 (1'b0),                               // (terminated)
		.reset_in15     (1'b0),                               // (terminated)
		.reset_req_in15 (1'b0)                                // (terminated)
	);

endmodule
