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
LIBRARY raro_ikr_risc_II_lib;
USE raro_ikr_risc_II_lib.mem_contents.all;

ARCHITECTURE behav OF step_if IS
  type memory_type is array(0 to memory_depth - 1) of word;
  --type memory_type is array(natural range <>) of word;  --nicht synthetisierbar
  /*constant rom: memory_type :=  
                              (
                                0      => 6X"14" & 5X"A" & 5X"0" & 16D"5",                  -- std  rc = 10, rb = 0, imm = 5
                                1      => 6X"00" & 5X"1" & 5X"0" & 16D"5",                  -- addi rc = 1,  rb = 0, imm = 5
                                2      => 6X"00" & 5X"2" & 5X"0" & 16D"10",                 -- addi rc = 2,  rb = 0, imm = 10
                                3      => 6X"3F" & 5X"3" & 5X"1" & 6x"0" & 5x"-" & 5x"2",   -- add  rc = 3,  rb = 1, ra = 2
                                4      => 6X"3F" & 5X"4" & 5X"2" & 6x"0" & 5x"-" & 5x"0",   -- add  rc = 4,  rb = 2, ra = 0
                                5      => 6X"10" & 5X"5" & 5X"1" & 16D"0",                  -- ldd  rc = 5,  rb = 1, imm = 0
                                6      => 6X"14" & 5X"5" & 5X"2" & 16D"0",                  -- std  rc = 5, rb = 2, imm = 0
                                7      => 6X"10" & 5X"6" & 5X"1" & 16D"0",                  -- ldd  rc = 6,  rb = 1, imm = 0
                                8      => 6X"3F" & 5X"7" & 5X"6" & 6x"0" & 5x"-" & 5x"2",   -- add  rc = 7,  rb = 6, ra = 2
                                others => 32x"0"                                
                                
                                );*/
  
BEGIN
  PROCESS (all) 
  VARIABLE sel  : std_logic_vector (1 downto 0);
  BEGIN
    sel := sbta_valid & '0'/*dbta_valid*/;
    CASE sel is
      WHEN "10" =>
        rOpcode_in <= NOP;
      WHEN "01" =>
        rOpcode_in <= NOP;
      WHEN "11" =>
        rOpcode_in <= NOP;
      WHEN OTHERS =>
        rOpcode_in <= mem_content(to_integer(unsigned(rPc_out))) when to_integer(unsigned(rPc_out)) <= memory_depth - 1 else 32x"0";
    END CASE;
  END PROCESS;

  --rOpcode_in <= rom(to_integer(unsigned(rPc_out)));

      
END ARCHITECTURE behav;

