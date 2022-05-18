--
-- VHDL Architecture raro_ikr_risc_II_lib.DEC_dc.behav
--
-- Created:
--          by - lspetrck.meyer (pc091)
--          at - 14:42:05 05/18/22
--
-- using Mentor Graphics HDL Designer(TM) 2020.2 Built on 12 Apr 2020 at 11:28:22
--
ARCHITECTURE behav OF DEC_dc IS
BEGIN
  decode: process (all) is
  variable format: std_logic_vector(opc_format'range);
  variable rc: std_logic_vector(opc_c_reg'range);
  begin
    
    a_imm <= (others => '0');
    sel_b <= (others => '0');
    sel_c <= (others => '0');
    
    format := rOpcode_out(opc_format'range);
    
    if format = x"3F" then
      sel_imm <= '0';
    else
      sel_imm <= '1';
    end if;
    
    case format is
    when opc_addi => 
      alu_mode_dc <= add;
      sel_c <= rOpcode_out(opc_c_reg'range);
      sel_b <= rOpcode_out(opc_b_reg'range);
      a_imm <= x"0000" & rOpcode_out(opc_imm'range);
    when others => 
      a_imm <= (others => '0');
      sel_b <= (others => '0');
      sel_c <= (others => '0');
    end case;
      
      
  end process decode;
    
  
END ARCHITECTURE behav;

