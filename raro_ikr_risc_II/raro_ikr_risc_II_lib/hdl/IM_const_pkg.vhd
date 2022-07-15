--
-- Lovingly generated by Rasm 2022-06-15 14:02
-- on Fri Jul 15 14:12:33 CEST 2022
--
-- Input file:
--   /u/home/stud/lspetrck/Documents/raro/raro_ikr_risc_II/raro_ikr_risc_II/raro_ikr_risc_II_lib/hdl/IM_const.rasm
-- Ouput file: 
--   /u/home/stud/lspetrck/Documents/raro/raro_ikr_risc_II/raro_ikr_risc_II/raro_ikr_risc_II_lib/hdl/IM_const_pkg.vhd
--
library ieee;
use ieee.std_logic_1164.all;

package mem_contents is
constant MEM_DEPTH : integer := 64;
constant MEM_WIDTH : integer := 32;
type mem_content_type is array (0 to MEM_DEPTH - 1) of std_logic_vector(MEM_WIDTH - 1 downto 0);
constant mem_content : mem_content_type := (
    16#0# => X"01400032",
    16#1# => X"0160003c",
    16#2# => X"00e00005",
    16#3# => X"fcca5006",
    16#4# => X"00c60001",
    16#5# => X"fc262007",
    16#6# => X"f827fffc",
    16#7# => X"fcc00000",
    16#8# => X"01200001",
    16#9# => X"fd06000b",
    16#a# => X"fce85000",
    16#b# => X"fce70809",
    16#c# => X"00c60001",
    16#d# => X"fc272400",
    16#e# => X"f827fffa",
    16#f# => X"f4000001",
    16#10# => X"fc00f000",
    16#11# => X"fc600000",
    16#12# => X"fc2a4003",
    16#13# => X"fc4b4003",
    16#14# => X"fec20801",
    16#15# => X"fac40001",
    16#16# => X"fac00006",
    16#17# => X"fc4a5003",
    16#18# => X"00630001",
    16#19# => X"fc2a4003",
    16#1a# => X"fc4b4003",
    16#1b# => X"fc412402",
    16#1c# => X"f3fffff5",
    16#1d# => X"fc4a4000",
    16#1e# => X"fc82a401",
    16#1f# => X"fc8a5003",
    16#20# => X"fca2b001",
    16#21# => X"fcab5003",
    16#22# => X"00630001",
    16#23# => X"fc1ff000",
    others => X"00000000" );

  constant mem_used : positive := 36;
end mem_contents;
