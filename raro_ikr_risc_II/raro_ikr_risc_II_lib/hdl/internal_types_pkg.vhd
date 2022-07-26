--
-- vhdl package header raro_ikr_risc_ii_lib.internal_types
--
-- created:
--          by - lspetrck.meyer (pc091)
--          at - 17:28:29 05/11/22
--
-- using mentor graphics hdl designer(tm) 2020.2 built on 12 apr 2020 at 11:28:22
--
library ieee;
use ieee.std_logic_1164.all;

library raro_ikr_risc_ii_lib;
use raro_ikr_risc_ii_lib.mem_contents.all;

package internal_types is
  subtype   word          is  std_logic_vector(31 downto 0);
  subtype   reg_addr_type is  std_logic_vector(4 downto 0);  
  constant  memory_depth:     positive := mem_depth;

  type sbpu_mode_type is (
                    idle, st_cnd, st_uncnd
                    );
                    
  type dbpu_mode_type is (
                    dbpu_idle, relaypc, beq, bne, bgt, blt, bge, ble, jmp, jsr
                    );
  
  
end internal_types;
