--
-- Lovingly generated by Rasm 2022-06-15 14:02
-- on Wed Jun 15 15:26:34 CEST 2022
--
-- Input file:
--   /u/home/stud/lspetrck/Documents/raro/raro_ikr_risc_II/raro_ikr_risc_II/raro_ikr_risc_II_lib/hdl/IM_const.rasm
-- Ouput file: 
--   /u/home/stud/lspetrck/Documents/raro/raro_ikr_risc_II/raro_ikr_risc_II/raro_ikr_risc_II_lib/hdl/IM_const_pkg.vhd
--
library ieee;
use ieee.std_logic_1164.all;

package mem_contents is
constant MEM_DEPTH : integer := 32;
constant MEM_WIDTH : integer := 32;
type mem_content_type is array (0 to MEM_DEPTH - 1) of std_logic_vector(MEM_WIDTH - 1 downto 0);
constant mem_content : mem_content_type := (
    16#0# => X"00400005",
    16#1# => X"0520cafe",
    16#2# => X"0929cafe",
    16#3# => X"0540affe",
    16#4# => X"094aaffe",
    16#5# => X"51400005",
    16#6# => X"00200005",
    16#7# => X"0040000a",
    16#8# => X"fc610002",
    16#9# => X"fc820000",
    16#a# => X"40a10000",
    16#b# => X"50a20000",
    16#c# => X"40c10000",
    16#d# => X"fce60002",
    others => X"00000000" );

  constant mem_used : positive := 14;
end mem_contents;
