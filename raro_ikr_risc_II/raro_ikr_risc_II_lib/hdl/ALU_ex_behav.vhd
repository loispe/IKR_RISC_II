--
-- vhdl architecture raro_ikr_risc_ii_lib.alu_ex.behav
--
-- created:
--          by - lspetrck.meyer (pc091)
--          at - 17:47:39 05/18/22
--
-- using mentor graphics hdl designer(tm) 2020.2 built on 12 apr 2020 at 11:28:22
--
architecture behav of alu_ex is


begin
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
    
    f := (others => '0');
	  au_x    := mux_alu_b;
    au_y    := mux_alu_a;

    x       := mux_alu_b; -- x = b since this seems to be the convention. check if this is true and adopt for au_x/y if necessary
    y       := mux_alu_a;
    c_word  := (others => '0');
    
    if ralumode_out = alu_add or ralumode_out = alu_addx then
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
      
    case ralumode_out is
    when alu_add | alu_sub => f := au_f; c := au_c; v := au_v;         --tested -> works
    when alu_addx| alu_subx => f := (f'right downto f'right => au_c, others => '0'); c := au_c; v := au_v;  -- alu_addx tested -> works
    when alu_lsl    => f := x(x'left - 1 downto x'right) & '0';        --tested -> works
    when alu_lsr    => f := '0' & x(x'left downto x'right + 1);        --tested -> works
    when alu_rol    => f := x(x'left - 1 downto x'right) & x(x'left);  --tested -> works
    when alu_ror    => f := x(x'right) & x(x'left downto x'right + 1); --tested -> works
    when alu_asl    => f := x(x'left - 1 downto x'right) & '0';        --tested -> works
    when alu_asr    => f := x(x'left) & x(x'left downto x'right + 1);  --tested -> works
    when alu_and    => f := x and y;
    when alu_or     => f := x or y;
    when alu_xor    => f := x xor y;
    when alu_cmpu    => if unsigned(x) > unsigned(y) then
                          f := 32x"1";
                        elsif unsigned(x) = unsigned(y) then
                          f := 32x"0";
                        else 
                          f := 32sx"ffff";
                        end if;
    when alu_cmps    => if signed(x) > signed(y) then
                          f := 32x"1";
                        elsif signed(x) = signed(y) then
                          f := 32x"0";
                        else 
                          f := 32sx"ffff";
                        end if;
    when alu_extb   => f := x and x"0000_00ff"; f := f(7) & f(30 downto 8) & '0' & f(6 downto 0);
    when alu_exth   => f := x and x"0000_ffff"; f := f(15) & f(30 downto 16) & '0' & f(14 downto 0);
    when alu_swapb  => f := x(23 downto 16) & x(31 downto 24) & x(7 downto 0) & x(15 downto 8);
    when alu_swaph  => f := x(15 downto 0) & x(31 downto 16);
    when alu_not    => f := not x;
    when alu_jmp    =>
    when alu_jsr    =>   
    when others     =>
    end case;
    
    alu_out <= f;
    
  end process alu;
end architecture behav;

