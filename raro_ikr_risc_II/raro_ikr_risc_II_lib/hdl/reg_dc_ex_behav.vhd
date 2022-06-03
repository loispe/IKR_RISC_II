--
-- VHDL Architecture raro_ikr_risc_II_lib.reg_dc_ex.behav
--
-- Created:
--          by - lspetrck.meyer (pc091)
--          at - 17:16:56 05/18/22
--
-- using Mentor Graphics HDL Designer(TM) 2020.2 Built on 12 Apr 2020 at 11:28:22
--
ARCHITECTURE behav OF reg_dc_ex IS
BEGIN
  reg: process(clk, res_n) is
  begin
    if res_n = '0' then
      rA_out            <= (others => '0');
      rB_out            <= (others => '0');
      rC_out            <= (others => '0');
      rNextPc_out_ex    <= (others => '0');
      rTargetReg_out_ex <= (others => '0');
      rMemMode_out_ex   <= mem_idle;
      rFwd_sela_out_ex  <= fwd_idle;
      rFwd_selb_out_ex  <= fwd_idle;
      rFwd_selc_out_ex  <= fwd_idle;
      rFwd_selsd_out_ex <= fwd_idle;  
      
      --rAluMode_out <= NOP;
    else
      if clk'event and clk = '1' then
        rA_out <= rA_in;
        rB_out <= rB_in;
        rC_out <= rC_in;
        rNextPc_out_ex    <= rNextPc_in_dc;
        rAluMode_out      <= rAluMode_in;
        rTargetReg_out_ex <= rTargetReg_in_dc;
        rMemMode_out_ex   <= rMemMode_in_dc;
        rFwd_sela_out_ex  <= rFwd_sela_in_dc;
        rFwd_selb_out_ex  <= rFwd_selb_in_dc;
        rFwd_selc_out_ex  <= rFwd_selc_in_dc;
        rFwd_selsd_out_ex <= rFwd_selsd_in_dc; 
      end if;
    end if;
  end process;
END ARCHITECTURE behav;

