--
-- VHDL Architecture raro_ikr_risc_II_lib.reg_dc.behav
--
-- Created:
--          by - lspetrck.meyer (pc091)
--          at - 17:21:24 05/11/22
--
-- using Mentor Graphics HDL Designer(TM) 2020.2 Built on 12 Apr 2020 at 11:28:22
--
ARCHITECTURE behav OF reg_dc IS
BEGIN
  reg: process(clk, res_n) is
  begin
    if res_n = '0' then
      dc_out_rOpcode <= (others => '0');
      dc_inOut_rNextPc <= (others => '0');
    else
      if clk'event and clk = '1' then
        dc_out_rOpcode <= dc_in_rOpcode;
        dc_inOut_rNextPc <= if_in_rPc;
      end if;
    end if;
  end process;
END ARCHITECTURE behav;

