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
  --type memory_type is array(natural range <>) of word;  --nicht synthetisierbar
  constant rom: memory_type :=  (0 => 6x"00" & 5x"01" & 5x"02" & 16x"04", --addi rc = 1 rb = 2 (=5) imm = #4 
                                1 => x"0000_0011",
                                2 => x"0000_0012",
                                3 => x"0000_0013",
                                4 => x"0000_0014",
                                5 => x"0000_0015",
                                6 => x"0000_0016",
                                7 => 6x"3F" & 5x"03" & 5x"02" & 6x"0" & 5x"-" & 5x"1", --add rc = 3 rb = 2 (=5) ra = 1 (=9)
                                8 => x"0000_0018",
                                9 => x"0000_0019",
                                10 => x"0000_001A",
                                11 => x"0000_001B",
                                12 => x"0000_001C",
                                13 => x"0000_001D",
                                14 => 6x"3F" & 5x"04" & 5x"01" & 6x"02" & 5x"-" & 5x"3", --sub rc = 4 rb = 1 (=9) ra = 3 (=E)
                                others => 32x"0"                                
                                
                                );
  
BEGIN
  rOpcode_in <= rom(to_integer(unsigned(rPc_out)));
      
END ARCHITECTURE behav;

