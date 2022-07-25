--
-- vhdl architecture raro_ikr_risc_ii_lib.mux_init.behav
--
-- created:
--          by - lspetrck.meyer (pc091)
--          at - 16:48:26 05/11/22
--
-- using mentor graphics hdl designer(tm) 2020.2 built on 12 apr 2020 at 11:28:22
--
library ieee;
use ieee.numeric_std.all;

architecture behav of mux_init is
begin
  
  process(all) is
  variable sel : std_logic_vector (1 downto 0);
  begin
    sel := sbta_valid & dbta_valid;
    case sel is
      when "10" =>
        rpc_in <= rsbpu_pc_in;
        survive <= rsbpu_pc_in;
      when "01" | "11" =>
        rpc_in <= dbpu_pc;        
        survive <= dbpu_pc;
      when others =>
        rpc_in <= std_logic_vector(unsigned(rpc_out) + 1);
        survive <= std_logic_vector(unsigned(rpc_out) + 1);
    end case;
  end process;
    
end architecture behav;

