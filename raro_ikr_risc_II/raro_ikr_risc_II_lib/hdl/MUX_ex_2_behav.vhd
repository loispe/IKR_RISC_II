--
-- VHDL Architecture raro_ikr_risc_II_lib.MUX_ex_2.behav
--
-- Created:
--          by - lspetrck.meyer (pc091)
--          at - 17:37:28 05/18/22
--
-- using Mentor Graphics HDL Designer(TM) 2020.2 Built on 12 Apr 2020 at 11:28:22
--
ARCHITECTURE behav OF MUX_ex_2 IS
BEGIN
  with rFwd_selb_out_ex select  
    mux_ALU_B <=  rB_out    when fwd_idle,
                  rME_out   when fwd_rME,
                  rALU_out  when fwd_rALU,
                  rB_out    when others;
END ARCHITECTURE behav;

