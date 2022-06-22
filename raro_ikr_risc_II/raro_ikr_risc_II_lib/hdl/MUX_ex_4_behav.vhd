--
-- VHDL Architecture raro_ikr_risc_II_lib.MUX_ex_4.behav
--
-- Created:
--          by - lspetrck.meyer (pc086)
--          at - 18:01:05 05/24/22
--
-- using Mentor Graphics HDL Designer(TM) 2020.2 Built on 12 Apr 2020 at 11:28:22
--
ARCHITECTURE behav OF MUX_ex_4 IS
BEGIN
  rALU_in <= ALU_out WHEN sel_ALU_PC = '0' ELSE rNextPC_out_ex;
END ARCHITECTURE behav;

