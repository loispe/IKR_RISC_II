--
-- VHDL Architecture raro_ikr_risc_II_lib.step_dc.struct
--
-- Created:
--          by - lspetrck.meyer (pc091)
--          at - 13:26:50 06/15/22
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2020.2 Built on 12 Apr 2020 at 11:28:22
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
LIBRARY raro_ikr_risc_II_lib;
USE raro_ikr_risc_II_lib.internal_types.ALL;
USE raro_ikr_risc_II_lib.isa_types.ALL;


ARCHITECTURE struct OF step_dc IS

   -- Architecture declarations

   -- Internal signal declarations
   SIGNAL a_imm    : word;
   SIGNAL rf_mux_a : word;
   SIGNAL sel_a    : reg_addr_type;
   SIGNAL sel_b    : reg_addr_type;
   SIGNAL sel_c    : reg_addr_type;
   SIGNAL sel_imm  : std_logic;


   -- Component Declarations
   COMPONENT DEC_dc
   PORT (
      rMemMode_out_ex   : IN     mem_mode_type ;
      rOpcode_out       : IN     word ;
      rTargetReg_out_ex : IN     reg_addr_type ;
      rTargetReg_out_me : IN     reg_addr_type ;
      a_imm             : OUT    word ;
      rAluMode_in       : OUT    alu_mode_type ;
      rFwd_sela_in_dc   : OUT    fwd_mode_type ;
      rFwd_selb_in_dc   : OUT    fwd_mode_type ;
      rFwd_selc_in_dc   : OUT    fwd_mode_type ;
      rFwd_selsd_in_dc  : OUT    fwd_mode_type ;
      rMemMode_in_dc    : OUT    mem_mode_type ;
      rTargetReg_in_dc  : OUT    reg_addr_type ;
      sel_a             : OUT    reg_addr_type ;
      sel_b             : OUT    reg_addr_type ;
      sel_c             : OUT    reg_addr_type ;
      sel_imm           : OUT    std_logic ;
      stall_dc          : OUT    std_logic 
   );
   END COMPONENT;
   COMPONENT MUX_dc
   PORT (
      a_imm    : IN     word ;
      rf_mux_a : IN     word ;
      sel_imm  : IN     std_logic ;
      rA_in    : OUT    word 
   );
   END COMPONENT;
   COMPONENT RF_dc
   PORT (
      clk               : IN     std_logic ;
      rME_out           : IN     word ;
      rTargetReg_out_wb : IN     reg_addr_type ;
      res_n             : IN     std_logic ;
      sel_a             : IN     reg_addr_type ;
      sel_b             : IN     reg_addr_type ;
      sel_c             : IN     reg_addr_type ;
      rB_in             : OUT    word ;
      rC_in             : OUT    word ;
      rf_mux_a          : OUT    word 
   );
   END COMPONENT;

   -- Optional embedded configurations
   -- pragma synthesis_off
   FOR ALL : DEC_dc USE ENTITY raro_ikr_risc_II_lib.DEC_dc;
   FOR ALL : MUX_dc USE ENTITY raro_ikr_risc_II_lib.MUX_dc;
   FOR ALL : RF_dc USE ENTITY raro_ikr_risc_II_lib.RF_dc;
   -- pragma synthesis_on


BEGIN

   -- Instance port mappings.
   U_0 : DEC_dc
      PORT MAP (
         rMemMode_out_ex   => rMemMode_out_ex,
         rOpcode_out       => rOpcode_out,
         rTargetReg_out_ex => rTargetReg_out_ex,
         rTargetReg_out_me => rTargetReg_out_me,
         a_imm             => a_imm,
         rAluMode_in       => rAluMode_in,
         rFwd_sela_in_dc   => rFwd_sela_in_dc,
         rFwd_selb_in_dc   => rFwd_selb_in_dc,
         rFwd_selc_in_dc   => rFwd_selc_in_dc,
         rFwd_selsd_in_dc  => rFwd_selsd_in_dc,
         rMemMode_in_dc    => rMemMode_in_dc,
         rTargetReg_in_dc  => rTargetReg_in_dc,
         sel_a             => sel_a,
         sel_b             => sel_b,
         sel_c             => sel_c,
         sel_imm           => sel_imm,
         stall_dc          => stall_dc
      );
   U_2 : MUX_dc
      PORT MAP (
         a_imm    => a_imm,
         rf_mux_a => rf_mux_a,
         sel_imm  => sel_imm,
         rA_in    => rA_in
      );
   U_1 : RF_dc
      PORT MAP (
         clk               => clk,
         rME_out           => rME_out,
         rTargetReg_out_wb => rTargetReg_out_wb,
         res_n             => res_n,
         sel_a             => sel_a,
         sel_b             => sel_b,
         sel_c             => sel_c,
         rB_in             => rB_in,
         rC_in             => rC_in,
         rf_mux_a          => rf_mux_a
      );

END struct;
