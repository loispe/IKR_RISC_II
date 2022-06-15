--
-- VHDL Architecture raro_ikr_risc_II_lib.sbpu.behav
--
-- Created:
--          by - lspetrck.meyer (pc091)
--          at - 13:52:36 06/15/22
--
-- using Mentor Graphics HDL Designer(TM) 2020.2 Built on 12 Apr 2020 at 11:28:22
--
ARCHITECTURE behav OF sbpu IS
BEGIN
  PROCESS(sbpu_mode) IS
  BEGIN
    CASE sbpu_mode IS
      WHEN  st_uncnd =>
              sbpu_PC <= std_logic_vector(unsigned(rNextPC_in_dc) + unsigned(disp));
              sbta_valid <= '1';
      WHEN  st_cnd  =>  
              sbpu_PC <= std_logic_vector(unsigned(rNextPC_in_dc) + unsigned(disp));
              sbta_valid <= '0';
      WHEN  OTHERS  =>
              sbpu_PC <= rNextPC_in_dc;
              sbta_valid <= '0';
    END CASE;
  END PROCESS;
  
END ARCHITECTURE behav;

