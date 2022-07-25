--
-- vhdl architecture raro_ikr_risc_ii_lib.reg_dc.behav
--
-- created:
--          by - lspetrck.meyer (pc091)
--          at - 17:21:24 05/11/22
--
-- using mentor graphics hdl designer(tm) 2020.2 built on 12 apr 2020 at 11:28:22
--
architecture behav of reg_if_dc is
begin
  reg: process(clk, res_n) is
  begin
    if res_n = '0' then
      ropcode_out <= (others => '0');
      rnextpc_in_dc <= (others => '0');

    else
      if clk'event and clk = '1' then
        if stall_dc = '0' then
          ropcode_out <= ropcode_in;
          rnextpc_in_dc <= rpc_in;
        end if;
      end if;
    end if;
  end process;
end architecture behav;

