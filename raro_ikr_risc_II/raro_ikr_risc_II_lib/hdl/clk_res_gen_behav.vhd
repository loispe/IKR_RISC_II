--
-- VHDL Architecture raro_ikr_risc_II_lib.clk_res_gen.behav
--
-- Created:
--          by - lspetrck.meyer (pc091)
--          at - 17:40:31 05/11/22
--
-- using Mentor Graphics HDL Designer(TM) 2020.2 Built on 12 Apr 2020 at 11:28:22
--
ARCHITECTURE behav OF clk_res_gen IS
BEGIN
  osc: process is
  begin
    std_clk <= '0';
    wait for 10 ns;
    std_clk <= '1';
    wait for 10 ns;
  end process osc;

  res: process is
  begin
    res_n <= '0';
    wait for 50 ns;
    res_n <= '1';
    wait;
  end process res;

END ARCHITECTURE behav;

