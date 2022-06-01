--
-- VHDL Architecture raro_ikr_risc_II_lib.reg_mx_me.behav
--
-- Created:
--          by - lspetrck.meyer (pc086)
--          at - 18:03:30 05/24/22
--
-- using Mentor Graphics HDL Designer(TM) 2020.2 Built on 12 Apr 2020 at 11:28:22
--
ARCHITECTURE behav OF reg_ex_me IS
BEGIN
  reg: process(clk, res_n) is
  begin
    if res_n = '0' then
      rALU_out           <= (others => '0');
      rStoreData_out     <= (others => '0');
      rTargetReg_out_me  <= (others => '0');
      rMemMode_out_me    <= mem_idle;
      --rAluMode_out <= NOP;  --nop ist addi in reg0
    else
      if clk'event and clk = '1' then
        rALU_out <= rALU_in;
        rStoreData_out <= rStoreData_in;
        rTargetReg_out_me <= rTargetReg_out_ex;
        rMemMode_out_me <= rMemMode_out_ex;
      end if;
    end if;
  end process reg;
  
END ARCHITECTURE behav;

