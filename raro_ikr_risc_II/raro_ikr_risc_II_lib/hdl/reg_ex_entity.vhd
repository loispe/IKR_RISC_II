-- vhdl entity raro_ikr_risc_ii_lib.reg_ex.generatedinstance
--
-- created:
--          by - lspetrck.meyer (pc091)
--          at - 18:37:10 05/11/22
--
-- generated by mentor graphics' hdl designer(tm) 2020.2 built on 12 apr 2020 at 11:28:22
--
library ieee;
use ieee.std_logic_1164.all;
library raro_ikr_risc_ii_lib;
use raro_ikr_risc_ii_lib.internal_types.all;

entity reg_ex is
   port( 
      dc_inout_rnextpc : in     word;
      ex_in_ra         : in     std_logic_vector (15 downto 0);
      ex_in_rb         : in     std_logic_vector (15 downto 0);
      ex_in_rc         : in     std_logic_vector (15 downto 0);
      ex_out_nextpc    : out    std_logic_vector (15 downto 0);
      ex_out_ra        : out    std_logic_vector (15 downto 0);
      ex_out_rb        : out    std_logic_vector (15 downto 0);
      ex_out_rc        : out    std_logic_vector (15 downto 0)
   );

end reg_ex ;

