--
-- vhdl architecture raro_ikr_risc_ii_lib.mux_dc.behav
--
-- created:
--          by - lspetrck.meyer (pc091)
--          at - 17:05:06 05/18/22
--
-- using mentor graphics hdl designer(tm) 2020.2 built on 12 apr 2020 at 11:28:22
--
architecture behav of mux_dc is
begin
  ra_in <= a_imm when (sel_imm = '1') else rf_mux_a;
  
end architecture behav;

