--
-- VHDL Architecture raro_ikr_risc_II_lib.dbpu.behav
--
-- Created:
--          by - kntntply.meyer (pc091)
--          at - 14:59:51 06/22/22
--
-- using Mentor Graphics HDL Designer(TM) 2020.2 Built on 12 Apr 2020 at 11:28:22
--
ARCHITECTURE behav OF dbpu IS
BEGIN
  PROCESS (all) IS
  BEGIN
    dbta_valid <= '0';
    dbpu_PC <= rSbpu_PC_out;
    sel_ALU_PC <= '0';
    
    CASE rDbpu_mode_out IS
     WHEN  dbpu_idle =>
       --do nothing
     WHEN  relayPC =>
       sel_ALU_PC <= '1';
     WHEN  beq  =>
       dbta_valid <= '1' WHEN signed(rStoreData_in) = 0;
     WHEN  bne  =>
       dbta_valid <= '1' WHEN signed(rStoreData_in) /= 0;
       --bne
     WHEN  bgt  =>
       dbta_valid <= '1' WHEN signed(rStoreData_in) > 0;
     WHEN  blt  =>
       dbta_valid <= '1' WHEN signed(rStoreData_in) < 0;
     WHEN  bge  =>
       dbta_valid <= '1' WHEN signed(rStoreData_in) >= 0;
     WHEN  ble  =>
       dbta_valid <= '1' WHEN signed(rStoreData_in) <= 0;
     WHEN  jmp  =>
       dbta_valid <= '1';
       dbpu_PC  <= mux_ALU_B;
     WHEN  jsr  =>
       dbta_valid <= '1';
       sel_ALU_PC <= '1';
       dbpu_PC  <= mux_ALU_B;
    END CASE;
  END  PROCESS;
END ARCHITECTURE behav;

