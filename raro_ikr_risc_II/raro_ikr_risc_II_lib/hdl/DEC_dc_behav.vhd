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
    format := rOpcode_out(format'range);
    a_imm <= (others => '0');
    sel_b <= (others => '0');
    sel_c <= (others => '0');
    
    --format := rOpcode_out(opc_format'range);
    
    case format is  --begin decoding
    when opc_bra =>
      disp26 := rOpcode_out(disp26'range);
      --do something
    when opc_bsr =>
      disp26 := rOpcode_out(disp26'range);
      --do something
    when b_format =>  --is b-command
      opc_b := rOpcode_out(opc_b'range);
      disp18 := rOpcode_out(disp18'range);
      reg_c := rOpcode_out(reg_c'range);
      case opc_b is  --determine b-command
      when opc_beq =>
      when opc_bne =>
      when opc_blt =>
      when opc_bgt =>
      when opc_ble =>
      when opc_bge =>
      when others => --no identifiable command
      end case;  --end b-command
    when r_format =>  --is r-command
      reg_b := rOpcode_out(reg_b'range);
      opc_r := rOpcode_out(opc_r'range);
      case opc_r is --determine r-command or jump
      when opc_jmp =>
      when opc_jsr =>
      when others =>
        reg_c := rOpcode_out(reg_c'range);
        case opc_r is --operations with 1 source operand
        when opc_lsl =>
        when opc_lsr =>
        when opc_asl =>
        when opc_asr =>
        when opc_rol_swaph =>
          extension := rOpcode_out(extension'range);
          if extension = opc_rol then
          elsif extension = opc_swaph then
          else
          end if;
        when opc_ror =>
        when opc_extb =>
        when opc_exth =>
        when opc_swapb =>
        when opc_not =>
        when others =>
          reg_a := rOpcode_out(reg_a'range);
          case opc_r is -- arithmetic with 2 source operands
          when opc_add =>
          --do something
          when opc_addx =>
          --do something
          when opc_sub =>
          --do something
          when opc_subx =>
            --do something
          when opc_cmpu =>
          --do something
          when opc_cmps =>
            --do something
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
    when others =>  --is i-command
      opc_i := format;
      reg_c := rOpcode_out(reg_c'range);
      reg_b := rOpcode_out(reg_b'range);
      imm16 := rOpcode_out(imm16'range);
      case opc_i is --determine i-command
      ----arithmetic
      when opc_addi =>
      when opc_addli =>
      when opc_addhi =>
      when opc_cmpui =>
      when opc_cmpsi =>
      when others => 
        case opc_i is
        when opc_and0i =>
        when opc_and1i =>
        when opc_ori =>
        when opc_xori =>
        when others => --no identifiable command
          a_imm <= (others => '0');
          sel_b <= (others => '0');
          sel_c <= (others => '0');
        end case;
      end case; --end determine i-command

    -- when opc_addi => 
    --   alu_mode_dc <= add;
    --   sel_c <= rOpcode_out(opc_c_reg'range);
    --   sel_b <= rOpcode_out(opc_b_reg'range);
    --   a_imm <= x"0000" & rOpcode_out(opc_imm'range);
    -- when others => 
    --   a_imm <= (others => '0');
    --   sel_b <= (others => '0');
    --   sel_c <= (others => '0');
    end case; --end decoder
      
      
  end process decode;
    
  
END ARCHITECTURE behav;

