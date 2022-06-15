--
-- VHDL Architecture raro_ikr_risc_II_lib.reg_if.behav
--
-- Created:
--          by - lspetrck.meyer (pc091)
--          at - 16:55:59 05/11/22
--
-- using Mentor Graphics HDL Designer(TM) 2020.2 Built on 12 Apr 2020 at 11:28:22
--
ARCHITECTURE behav OF reg_pc IS
BEGIN
  
  process(clk, res_n) is
  begin
    if res_n = '0' then
      rPc_out <= (others => '0');
    else
      if clk'event and clk = '1' then
        if stall_dc = '0' then
          rPc_out <= rPc_in;
        end if;
      end if;
    end if;
  end process; 
END ARCHITECTURE behav;

