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
  variable format: cmd_beginning;
  variable disp26: disp26_type;
  variable disp18: disp18_type;
  variable reg_c: opc_c_reg;
  variable reg_b: opc_b_reg;
  variable opc_r: opc_r_format;
  variable opc_i: opc_i_format;
  variable imm16: imm16_type;
  variable opc_b: opc_b_format;
  variable extension: opc_r_format_ext;
  variable reg_a: opc_a_reg;
  
  --variable format: std_logic_vector(opc_format'range);
  --variable rc: std_logic_vector(opc_c_reg'range);
  
  begin
    format  := rOpcode_out(format'range);
    a_imm   <= (others => '0');
    sel_imm <= '0';
    sel_b   <= (others => '0');
    sel_c   <= (others => '0');
    rTargetReg_in_dc <= (others => '0');
    
    --format := rOpcode_out(opc_format'range);
    
    case format is  --begin decoding
    when opc_bra =>
      disp26 := rOpcode_out(disp26'range);
      --do something
    when opc_bsr =>
      disp26 := rOpcode_out(disp26'range);
      --do something
      
--***************************************************************      
--B format:
    when b_format =>  --is b-command
      opc_b  := rOpcode_out(opc_b'range);
      disp18 := rOpcode_out(disp18'range);
      sel_c  <= rOpcode_out(reg_c'range);
      rTargetReg_in_dc <= rOpcode_out(reg_c'range);
      
      case opc_b is  --determine b-command
      when opc_beq =>
      when opc_bne =>
      when opc_blt =>
      when opc_bgt =>
      when opc_ble =>
      when opc_bge =>
      when others  => --no identifiable command
      end case;  --end b-command
      
--***************************************************************
--R format:  
    when r_format =>  --is r-command
      sel_b <= rOpcode_out(reg_b'range);
      opc_r := rOpcode_out(opc_r'range);
      
      case opc_r is --determine r-command or jump
      when opc_jmp =>
      when opc_jsr =>
      when others  =>
        sel_c <= rOpcode_out(reg_c'range);
        rTargetReg_in_dc <= rOpcode_out(reg_c'range);
        
        case opc_r is --operations with 1 source operand
        when opc_lsl => rAluMode_in <= alu_lsl;
        when opc_lsr => rAluMode_in <= alu_lsr;
        when opc_asl => rAluMode_in <= alu_asl;
        when opc_asr => rAluMode_in <= alu_asr;
          
        when opc_rol_swaph =>
          extension := rOpcode_out(extension'range);
          
          if extension = opc_rol then
            rAluMode_in <= alu_rol;
          elsif extension = opc_swaph then
            
          else
            
          end if;
          
        when opc_ror    => rAluMode_in <= alu_ror;
        when opc_extb   =>
        when opc_exth   =>
        when opc_swapb  =>
        when opc_not    =>
        when others =>
          sel_a   <= rOpcode_out(reg_a'range);
          sel_imm <= '0';

          case opc_r is -- arithmetic with 2 source operands
          when opc_add  => rAluMode_in <= alu_add;
          when opc_addx =>
          when opc_sub  => rAluMode_in <= alu_sub;
          when opc_subx =>
          when opc_cmpu =>
          when opc_cmps =>
          when others =>
            
            case opc_r is
            -- logic with 2 source operands
            when opc_and =>
            when opc_or =>
            when opc_xor =>
            when others =>
              
              case opc_r is
                --load/store
                when opc_str =>
                when opc_ldr =>
                when others =>  --no identifiable command
              end case;
            end case;
          end case;
        end case; --end r-command
      end case; --end r-command or jump
      
--***************************************************************
--I format:
    when others =>  --is i-command
      opc_i            := format;
      sel_c            <= rOpcode_out(reg_c'range);
      rTargetReg_in_dc <= rOpcode_out(reg_c'range);
      sel_b            <= rOpcode_out(reg_b'range);
      a_imm            <= 16x"0" & rOpcode_out(imm16'range);
      sel_imm          <= '1';
      
      case opc_i is --determine i-command
      ----arithmetic
      when opc_addi   =>  rAluMode_in <= alu_add;
      when opc_addli  =>
      when opc_addhi  =>
      when opc_cmpui  =>
      when opc_cmpsi  =>
      when others     => 
        
        case opc_i is
        when opc_and0i =>
        when opc_and1i =>
        when opc_ori =>
        when opc_xori =>
        when others => --no identifiable command
          a_imm <= (others => '0');
          sel_b <= (others => '0');
          sel_c <= (others => '0');
          rTargetReg_in_dc <= (others => '0');
        end case;
      end case; --end determine i-command
--***************************************************************
    end case; --end decoder
      
      
  end process decode;
    
  
END ARCHITECTURE behav;

