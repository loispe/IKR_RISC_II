--
-- VHDL Architecture raro_ikr_risc_II_lib.RF_dc.behav
--
-- Created:
--          by - lspetrck.meyer (pc091)
--          at - 15:53:58 05/18/22
--
-- using Mentor Graphics HDL Designer(TM) 2020.2 Built on 12 Apr 2020 at 11:28:22
--

LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE IEEE.numeric_std.all;

ARCHITECTURE behav OF RF_dc IS
  type reg_type is array (0 to 31) of word;
  signal registers: reg_type;
  
BEGIN
  read: process (all) is
  begin
    rf_mux_a <= registers(to_integer(unsigned(sel_a)));
    rB_in <= registers(to_integer(unsigned(sel_b)));
    rC_in <= registers(to_integer(unsigned(sel_c)));
  end process read;
  
  write: process (clk, res_n) is
  begin
    if res_n = '0' then
      for i in registers'range loop
        registers(i) <= (others => '0');
      end loop;
      registers(2) <= 32x"02";
--    else
--      if clk'event and clk = '1' then
--        registers(sel_b) <= 
    end if;
  end process write;   
    
END ARCHITECTURE behav;
