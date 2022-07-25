--
-- vhdl architecture raro_ikr_risc_ii_lib.clk_res_gen.behav
--
-- created:
--          by - lspetrck.meyer (pc091)
--          at - 17:40:31 05/11/22
--
-- using mentor graphics hdl designer(tm) 2020.2 built on 12 apr 2020 at 11:28:22
--
architecture behav of clk_res_gen is
begin
  osc: process is
  begin
    std_clk <= '0';
    wait for 20 ns;
    std_clk <= '1';
    wait for 20 ns;
  end process osc;

  res: process is
  begin
    res_n <= '0';
    wait for 50 ns;
    res_n <= '1';
    wait;
  end process res;

end architecture behav;

