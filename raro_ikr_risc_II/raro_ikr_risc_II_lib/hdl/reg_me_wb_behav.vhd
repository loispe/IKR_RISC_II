--
-- vhdl architecture raro_ikr_risc_ii_lib.reg_me_wb.behav
--
-- created:
--          by - lspetrck.meyer (pc091)
--          at - 14:58:26 05/25/22
--
-- using mentor graphics hdl designer(tm) 2020.2 built on 12 apr 2020 at 11:28:22
--
architecture behav of reg_me_wb is
begin
  reg: process(clk, res_n) is
  begin
    if res_n = '0' then
      rme_out             <= (others => '0');
      rtargetreg_out_wb   <= (others => '0');
    else
      if clk'event and clk = '1' then
        rme_out           <= rme_in;
        rtargetreg_out_wb <= rtargetreg_out_me;
      end if;
    end if;
  end process reg;
end architecture behav;

