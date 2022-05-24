--
-- VHDL Architecture raro_ikr_risc_II_lib.ALU_ex.behav
--
-- Created:
--          by - lspetrck.meyer (pc091)
--          at - 17:47:39 05/18/22
--
-- using Mentor Graphics HDL Designer(TM) 2020.2 Built on 12 Apr 2020 at 11:28:22
--
ARCHITECTURE behav OF ALU_ex IS


BEGIN
  alu: process is
    variable x, y: word;
    variable c_in: std_logic;
    variable c_word: word;
    
    variable au_x, au_y: word;
    variable au_l, au_f: word;
    variable au_h: std_logic_vector(word'left + 1 downto word'left);
    variable au_c, au_v: std_logic;
    
    variable f: word;
  
  begin

    
    
  end process alu;
  
  
  

END ARCHITECTURE behav;

