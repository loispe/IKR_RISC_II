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
  VARIABLE SEL : std_logic_vector (1 downto 0);
  begin
    SEL := sbta_valid & dbta_valid;
    CASE SEL IS
      WHEN "10" =>
        rPC_in <= rSbpu_pc_in;
      WHEN "01" | "11" =>
        rPC_in <= Dbpu_PC;        
      WHEN OTHERS =>
        rPc_in <= std_logic_vector(unsigned(rPc_out) + 1);
    END CASE;
  end process;
    
END ARCHITECTURE behav;

