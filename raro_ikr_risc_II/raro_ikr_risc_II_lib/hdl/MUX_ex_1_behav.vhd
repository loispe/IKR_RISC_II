--
-- vhdl architecture raro_ikr_risc_ii_lib.mux_ex_1.behav
--
-- created:
--          by - lspetrck.meyer (pc091)
--          at - 17:36:21 05/18/22
--
-- using mentor graphics hdl designer(tm) 2020.2 built on 12 apr 2020 at 11:28:22
--
architecture behav of mux_ex_1 is
begin
  with rfwd_sela_out_ex select
    mux_alu_a <=  ra_out    when fwd_idle,
                  rme_out   when fwd_wb,
                  ralu_out  when fwd_me,
                  ra_out    when others;

end architecture behav;

