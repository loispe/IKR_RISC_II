--
-- VHDL Architecture raro_ikr_risc_II_lib.raro_ikr_risc_II.struct
--
-- Created:
--          by - kntntply.meyer (pc091)
--          at - 17:52:18 06/01/22
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2020.2 Built on 12 Apr 2020 at 11:28:22
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;
LIBRARY raro_ikr_risc_II_lib;
USE raro_ikr_risc_II_lib.internal_types.all;USE raro_ikr_risc_II_lib.isa_types.ALL;


ARCHITECTURE struct OF raro_ikr_risc_II IS

   -- Architecture declarations

   -- Internal signal declarations
   SIGNAL rALU_in           : word;
   SIGNAL rALU_out          : word;
   SIGNAL rA_in             : word;
   SIGNAL rA_out            : word;
   SIGNAL rAluMode_in       : alu_mode_type;
   SIGNAL rAluMode_out      : alu_mode_type;
   SIGNAL rB_in             : word;
   SIGNAL rB_out            : word;
   SIGNAL rC_in             : word;
   SIGNAL rC_out            : word;
   SIGNAL rFwd_sela_in_dc   : fwd_mode_type;
   SIGNAL rFwd_sela_out_ex  : fwd_mode_type;
   SIGNAL rFwd_selb_in_dc   : fwd_mode_type;
   SIGNAL rFwd_selb_out_ex  : fwd_mode_type;
   SIGNAL rFwd_selc_in_dc   : fwd_mode_type;
   SIGNAL rFwd_selc_out_ex  : fwd_mode_type;
   SIGNAL rFwd_selsd_in_dc  : fwd_mode_type;
   SIGNAL rFwd_selsd_out_ex : fwd_mode_type;
   SIGNAL rFwd_selsd_out_me : fwd_mode_type;
   SIGNAL rME_in            : word;
   SIGNAL rME_out           : word;
   SIGNAL rMemMode_in_dc    : mem_mode_type;
   SIGNAL rMemMode_out_ex   : mem_mode_type;
   SIGNAL rMemMode_out_me   : mem_mode_type;
   SIGNAL rNextPC_out_ex    : word;
   SIGNAL rNextPc_in_dc     : word;
   SIGNAL rOpcode_in        : word;
   SIGNAL rOpcode_out       : word;
   SIGNAL rPc_in            : word;
   SIGNAL rPc_out           : word;
   SIGNAL rStoreData_in     : word;
   SIGNAL rStoreData_out    : word;
   SIGNAL rTargetReg_in_dc  : reg_addr_type;
   SIGNAL rTargetReg_out_ex : reg_addr_type;
   SIGNAL rTargetReg_out_me : reg_addr_type;
   SIGNAL rTargetReg_out_wb : reg_addr_type;


   -- Component Declarations
   COMPONENT mux_init
   PORT (
      rPc_out : IN     word ;
      rPc_in  : OUT    word 
   );
   END COMPONENT;
   COMPONENT reg_dc_ex
   PORT (
      clk               : IN     std_logic ;
      rA_in             : IN     word ;
      rAluMode_in       : IN     alu_mode_type ;
      rB_in             : IN     word ;
      rC_in             : IN     word ;
      rFwd_sela_in_dc   : IN     fwd_mode_type ;
      rFwd_selb_in_dc   : IN     fwd_mode_type ;
      rFwd_selc_in_dc   : IN     fwd_mode_type ;
      rFwd_selsd_in_dc  : IN     fwd_mode_type ;
      rMemMode_in_dc    : IN     mem_mode_type ;
      rNextPc_in_dc     : IN     word ;
      rTargetReg_in_dc  : IN     reg_addr_type ;
      res_n             : IN     std_logic ;
      rA_out            : OUT    word ;
      rAluMode_out      : OUT    alu_mode_type ;
      rB_out            : OUT    word ;
      rC_out            : OUT    word ;
      rFwd_sela_out_ex  : OUT    fwd_mode_type ;
      rFwd_selb_out_ex  : OUT    fwd_mode_type ;
      rFwd_selc_out_ex  : OUT    fwd_mode_type ;
      rFwd_selsd_out_ex : OUT    fwd_mode_type ;
      rMemMode_out_ex   : OUT    mem_mode_type ;
      rNextPC_out_ex    : OUT    word ;
      rTargetReg_out_ex : OUT    reg_addr_type 
   );
   END COMPONENT;
   COMPONENT reg_ex_me
   PORT (
      clk               : IN     std_logic ;
      rALU_in           : IN     word ;
      rFwd_selsd_out_ex : IN     fwd_mode_type ;
      rMemMode_out_ex   : IN     mem_mode_type ;
      rStoreData_in     : IN     word ;
      rTargetReg_out_ex : IN     reg_addr_type ;
      res_n             : IN     std_logic ;
      rALU_out          : OUT    word ;
      rFwd_selsd_out_me : OUT    fwd_mode_type ;
      rMemMode_out_me   : OUT    mem_mode_type ;
      rStoreData_out    : OUT    word ;
      rTargetReg_out_me : OUT    reg_addr_type 
   );
   END COMPONENT;
   COMPONENT reg_if_dc
   PORT (
      clk           : IN     std_logic ;
      rOpcode_in    : IN     word ;
      rPc_in        : IN     word ;
      res_n         : IN     std_logic ;
      rNextPc_in_dc : OUT    word ;
      rOpcode_out   : OUT    word 
   );
   END COMPONENT;
   COMPONENT reg_me_wb
   PORT (
      clk               : IN     std_logic ;
      rME_in            : IN     word ;
      rTargetReg_out_me : IN     reg_addr_type ;
      res_n             : IN     std_logic ;
      rME_out           : OUT    word ;
      rTargetReg_out_wb : OUT    reg_addr_type 
   );
   END COMPONENT;
   COMPONENT reg_pc
   PORT (
      clk     : IN     std_logic ;
      rPc_in  : IN     word ;
      res_n   : IN     std_logic ;
      rPc_out : OUT    word 
   );
   END COMPONENT;
   COMPONENT step_dc
   PORT (
      clk               : IN     std_logic ;
      rME_out           : IN     word ;
      rOpcode_out       : IN     word ;
      rTargetReg_out_wb : IN     reg_addr_type ;
      res_n             : IN     std_logic ;
      rA_in             : OUT    word ;
      rAluMode_in       : OUT    alu_mode_type ;
      rB_in             : OUT    word ;
      rC_in             : OUT    word ;
      rFwd_sela_in_dc   : OUT    fwd_mode_type ;
      rFwd_selb_in_dc   : OUT    fwd_mode_type ;
      rFwd_selc_in_dc   : OUT    fwd_mode_type ;
      rFwd_selsd_in_dc  : OUT    fwd_mode_type ;
      rMemMode_in_dc    : OUT    mem_mode_type ;
      rTargetReg_in_dc  : OUT    reg_addr_type 
   );
   END COMPONENT;
   COMPONENT step_ex
   PORT (
      rALU_out         : IN     word ;
      rA_out           : IN     word ;
      rAluMode_out     : IN     alu_mode_type ;
      rB_out           : IN     word ;
      rC_out           : IN     word ;
      rFwd_sela_out_ex : IN     fwd_mode_type ;
      rFwd_selb_out_ex : IN     fwd_mode_type ;
      rFwd_selc_out_ex : IN     fwd_mode_type ;
      rME_out          : IN     word ;
      rNextPC_out_ex   : IN     word ;
      rALU_in          : OUT    word ;
      rStoreData_in    : OUT    word 
   );
   END COMPONENT;
   COMPONENT step_if
   PORT (
      rPc_out    : IN     word ;
      rOpcode_in : OUT    word 
   );
   END COMPONENT;
   COMPONENT step_me
   PORT (
      clk               : IN     std_logic ;
      rALU_in           : IN     word ;
      rALU_out          : IN     word ;
      rFwd_selsd_out_me : IN     fwd_mode_type ;
      rME_out           : IN     word ;
      rMemMode_out_me   : IN     mem_mode_type ;
      rStoreData_out    : IN     word ;
      res_n             : IN     std_logic ;
      rME_in            : OUT    word 
   );
   END COMPONENT;

   -- Optional embedded configurations
   -- pragma synthesis_off
   FOR ALL : mux_init USE ENTITY raro_ikr_risc_II_lib.mux_init;
   FOR ALL : reg_dc_ex USE ENTITY raro_ikr_risc_II_lib.reg_dc_ex;
   FOR ALL : reg_ex_me USE ENTITY raro_ikr_risc_II_lib.reg_ex_me;
   FOR ALL : reg_if_dc USE ENTITY raro_ikr_risc_II_lib.reg_if_dc;
   FOR ALL : reg_me_wb USE ENTITY raro_ikr_risc_II_lib.reg_me_wb;
   FOR ALL : reg_pc USE ENTITY raro_ikr_risc_II_lib.reg_pc;
   FOR ALL : step_dc USE ENTITY raro_ikr_risc_II_lib.step_dc;
   FOR ALL : step_ex USE ENTITY raro_ikr_risc_II_lib.step_ex;
   FOR ALL : step_if USE ENTITY raro_ikr_risc_II_lib.step_if;
   FOR ALL : step_me USE ENTITY raro_ikr_risc_II_lib.step_me;
   -- pragma synthesis_on


BEGIN

   -- Instance port mappings.
   U_0 : mux_init
      PORT MAP (
         rPc_out => rPc_out,
         rPc_in  => rPc_in
      );
   U_6 : reg_dc_ex
      PORT MAP (
         clk               => clk,
         rA_in             => rA_in,
         rAluMode_in       => rAluMode_in,
         rB_in             => rB_in,
         rC_in             => rC_in,
         rFwd_sela_in_dc   => rFwd_sela_in_dc,
         rFwd_selb_in_dc   => rFwd_selb_in_dc,
         rFwd_selc_in_dc   => rFwd_selc_in_dc,
         rFwd_selsd_in_dc  => rFwd_selsd_in_dc,
         rMemMode_in_dc    => rMemMode_in_dc,
         rNextPc_in_dc     => rNextPc_in_dc,
         rTargetReg_in_dc  => rTargetReg_in_dc,
         res_n             => res_n,
         rA_out            => rA_out,
         rAluMode_out      => rAluMode_out,
         rB_out            => rB_out,
         rC_out            => rC_out,
         rFwd_sela_out_ex  => rFwd_sela_out_ex,
         rFwd_selb_out_ex  => rFwd_selb_out_ex,
         rFwd_selc_out_ex  => rFwd_selc_out_ex,
         rFwd_selsd_out_ex => rFwd_selsd_out_ex,
         rMemMode_out_ex   => rMemMode_out_ex,
         rNextPC_out_ex    => rNextPC_out_ex,
         rTargetReg_out_ex => rTargetReg_out_ex
      );
   U_8 : reg_ex_me
      PORT MAP (
         clk               => clk,
         rALU_in           => rALU_in,
         rFwd_selsd_out_ex => rFwd_selsd_out_ex,
         rMemMode_out_ex   => rMemMode_out_ex,
         rStoreData_in     => rStoreData_in,
         rTargetReg_out_ex => rTargetReg_out_ex,
         res_n             => res_n,
         rALU_out          => rALU_out,
         rFwd_selsd_out_me => rFwd_selsd_out_me,
         rMemMode_out_me   => rMemMode_out_me,
         rStoreData_out    => rStoreData_out,
         rTargetReg_out_me => rTargetReg_out_me
      );
   U_4 : reg_if_dc
      PORT MAP (
         clk           => clk,
         rOpcode_in    => rOpcode_in,
         rPc_in        => rPc_in,
         res_n         => res_n,
         rNextPc_in_dc => rNextPc_in_dc,
         rOpcode_out   => rOpcode_out
      );
   U_11 : reg_me_wb
      PORT MAP (
         clk               => clk,
         rME_in            => rME_in,
         rTargetReg_out_me => rTargetReg_out_me,
         res_n             => res_n,
         rME_out           => rME_out,
         rTargetReg_out_wb => rTargetReg_out_wb
      );
   U_2 : reg_pc
      PORT MAP (
         clk     => clk,
         rPc_in  => rPc_in,
         res_n   => res_n,
         rPc_out => rPc_out
      );
   U_5 : step_dc
      PORT MAP (
         clk               => clk,
         rME_out           => rME_out,
         rOpcode_out       => rOpcode_out,
         rTargetReg_out_wb => rTargetReg_out_wb,
         res_n             => res_n,
         rA_in             => rA_in,
         rAluMode_in       => rAluMode_in,
         rB_in             => rB_in,
         rC_in             => rC_in,
         rFwd_sela_in_dc   => rFwd_sela_in_dc,
         rFwd_selb_in_dc   => rFwd_selb_in_dc,
         rFwd_selc_in_dc   => rFwd_selc_in_dc,
         rFwd_selsd_in_dc  => rFwd_selsd_in_dc,
         rMemMode_in_dc    => rMemMode_in_dc,
         rTargetReg_in_dc  => rTargetReg_in_dc
      );
   U_7 : step_ex
      PORT MAP (
         rALU_out         => rALU_out,
         rA_out           => rA_out,
         rAluMode_out     => rAluMode_out,
         rB_out           => rB_out,
         rC_out           => rC_out,
         rFwd_sela_out_ex => rFwd_sela_out_ex,
         rFwd_selb_out_ex => rFwd_selb_out_ex,
         rFwd_selc_out_ex => rFwd_selc_out_ex,
         rME_out          => rME_out,
         rNextPC_out_ex   => rNextPC_out_ex,
         rALU_in          => rALU_in,
         rStoreData_in    => rStoreData_in
      );
   U_3 : step_if
      PORT MAP (
         rPc_out    => rPc_out,
         rOpcode_in => rOpcode_in
      );
   U_9 : step_me
      PORT MAP (
         clk               => clk,
         rALU_in           => rALU_in,
         rALU_out          => rALU_out,
         rFwd_selsd_out_me => rFwd_selsd_out_me,
         rME_out           => rME_out,
         rMemMode_out_me   => rMemMode_out_me,
         rStoreData_out    => rStoreData_out,
         res_n             => res_n,
         rME_in            => rME_in
      );

END struct;
