--
-- vhdl architecture raro_ikr_risc_ii_lib.mux_ex_4.behav
--
-- created:
--          by - lspetrck.meyer (pc086)
--          at - 18:01:05 05/24/22
--
-- using mentor graphics hdl designer(tm) 2020.2 built on 12 apr 2020 at 11:28:22
--
architecture behav of mux_ex_4 is
begin
  ralu_in <= alu_out when sel_alu_pc = '0' else rnextpc_out_ex;
end architecture behav;

