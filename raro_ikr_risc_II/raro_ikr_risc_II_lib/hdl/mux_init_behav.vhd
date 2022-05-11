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
  
  if_in_rPc <= std_logic_vector(unsigned(if_out_rPc) + 1);
  
  
END ARCHITECTURE behav;

