--
-- vhdl architecture raro_ikr_risc_ii_lib.step_dc.struct
--
-- created:
--          by - kntntply.meyer (pc091)
--          at - 13:50:07 07/06/22
--
-- generated by mentor graphics' hdl designer(tm) 2020.2 built on 12 apr 2020 at 11:28:22
--
library ieee;
use ieee.std_logic_1164.all;
library raro_ikr_risc_ii_lib;
use raro_ikr_risc_ii_lib.internal_types.all;
use raro_ikr_risc_ii_lib.isa_types.all;


architecture struct of step_dc is

   -- architecture declarations

   -- internal signal declarations
   signal a_imm    : word;
   signal rf_mux_a : word;
   signal sel_a    : reg_addr_type;
   signal sel_b    : reg_addr_type;
   signal sel_c    : reg_addr_type;
   signal sel_imm  : std_logic;


   -- component declarations
   component dec_dc
   port (
      dbta_valid        : in     std_logic ;
      rmemmode_out_ex   : in     mem_mode_type ;
      ropcode_out       : in     word ;
      rtargetreg_out_ex : in     reg_addr_type ;
      rtargetreg_out_me : in     reg_addr_type ;
      a_imm             : out    word ;
      disp              : out    word ;
      ralumode_in       : out    alu_mode_type ;
      rdbpu_mode_in     : out    dbpu_mode_type ;
      rfwd_sela_in_dc   : out    fwd_mode_type ;
      rfwd_selb_in_dc   : out    fwd_mode_type ;
      rfwd_selc_in_dc   : out    fwd_mode_type ;
      rfwd_selsd_in_dc  : out    fwd_mode_type ;
      rmemmode_in_dc    : out    mem_mode_type ;
      rtargetreg_in_dc  : out    reg_addr_type ;
      sbpu_mode         : out    sbpu_mode_type ;
      sel_a             : out    reg_addr_type ;
      sel_b             : out    reg_addr_type ;
      sel_c             : out    reg_addr_type ;
      sel_imm           : out    std_logic ;
      stall_dc          : out    std_logic 
   );
   end component;
   component mux_dc
   port (
      a_imm    : in     word ;
      rf_mux_a : in     word ;
      sel_imm  : in     std_logic ;
      ra_in    : out    word 
   );
   end component;
   component rf_dc
   port (
      clk               : in     std_logic ;
      rme_out           : in     word ;
      rtargetreg_out_wb : in     reg_addr_type ;
      res_n             : in     std_logic ;
      sel_a             : in     reg_addr_type ;
      sel_b             : in     reg_addr_type ;
      sel_c             : in     reg_addr_type ;
      rb_in             : out    word ;
      rc_in             : out    word ;
      rf_mux_a          : out    word 
   );
   end component;

   -- optional embedded configurations
   -- pragma synthesis_off
   for all : dec_dc use entity raro_ikr_risc_ii_lib.dec_dc;
   for all : mux_dc use entity raro_ikr_risc_ii_lib.mux_dc;
   for all : rf_dc use entity raro_ikr_risc_ii_lib.rf_dc;
   -- pragma synthesis_on


begin

   -- instance port mappings.
   u_0 : dec_dc
      port map (
         dbta_valid        => dbta_valid,
         rmemmode_out_ex   => rmemmode_out_ex,
         ropcode_out       => ropcode_out,
         rtargetreg_out_ex => rtargetreg_out_ex,
         rtargetreg_out_me => rtargetreg_out_me,
         a_imm             => a_imm,
         disp              => disp,
         ralumode_in       => ralumode_in,
         rdbpu_mode_in     => rdbpu_mode_in,
         rfwd_sela_in_dc   => rfwd_sela_in_dc,
         rfwd_selb_in_dc   => rfwd_selb_in_dc,
         rfwd_selc_in_dc   => rfwd_selc_in_dc,
         rfwd_selsd_in_dc  => rfwd_selsd_in_dc,
         rmemmode_in_dc    => rmemmode_in_dc,
         rtargetreg_in_dc  => rtargetreg_in_dc,
         sbpu_mode         => sbpu_mode,
         sel_a             => sel_a,
         sel_b             => sel_b,
         sel_c             => sel_c,
         sel_imm           => sel_imm,
         stall_dc          => stall_dc
      );
   u_2 : mux_dc
      port map (
         a_imm    => a_imm,
         rf_mux_a => rf_mux_a,
         sel_imm  => sel_imm,
         ra_in    => ra_in
      );
   u_1 : rf_dc
      port map (
         clk               => clk,
         rme_out           => rme_out,
         rtargetreg_out_wb => rtargetreg_out_wb,
         res_n             => res_n,
         sel_a             => sel_a,
         sel_b             => sel_b,
         sel_c             => sel_c,
         rb_in             => rb_in,
         rc_in             => rc_in,
         rf_mux_a          => rf_mux_a
      );

end struct;
