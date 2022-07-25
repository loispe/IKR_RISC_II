-- vhdl entity raro_ikr_risc_ii_lib.dbpu.generatedinstance
--
-- created:
--          by - kntntply.meyer (pc091)
--          at - 16:15:37 07/13/22
--
-- generated by mentor graphics' hdl designer(tm) 2020.2 built on 12 apr 2020 at 11:28:22
--
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
library raro_ikr_risc_ii_lib;
use raro_ikr_risc_ii_lib.internal_types.all;use raro_ikr_risc_ii_lib.isa_types.all;

entity dbpu is
   port( 
      dbpu_pc        : out    word;
      dbta_valid     : out    std_logic;
      mux_alu_b      : in     word;
      rdbpu_mode_out : in     dbpu_mode_type;
      rsbpu_pc_out   : in     word;
      rstoredata_in  : in     word;
      sel_alu_pc     : out    std_logic
   );

end dbpu ;

