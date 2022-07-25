--
-- vhdl architecture raro_ikr_risc_ii_lib.step_if.behav
--
-- created:
--          by - lspetrck.meyer (pc091)
--          at - 17:07:35 05/11/22
--
-- using mentor graphics hdl designer(tm) 2020.2 built on 12 apr 2020 at 11:28:22
--
library ieee;
use ieee.numeric_std.all;
library raro_ikr_risc_ii_lib;
use raro_ikr_risc_ii_lib.mem_contents.all;

architecture behav of step_if is
  type memory_type is array(0 to memory_depth - 1) of word;
  
begin
  process (all) 
  variable sel  : std_logic;
  begin
    sel := sbta_valid or dbta_valid;
    if sel = '0' then
      if to_integer(unsigned(rpc_out)) <= memory_depth - 1 then
          ropcode_in <= mem_content(to_integer(unsigned(rpc_out)));
      else 
          ropcode_in <= 32x"0";
      end if;
    else
      ropcode_in <= nop;
    end if;
  end process;

      
end architecture behav;

