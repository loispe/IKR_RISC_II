--
-- VHDL Architecture raro_ikr_risc_II_lib.reg_mx_me.behav
--
-- Created:
--          by - lspetrck.meyer (pc086)
--          at - 18:03:30 05/24/22
--
-- using Mentor Graphics HDL Designer(TM) 2020.2 Built on 12 Apr 2020 at 11:28:22
--
ARCHITECTURE behav OF reg_mx_me IS
BEGIN
  reg: process(clk, res_n) is
  begin
    if res_n = '0' then
      rALU_out        <= (others => '0');
      rStoreData_out  <= (others => '0');
      --rAluMode_out <= NOP;  --nop ist addi in reg0
    else
      if clk'event and clk = '1' then
        rALU_out <= rALU_in;
      end if;
    end if;
  end process reg;
  
END ARCHITECTURE behav;

