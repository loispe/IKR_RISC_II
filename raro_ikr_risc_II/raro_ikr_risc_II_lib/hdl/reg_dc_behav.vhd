--
-- VHDL Architecture raro_ikr_risc_II_lib.reg_dc.behav
--
-- Created:
--          by - lspetrck.meyer (pc091)
--          at - 17:21:24 05/11/22
--
-- using Mentor Graphics HDL Designer(TM) 2020.2 Built on 12 Apr 2020 at 11:28:22
--
ARCHITECTURE behav OF reg_if_dc IS
BEGIN
  reg: process(clk, res_n) is
  begin
    if res_n = '0' then
      rOpcode_out <= (others => '0');
      rNextPc_in_dc <= (others => '0');
      sel_rME_out <= (others => '0');
      sel_rWB_out <= (others => '0');

    else
      if clk'event and clk = '1' then
        rOpcode_out <= rOpcode_in;
        rNextPc_in_dc <= rPc_in;
        sel_rME_out <= sel_rME_in;
        sel_rWB_out <= sel_rWB_in;
      end if;
    end if;
  end process;
END ARCHITECTURE behav;

