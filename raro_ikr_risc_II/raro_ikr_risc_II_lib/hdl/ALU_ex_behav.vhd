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
  alu: process (all) is
    variable x, y:    word;
    variable c_in:    std_logic;
    variable c_word:  word;
    
    variable au_x, au_y:  word;
    variable au_l, au_f:  word;
    variable au_h:        std_logic_vector(word'left + 1 downto word'left);
    variable au_c, au_v:  std_logic;
    
    variable f: word;
    variable n, z, v, c: std_logic;
  
  begin
    
    au_x    := mux_ALU_A;
    au_y    := mux_ALU_B;
    
    x       := mux_ALU_B; -- x = B since this seems to be the convention. Check if this is true and adopt for au_x/y if necessary
    y       := mux_ALU_A;
    c_word  := (others => '0');
    
    if rAluMode_out = alu_add then
      au_l := std_logic_vector(
      unsigned('0' & au_x(au_x'left - 1 downto au_x'right)) +
      unsigned('0' & au_y(au_y'left - 1 downto au_y'right)) + unsigned(c_word));
      au_h := std_logic_vector(
      unsigned('0' & au_x(au_x'left downto au_x'left)) +
      unsigned('0' & au_y(au_y'left downto au_y'left)) +
      unsigned('0' & au_l(au_l'left downto au_l'left)));
    else
      au_l := std_logic_vector(
      unsigned('0' & au_x(au_x'left - 1 downto au_x'right)) -
      unsigned('0' & au_y(au_y'left - 1 downto au_y'right)) - unsigned(c_word));
      au_h := std_logic_vector(
      unsigned('0' & au_x(au_x'left downto au_x'left)) -
      unsigned('0' & au_y(au_y'left downto au_y'left)) -
      unsigned('0' & au_l(au_l'left downto au_l'left)));
    end if;
    
    au_c := au_h(au_h'left);
    au_v := au_h(au_h'left) xor au_l(au_l'left);
    au_f := au_h(au_h'right) & au_l(au_l'left - 1 downto au_l'right);
      
    case rAlumode_out is
    when alu_add | alu_sub => f := au_f; c := au_c; v := au_v;      --tested -> works
    when alu_lsl    => f := x(x'left - 1 downto x'right) & '0';        --tested -> works
    when alu_lsr    => f := '0' & x(x'left downto x'right + 1);        --tested -> works
    when alu_rol    => f := x(x'left - 1 downto x'right) & x(x'left);  --tested -> works
    when alu_ror    => f := x(x'right) & x(x'left downto x'right + 1); --tested -> works
    when alu_asl    => f := x(x'left - 1 downto x'right) & '0';        --tested -> works
    when alu_asr    => f := x(x'left) & x(x'left downto x'right + 1);  --tested -> works
    when alu_extb   =>
    when alu_exth   =>
    when alu_swapb  =>
    when alu_swaph  =>
    when alu_not    =>
    when alu_jmp    =>
    when alu_jsr    =>   
    when others     =>
    end case;
    
    ALU_out <= f;
    
    
  end process alu;
  
  
  

END ARCHITECTURE behav;

