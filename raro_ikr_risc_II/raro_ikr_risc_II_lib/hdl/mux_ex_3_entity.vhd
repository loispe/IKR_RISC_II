-- VHDL Entity raro_ikr_risc_II_lib.MUX_ex_3.interface
--
-- Created:
--          by - kntntply.meyer (pc091)
--          at - 16:00:32 06/22/22
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2020.2 Built on 12 Apr 2020 at 11:28:22
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;
LIBRARY raro_ikr_risc_II_lib;
USE raro_ikr_risc_II_lib.isa_types.ALL;
USE raro_ikr_risc_II_lib.internal_types.ALL;

ENTITY MUX_ex_3 IS
   PORT( 
      rALU_out         : IN     word;
      rC_out           : IN     word;
      rFwd_selc_out_ex : IN     fwd_mode_type;
      rME_out          : IN     word;
      rStoreData_in    : OUT    word
   );

-- Declarations

END MUX_ex_3 ;

