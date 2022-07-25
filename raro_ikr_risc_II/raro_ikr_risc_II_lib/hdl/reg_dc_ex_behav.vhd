--
-- vhdl architecture raro_ikr_risc_ii_lib.reg_dc_ex.behav
--
-- created:
--          by - lspetrck.meyer (pc091)
--          at - 17:16:56 05/18/22
--
-- using mentor graphics hdl designer(tm) 2020.2 built on 12 apr 2020 at 11:28:22
--
architecture behav of reg_dc_ex is
begin
  reg: process(clk, res_n) is
  begin
    if res_n = '0' then
      ra_out            <= (others => '0');
      rb_out            <= (others => '0');
      rc_out            <= (others => '0');
      rnextpc_out_ex    <= (others => '0');
      ralumode_out      <= alu_idle;
      rtargetreg_out_ex <= (others => '0');
      rmemmode_out_ex   <= mem_idle;
      rfwd_sela_out_ex  <= fwd_idle;
      rfwd_selb_out_ex  <= fwd_idle;
      rfwd_selc_out_ex  <= fwd_idle;
      rfwd_selsd_out_ex <= fwd_idle;
      rdbpu_mode_out    <= dbpu_idle;  
      rsbpu_pc_out      <= (others => '0');
      
      --ralumode_out <= nop;
    else
      if clk'event and clk = '1' then
        ra_out <= ra_in;
        rb_out <= rb_in;
        rc_out <= rc_in;
        rnextpc_out_ex    <= rnextpc_in_dc;
        ralumode_out      <= ralumode_in;
        rtargetreg_out_ex <= rtargetreg_in_dc;
        rmemmode_out_ex   <= rmemmode_in_dc;
        rfwd_sela_out_ex  <= rfwd_sela_in_dc;
        rfwd_selb_out_ex  <= rfwd_selb_in_dc;
        rfwd_selc_out_ex  <= rfwd_selc_in_dc;
        rfwd_selsd_out_ex <= rfwd_selsd_in_dc; 
        rdbpu_mode_out    <= rdbpu_mode_in;  
        rsbpu_pc_out      <= rsbpu_pc_in;
      end if;
    end if;
  end process;
end architecture behav;

