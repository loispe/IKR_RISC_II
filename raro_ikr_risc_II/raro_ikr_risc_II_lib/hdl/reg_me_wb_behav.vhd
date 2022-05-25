--
-- VHDL Architecture raro_ikr_risc_II_lib.reg_me_wb.behav
--
-- Created:
--          by - lspetrck.meyer (pc091)
--          at - 14:58:26 05/25/22
--
-- using Mentor Graphics HDL Designer(TM) 2020.2 Built on 12 Apr 2020 at 11:28:22
--
ARCHITECTURE behav OF reg_me_wb IS
BEGIN
  reg: process(clk, res_n) is
  begin
    if res_n = '0' then
      rME_out             <= (others => '0');
      rTargetReg_out_wb   <= (others => '0');
    else
      if clk'event and clk = '1' then
        rME_out           <= rME_in;
        rTargetReg_out_wb <= rTargetReg_out_me;
      end if;
    end if;
  end process reg;
END ARCHITECTURE behav;

