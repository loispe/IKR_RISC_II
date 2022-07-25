--
-- vhdl architecture raro_ikr_risc_ii_lib.reg_mx_me.behav
--
-- created:
--          by - lspetrck.meyer (pc086)
--          at - 18:03:30 05/24/22
--
-- using mentor graphics hdl designer(tm) 2020.2 built on 12 apr 2020 at 11:28:22
--
architecture behav of reg_ex_me is
begin
  reg: process(clk, res_n) is
  begin
    if res_n = '0' then
      ralu_out           <= (others => '0');
      rstoredata_out     <= (others => '0');
      rtargetreg_out_me  <= (others => '0');
      rmemmode_out_me    <= mem_idle;
      rfwd_selsd_out_me  <= fwd_idle;
      --ralumode_out <= nop;  --nop ist addi in reg0
    else
      if clk'event and clk = '1' then
        ralu_out          <= ralu_in;
        rstoredata_out    <= rstoredata_in;
        rtargetreg_out_me <= rtargetreg_out_ex;
        rmemmode_out_me   <= rmemmode_out_ex;
        rfwd_selsd_out_me <= rfwd_selsd_out_ex;
      end if;
    end if;
  end process reg;
  
end architecture behav;

