--
-- VHDL Architecture raro_ikr_risc_II_lib.mux_init.behav
--
-- Created:
--          by - lspetrck.meyer (pc091)
--          at - 16:48:26 05/11/22
--
-- using Mentor Graphics HDL Designer(TM) 2020.2 Built on 12 Apr 2020 at 11:28:22
--
library IEEE;
use IEEE.numeric_std.all;

ARCHITECTURE behav OF mux_init IS
BEGIN
  
  process(rPc_out) is
  begin
    IF sbta_valid = '1' THEN
      rPC_in <= sbpu_pc;
    ELSE
      rPc_in <= std_logic_vector(unsigned(rPc_out) + 1);
    END IF;
  end process;
    
END ARCHITECTURE behav;

