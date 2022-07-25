-- vhdl entity raro_ikr_risc_ii_lib.step_me.interface
--
-- created:
--          by - lspetrck.meyer (pc091)
--          at - 12:02:10 06/15/22
--
-- generated by mentor graphics' hdl designer(tm) 2020.2 built on 12 apr 2020 at 11:28:22
--
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
library raro_ikr_risc_ii_lib;
use raro_ikr_risc_ii_lib.internal_types.all;use raro_ikr_risc_ii_lib.isa_types.all;

entity step_me is
   port( 
      clk               : in     std_logic;
      ralu_in           : in     word;
      ralu_out          : in     word;
      rfwd_selsd_out_me : in     fwd_mode_type;
      rme_out           : in     word;
      rmemmode_out_me   : in     mem_mode_type;
      rstoredata_out    : in     word;
      res_n             : in     std_logic;
      rme_in            : out    word
   );

-- declarations

end step_me ;

