--
-- VHDL Architecture raro_ikr_risc_II_lib.mux_clock.behav
--
-- Created:
--          by - kntntply.meyer (pc091)
--          at - 14:33:07 07/13/22
--
-- using Mentor Graphics HDL Designer(TM) 2020.2 Built on 12 Apr 2020 at 11:28:22
--
ARCHITECTURE behav OF mux_clock IS
BEGIN
  clk <= std_clk WHEN sel_clk = '0' ELSE man_clk;
END ARCHITECTURE behav;

