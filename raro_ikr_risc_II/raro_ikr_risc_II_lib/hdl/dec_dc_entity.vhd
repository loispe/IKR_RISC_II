-- VHDL Entity raro_ikr_risc_II_lib.DEC_dc.interface
--
-- Created:
--          by - lspetrck.meyer (pc091)
--          at - 14:58:35 06/15/22
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2020.2 Built on 12 Apr 2020 at 11:28:22
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
LIBRARY raro_ikr_risc_II_lib;
USE raro_ikr_risc_II_lib.internal_types.ALL;
USE raro_ikr_risc_II_lib.isa_types.ALL;

ENTITY DEC_dc IS
   PORT( 
      rMemMode_out_ex   : IN     mem_mode_type;
      rOpcode_out       : IN     word;
      rTargetReg_out_ex : IN     reg_addr_type;
      rTargetReg_out_me : IN     reg_addr_type;
      a_imm             : OUT    word;
      disp              : OUT    word;
      rAluMode_in       : OUT    alu_mode_type;
      rDbpu_mode_in     : OUT    dbpu_mode_type;
      rFwd_sela_in_dc   : OUT    fwd_mode_type;
      rFwd_selb_in_dc   : OUT    fwd_mode_type;
      rFwd_selc_in_dc   : OUT    fwd_mode_type;
      rFwd_selsd_in_dc  : OUT    fwd_mode_type;
      rMemMode_in_dc    : OUT    mem_mode_type;
      rTargetReg_in_dc  : OUT    reg_addr_type;
      sbpu_mode         : OUT    sbpu_mode_type;
      sel_a             : OUT    reg_addr_type;
      sel_b             : OUT    reg_addr_type;
      sel_c             : OUT    reg_addr_type;
      sel_imm           : OUT    std_logic;
      stall_dc          : OUT    std_logic
   );

-- Declarations

END DEC_dc ;

