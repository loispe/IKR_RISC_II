--
-- VHDL Architecture raro_ikr_risc_II_lib.MUX_dc.behav
--
-- Created:
--          by - lspetrck.meyer (pc091)
--          at - 17:05:06 05/18/22
--
-- using Mentor Graphics HDL Designer(TM) 2020.2 Built on 12 Apr 2020 at 11:28:22
--
ARCHITECTURE behav OF MUX_dc IS
BEGIN
  rA_in <= a_imm when (sel_imm = '1') else rf_mux_a;
  
END ARCHITECTURE behav;

