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
  
BEGIN
  PROCESS (all) 
  VARIABLE sel  : std_logic;
  BEGIN
    sel := sbta_valid OR dbta_valid;
    IF sel = '0' THEN
      IF to_integer(unsigned(rPc_out)) <= memory_depth - 1 THEN
          rOpcode_in <= mem_content(to_integer(unsigned(rPc_out)));
      ELSE 
          rOpcode_in <= 32x"0";
      END IF;
    ELSE
      rOpcode_in <= NOP;
    END IF;
  END PROCESS;

      
END ARCHITECTURE behav;

