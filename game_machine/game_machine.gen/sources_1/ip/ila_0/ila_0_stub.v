// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2023.2 (win64) Build 4029153 Fri Oct 13 20:14:34 MDT 2023
// Date        : Sun May 11 17:12:45 2025
// Host        : YanX running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               c:/Users/39551/Desktop/ASIC/Whack-a-Mole-GameMachine/game_machine/game_machine.gen/sources_1/ip/ila_0/ila_0_stub.v
// Design      : ila_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7a200tfbg484-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "ila,Vivado 2023.2" *)
module ila_0(clk, probe0, probe1, probe2, probe3)
/* synthesis syn_black_box black_box_pad_pin="probe0[3:0],probe1[3:0],probe2[7:0],probe3[0:0]" */
/* synthesis syn_force_seq_prim="clk" */;
  input clk /* synthesis syn_isclock = 1 */;
  input [3:0]probe0;
  input [3:0]probe1;
  input [7:0]probe2;
  input [0:0]probe3;
endmodule
