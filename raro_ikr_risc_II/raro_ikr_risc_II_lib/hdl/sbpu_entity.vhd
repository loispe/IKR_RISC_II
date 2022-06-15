-- VHDL Entity raro_ikr_risc_II_lib.sbpu.interface
--
-- Created:
--          by - lspetrck.meyer (pc091)
--          at - 14:37:14 06/15/22
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2020.2 Built on 12 Apr 2020 at 11:28:22
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;
LIBRARY raro_ikr_risc_II_lib;
USE raro_ikr_risc_II_lib.internal_types.all;USE raro_ikr_risc_II_lib.isa_types.ALL;

ENTITY sbpu IS
   PORT( 
      disp          : IN     word;
      rNextPc_in_dc : IN     word;
      sbpu_mode     : IN     sbpu_mode_type;
      sbpu_PC       : OUT    word;
      sbta_valid    : OUT    std_logic
   );

-- Declarations

END sbpu ;

