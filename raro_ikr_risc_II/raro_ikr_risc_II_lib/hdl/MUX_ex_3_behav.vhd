--
-- VHDL Architecture raro_ikr_risc_II_lib.MUX_ex_3.behav
--
-- Created:
--          by - lspetrck.meyer (pc091)
--          at - 17:38:11 05/18/22
--
-- using Mentor Graphics HDL Designer(TM) 2020.2 Built on 12 Apr 2020 at 11:28:22
--
ARCHITECTURE behav OF MUX_ex_3 IS
BEGIN
  with rFwd_selc_out_ex select  
    rStoreData_in <=  rC_out    when fwd_idle,
                      rME_out   when fwd_WB,
                      rALU_out  when fwd_ME,
                      rC_out    when others;
END ARCHITECTURE behav;

