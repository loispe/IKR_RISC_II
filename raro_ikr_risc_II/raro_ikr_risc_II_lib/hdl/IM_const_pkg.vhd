--
-- Lovingly generated by Rasm 2022-06-15 14:02
-- on Tue Jul 05 12:34:58 CEST 2022
--
-- Input file:
--   /home/kenton/Documents/git_repos/raro_ikr_risc_II/raro_ikr_risc_II/raro_ikr_risc_II_lib/hdl/IM_const.rasm
-- Ouput file: 
--   /home/kenton/Documents/git_repos/raro_ikr_risc_II/raro_ikr_risc_II/raro_ikr_risc_II_lib/hdl/IM_const_pkg.vhd
--
library ieee;
use ieee.std_logic_1164.all;

package mem_contents is
constant MEM_DEPTH : integer := 64;
constant MEM_WIDTH : integer := 32;
type mem_content_type is array (0 to MEM_DEPTH - 1) of std_logic_vector(MEM_WIDTH - 1 downto 0);
constant mem_content : mem_content_type := (
    16#0# => X"00200005",
    16#1# => X"01600001",
    16#2# => X"01400006",
    16#3# => X"fc40080a",
    16#4# => X"fc612002",
    16#5# => X"fc812402",
    16#6# => X"f400000d",
    16#7# => X"f800000b",
    16#8# => X"f400000b",
    16#9# => X"f8440009",
    16#a# => X"f4000009",
    16#b# => X"f8680007",
    16#c# => X"f4000007",
    16#d# => X"f86c0005",
    16#e# => X"f4000005",
    16#f# => X"f8500003",
    16#10# => X"f4000003",
    16#11# => X"f8740001",
    16#12# => X"f4000001",
    16#13# => X"ffff000b",
    16#14# => X"fc1ff000",
    16#15# => X"01400006",
    others => X"00000000" );

  constant mem_used : positive := 22;
end mem_contents;
