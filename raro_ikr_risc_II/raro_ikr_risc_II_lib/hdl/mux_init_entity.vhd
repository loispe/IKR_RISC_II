-- vhdl entity raro_ikr_risc_ii_lib.mux_init.interface
--
-- created:
--          by - lspetrck.meyer (pc091)
--          at - 14:37:14 06/15/22
--
-- generated by mentor graphics' hdl designer(tm) 2020.2 built on 12 apr 2020 at 11:28:22
--
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
library raro_ikr_risc_ii_lib;
use raro_ikr_risc_ii_lib.internal_types.all;use raro_ikr_risc_ii_lib.isa_types.all;

entity mux_init is
   port( 
      dbpu_pc     : in     word;
      dbta_valid  : in     std_logic;
      rpc_out     : in     word;
      rsbpu_pc_in : in     word;
      sbta_valid  : in     std_logic;
      rpc_in      : out    word;
      survive     : out    word
   );

-- declarations

end mux_init ;

