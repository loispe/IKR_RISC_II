--
-- VHDL Architecture raro_ikr_risc_II_lib.step_if.behav
--
-- Created:
--          by - lspetrck.meyer (pc091)
--          at - 17:07:35 05/11/22
--
-- using Mentor Graphics HDL Designer(TM) 2020.2 Built on 12 Apr 2020 at 11:28:22
--
LIBRARY ieee;
use ieee.numeric_std.all;

ARCHITECTURE behav OF step_if IS
  type memory_type is array(0 to memory_depth - 1) of word;
  constant rom: memory_type :=  (0 =>  "000000_00001_00000" & x"0005", --addi $00_rc_rb_#imm
                                1 => x"0000_0014",
                                2 => x"0000_0015",
                                3 => x"0000_0016");
  
BEGIN
  rOpcode_in <= rom(to_integer(unsigned(rPc_out)));
      
END ARCHITECTURE behav;

