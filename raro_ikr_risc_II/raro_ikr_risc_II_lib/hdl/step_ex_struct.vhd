--
-- VHDL Architecture raro_ikr_risc_II_lib.step_ex.struct
--
-- Created:
--          by - lspetrck.meyer (pc091)
--          at - 17:20:48 05/18/22
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2020.2 Built on 12 Apr 2020 at 11:28:22
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;

LIBRARY raro_ikr_risc_II_lib;

ARCHITECTURE struct OF step_ex IS

   -- Architecture declarations

   -- Internal signal declarations
   SIGNAL ALU_out       : std_logic_vector(15 DOWNTO 0);
   SIGNAL ex_out_nextPc : std_logic_vector(15 DOWNTO 0);
   SIGNAL rNextPC_out   : word;


   -- Component Declarations
   COMPONENT ALU_ex
   PORT (
      ALU_out : OUT    std_logic_vector (15 DOWNTO 0)
   );
   END COMPONENT;
   COMPONENT MUX_ex_1
   END COMPONENT;
   COMPONENT MUX_ex_2
   END COMPONENT;
   COMPONENT MUX_ex_3
   END COMPONENT;
   COMPONENT MUX_ex_4
   PORT (
      ALU_out       : IN     std_logic_vector (15 DOWNTO 0);
      ex_out_nextPc : IN     std_logic_vector (15 DOWNTO 0)
   );
   END COMPONENT;

   -- Optional embedded configurations
   -- pragma synthesis_off
   FOR ALL : ALU_ex USE ENTITY raro_ikr_risc_II_lib.ALU_ex;
   FOR ALL : MUX_ex_1 USE ENTITY raro_ikr_risc_II_lib.MUX_ex_1;
   FOR ALL : MUX_ex_2 USE ENTITY raro_ikr_risc_II_lib.MUX_ex_2;
   FOR ALL : MUX_ex_3 USE ENTITY raro_ikr_risc_II_lib.MUX_ex_3;
   FOR ALL : MUX_ex_4 USE ENTITY raro_ikr_risc_II_lib.MUX_ex_4;
   -- pragma synthesis_on


BEGIN

   -- Instance port mappings.
   U_4 : ALU_ex
      PORT MAP (
         ALU_out => ALU_out
      );
   U_0 : MUX_ex_1;
   U_1 : MUX_ex_2;
   U_2 : MUX_ex_3;
   U_3 : MUX_ex_4
      PORT MAP (
         ALU_out       => ALU_out,
         ex_out_nextPc => ex_out_nextPc
      );

END struct;
