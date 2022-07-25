--
-- vhdl architecture raro_ikr_risc_ii_lib.rf_dc.behav
--
-- created:
--          by - lspetrck.meyer (pc091)
--          at - 15:53:58 05/18/22
--
-- using mentor graphics hdl designer(tm) 2020.2 built on 12 apr 2020 at 11:28:22
--

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

architecture behav of rf_dc is
  type reg_type is array (0 to 31) of word;
  signal registers: reg_type;
  
begin
  read: process (all) is
  begin
    rf_mux_a <= registers(to_integer(unsigned(sel_a)));
    rb_in <= registers(to_integer(unsigned(sel_b)));
    rc_in <= registers(to_integer(unsigned(sel_c)));
  end process read;
  
  write: process (clk, res_n) is
  begin
    if res_n = '0' then
      for i in registers'range loop
        registers(i) <= (others => '0');
      end loop;
    elsif clk'event and clk ='0' then
        registers(to_integer(unsigned(rtargetreg_out_wb))) <= rme_out;
        registers(0) <= (others => '0');
    end if;
  end process write;   
    
end architecture behav;

