library ieee;
use ieee.std_logic_1164.all;
use IEEE.numeric_std.all;

entity sine_table is
    generic(constant SIN_GEN_MUL_N_BITS: natural := 4);
    port(
      clk: in std_logic;
      mul: in unsigned(SIN_GEN_MUL_N_BITS - 1 downto 0);
      result: out std_logic_vector(7 downto 0) := (others => '0');
      dbg_table_cnt: out std_logic_vector(7 downto 0) := (others =>  '0')
    );
end sine_table;

architecture sine_table_arch of sine_table is
begin
    process(clk) is
        constant SIN_GEN_OUT_N_BITS: natural := 8;
        variable address: unsigned(SIN_GEN_OUT_N_BITS - 1 downto 0) := (others =>  '0');
    begin
        if clk = '1' then
            address := address + mul + 1;
            dbg_table_cnt <= std_logic_vector(address);
            case address is
                when "00000000" => result <= "01111111"; -- 0x7f
                when "00000001" => result <= "10000011"; -- 0x83
                when "00000010" => result <= "10000110"; -- 0x86
                when "00000011" => result <= "10001001"; -- 0x89
                when "00000100" => result <= "10001100"; -- 0x8c
                when "00000101" => result <= "10001111"; -- 0x8f
                when "00000110" => result <= "10010010"; -- 0x92
                when "00000111" => result <= "10010101"; -- 0x95
                when "00001000" => result <= "10011001"; -- 0x99
                when "00001001" => result <= "10011100"; -- 0x9c
                when "00001010" => result <= "10011111"; -- 0x9f
                when "00001011" => result <= "10100010"; -- 0xa2
                when "00001100" => result <= "10100101"; -- 0xa5
                when "00001101" => result <= "10101000"; -- 0xa8
                when "00001110" => result <= "10101011"; -- 0xab
                when "00001111" => result <= "10101110"; -- 0xae
                when "00010000" => result <= "10110001"; -- 0xb1
                when "00010001" => result <= "10110100"; -- 0xb4
                when "00010010" => result <= "10110110"; -- 0xb6
                when "00010011" => result <= "10111001"; -- 0xb9
                when "00010100" => result <= "10111100"; -- 0xbc
                when "00010101" => result <= "10111111"; -- 0xbf
                when "00010110" => result <= "11000010"; -- 0xc2
                when "00010111" => result <= "11000100"; -- 0xc4
                when "00011000" => result <= "11000111"; -- 0xc7
                when "00011001" => result <= "11001001"; -- 0xc9
                when "00011010" => result <= "11001100"; -- 0xcc
                when "00011011" => result <= "11001111"; -- 0xcf
                when "00011100" => result <= "11010001"; -- 0xd1
                when "00011101" => result <= "11010011"; -- 0xd3
                when "00011110" => result <= "11010110"; -- 0xd6
                when "00011111" => result <= "11011000"; -- 0xd8
                when "00100000" => result <= "11011010"; -- 0xda
                when "00100001" => result <= "11011100"; -- 0xdc
                when "00100010" => result <= "11011111"; -- 0xdf
                when "00100011" => result <= "11100001"; -- 0xe1
                when "00100100" => result <= "11100011"; -- 0xe3
                when "00100101" => result <= "11100101"; -- 0xe5
                when "00100110" => result <= "11100111"; -- 0xe7
                when "00100111" => result <= "11101000"; -- 0xe8
                when "00101000" => result <= "11101010"; -- 0xea
                when "00101001" => result <= "11101100"; -- 0xec
                when "00101010" => result <= "11101110"; -- 0xee
                when "00101011" => result <= "11101111"; -- 0xef
                when "00101100" => result <= "11110001"; -- 0xf1
                when "00101101" => result <= "11110010"; -- 0xf2
                when "00101110" => result <= "11110011"; -- 0xf3
                when "00101111" => result <= "11110101"; -- 0xf5
                when "00110000" => result <= "11110110"; -- 0xf6
                when "00110001" => result <= "11110111"; -- 0xf7
                when "00110010" => result <= "11111000"; -- 0xf8
                when "00110011" => result <= "11111001"; -- 0xf9
                when "00110100" => result <= "11111010"; -- 0xfa
                when "00110101" => result <= "11111011"; -- 0xfb
                when "00110110" => result <= "11111100"; -- 0xfc
                when "00110111" => result <= "11111101"; -- 0xfd
                when "00111000" => result <= "11111101"; -- 0xfd
                when "00111001" => result <= "11111110"; -- 0xfe
                when "00111010" => result <= "11111110"; -- 0xfe
                when "00111011" => result <= "11111111"; -- 0xff
                when "00111100" => result <= "11111111"; -- 0xff
                when "00111101" => result <= "11111111"; -- 0xff
                when "00111110" => result <= "11111111"; -- 0xff
                when "00111111" => result <= "11111111"; -- 0xff
                when "01000000" => result <= "11111111"; -- 0xff
                when "01000001" => result <= "11111111"; -- 0xff
                when "01000010" => result <= "11111111"; -- 0xff
                when "01000011" => result <= "11111111"; -- 0xff
                when "01000100" => result <= "11111111"; -- 0xff
                when "01000101" => result <= "11111110"; -- 0xfe
                when "01000110" => result <= "11111110"; -- 0xfe
                when "01000111" => result <= "11111101"; -- 0xfd
                when "01001000" => result <= "11111101"; -- 0xfd
                when "01001001" => result <= "11111100"; -- 0xfc
                when "01001010" => result <= "11111011"; -- 0xfb
                when "01001011" => result <= "11111011"; -- 0xfb
                when "01001100" => result <= "11111010"; -- 0xfa
                when "01001101" => result <= "11111001"; -- 0xf9
                when "01001110" => result <= "11111000"; -- 0xf8
                when "01001111" => result <= "11110111"; -- 0xf7
                when "01010000" => result <= "11110101"; -- 0xf5
                when "01010001" => result <= "11110100"; -- 0xf4
                when "01010010" => result <= "11110011"; -- 0xf3
                when "01010011" => result <= "11110001"; -- 0xf1
                when "01010100" => result <= "11110000"; -- 0xf0
                when "01010101" => result <= "11101110"; -- 0xee
                when "01010110" => result <= "11101101"; -- 0xed
                when "01010111" => result <= "11101011"; -- 0xeb
                when "01011000" => result <= "11101001"; -- 0xe9
                when "01011001" => result <= "11101000"; -- 0xe8
                when "01011010" => result <= "11100110"; -- 0xe6
                when "01011011" => result <= "11100100"; -- 0xe4
                when "01011100" => result <= "11100010"; -- 0xe2
                when "01011101" => result <= "11100000"; -- 0xe0
                when "01011110" => result <= "11011110"; -- 0xde
                when "01011111" => result <= "11011011"; -- 0xdb
                when "01100000" => result <= "11011001"; -- 0xd9
                when "01100001" => result <= "11010111"; -- 0xd7
                when "01100010" => result <= "11010101"; -- 0xd5
                when "01100011" => result <= "11010010"; -- 0xd2
                when "01100100" => result <= "11010000"; -- 0xd0
                when "01100101" => result <= "11001101"; -- 0xcd
                when "01100110" => result <= "11001011"; -- 0xcb
                when "01100111" => result <= "11001000"; -- 0xc8
                when "01101000" => result <= "11000110"; -- 0xc6
                when "01101001" => result <= "11000011"; -- 0xc3
                when "01101010" => result <= "11000000"; -- 0xc0
                when "01101011" => result <= "10111101"; -- 0xbd
                when "01101100" => result <= "10111011"; -- 0xbb
                when "01101101" => result <= "10111000"; -- 0xb8
                when "01101110" => result <= "10110101"; -- 0xb5
                when "01101111" => result <= "10110010"; -- 0xb2
                when "01110000" => result <= "10101111"; -- 0xaf
                when "01110001" => result <= "10101100"; -- 0xac
                when "01110010" => result <= "10101001"; -- 0xa9
                when "01110011" => result <= "10100110"; -- 0xa6
                when "01110100" => result <= "10100011"; -- 0xa3
                when "01110101" => result <= "10100000"; -- 0xa0
                when "01110110" => result <= "10011101"; -- 0x9d
                when "01110111" => result <= "10011010"; -- 0x9a
                when "01111000" => result <= "10010111"; -- 0x97
                when "01111001" => result <= "10010100"; -- 0x94
                when "01111010" => result <= "10010001"; -- 0x91
                when "01111011" => result <= "10001110"; -- 0x8e
                when "01111100" => result <= "10001011"; -- 0x8b
                when "01111101" => result <= "10000111"; -- 0x87
                when "01111110" => result <= "10000100"; -- 0x84
                when "01111111" => result <= "10000001"; -- 0x81
                when "10000000" => result <= "01111110"; -- 0x7e
                when "10000001" => result <= "01111011"; -- 0x7b
                when "10000010" => result <= "01111000"; -- 0x78
                when "10000011" => result <= "01110100"; -- 0x74
                when "10000100" => result <= "01110001"; -- 0x71
                when "10000101" => result <= "01101110"; -- 0x6e
                when "10000110" => result <= "01101011"; -- 0x6b
                when "10000111" => result <= "01101000"; -- 0x68
                when "10001000" => result <= "01100101"; -- 0x65
                when "10001001" => result <= "01100010"; -- 0x62
                when "10001010" => result <= "01011111"; -- 0x5f
                when "10001011" => result <= "01011100"; -- 0x5c
                when "10001100" => result <= "01011001"; -- 0x59
                when "10001101" => result <= "01010110"; -- 0x56
                when "10001110" => result <= "01010011"; -- 0x53
                when "10001111" => result <= "01010000"; -- 0x50
                when "10010000" => result <= "01001101"; -- 0x4d
                when "10010001" => result <= "01001010"; -- 0x4a
                when "10010010" => result <= "01000111"; -- 0x47
                when "10010011" => result <= "01000100"; -- 0x44
                when "10010100" => result <= "01000010"; -- 0x42
                when "10010101" => result <= "00111111"; -- 0x3f
                when "10010110" => result <= "00111100"; -- 0x3c
                when "10010111" => result <= "00111001"; -- 0x39
                when "10011000" => result <= "00110111"; -- 0x37
                when "10011001" => result <= "00110100"; -- 0x34
                when "10011010" => result <= "00110010"; -- 0x32
                when "10011011" => result <= "00101111"; -- 0x2f
                when "10011100" => result <= "00101101"; -- 0x2d
                when "10011101" => result <= "00101010"; -- 0x2a
                when "10011110" => result <= "00101000"; -- 0x28
                when "10011111" => result <= "00100110"; -- 0x26
                when "10100000" => result <= "00100100"; -- 0x24
                when "10100001" => result <= "00100001"; -- 0x21
                when "10100010" => result <= "00011111"; -- 0x1f
                when "10100011" => result <= "00011101"; -- 0x1d
                when "10100100" => result <= "00011011"; -- 0x1b
                when "10100101" => result <= "00011001"; -- 0x19
                when "10100110" => result <= "00010111"; -- 0x17
                when "10100111" => result <= "00010110"; -- 0x16
                when "10101000" => result <= "00010100"; -- 0x14
                when "10101001" => result <= "00010010"; -- 0x12
                when "10101010" => result <= "00010001"; -- 0x11
                when "10101011" => result <= "00001111"; -- 0xf
                when "10101100" => result <= "00001110"; -- 0xe
                when "10101101" => result <= "00001100"; -- 0xc
                when "10101110" => result <= "00001011"; -- 0xb
                when "10101111" => result <= "00001010"; -- 0xa
                when "10110000" => result <= "00001000"; -- 0x8
                when "10110001" => result <= "00000111"; -- 0x7
                when "10110010" => result <= "00000110"; -- 0x6
                when "10110011" => result <= "00000101"; -- 0x5
                when "10110100" => result <= "00000100"; -- 0x4
                when "10110101" => result <= "00000100"; -- 0x4
                when "10110110" => result <= "00000011"; -- 0x3
                when "10110111" => result <= "00000010"; -- 0x2
                when "10111000" => result <= "00000010"; -- 0x2
                when "10111001" => result <= "00000001"; -- 0x1
                when "10111010" => result <= "00000001"; -- 0x1
                when "10111011" => result <= "00000000"; -- 0x0
                when "10111100" => result <= "00000000"; -- 0x0
                when "10111101" => result <= "00000000"; -- 0x0
                when "10111110" => result <= "00000000"; -- 0x0
                when "10111111" => result <= "00000000"; -- 0x0
                when "11000000" => result <= "00000000"; -- 0x0
                when "11000001" => result <= "00000000"; -- 0x0
                when "11000010" => result <= "00000000"; -- 0x0
                when "11000011" => result <= "00000000"; -- 0x0
                when "11000100" => result <= "00000000"; -- 0x0
                when "11000101" => result <= "00000001"; -- 0x1
                when "11000110" => result <= "00000001"; -- 0x1
                when "11000111" => result <= "00000010"; -- 0x2
                when "11001000" => result <= "00000010"; -- 0x2
                when "11001001" => result <= "00000011"; -- 0x3
                when "11001010" => result <= "00000100"; -- 0x4
                when "11001011" => result <= "00000101"; -- 0x5
                when "11001100" => result <= "00000110"; -- 0x6
                when "11001101" => result <= "00000111"; -- 0x7
                when "11001110" => result <= "00001000"; -- 0x8
                when "11001111" => result <= "00001001"; -- 0x9
                when "11010000" => result <= "00001010"; -- 0xa
                when "11010001" => result <= "00001100"; -- 0xc
                when "11010010" => result <= "00001101"; -- 0xd
                when "11010011" => result <= "00001110"; -- 0xe
                when "11010100" => result <= "00010000"; -- 0x10
                when "11010101" => result <= "00010001"; -- 0x11
                when "11010110" => result <= "00010011"; -- 0x13
                when "11010111" => result <= "00010101"; -- 0x15
                when "11011000" => result <= "00010111"; -- 0x17
                when "11011001" => result <= "00011000"; -- 0x18
                when "11011010" => result <= "00011010"; -- 0x1a
                when "11011011" => result <= "00011100"; -- 0x1c
                when "11011100" => result <= "00011110"; -- 0x1e
                when "11011101" => result <= "00100000"; -- 0x20
                when "11011110" => result <= "00100011"; -- 0x23
                when "11011111" => result <= "00100101"; -- 0x25
                when "11100000" => result <= "00100111"; -- 0x27
                when "11100001" => result <= "00101001"; -- 0x29
                when "11100010" => result <= "00101100"; -- 0x2c
                when "11100011" => result <= "00101110"; -- 0x2e
                when "11100100" => result <= "00110000"; -- 0x30
                when "11100101" => result <= "00110011"; -- 0x33
                when "11100110" => result <= "00110110"; -- 0x36
                when "11100111" => result <= "00111000"; -- 0x38
                when "11101000" => result <= "00111011"; -- 0x3b
                when "11101001" => result <= "00111101"; -- 0x3d
                when "11101010" => result <= "01000000"; -- 0x40
                when "11101011" => result <= "01000011"; -- 0x43
                when "11101100" => result <= "01000110"; -- 0x46
                when "11101101" => result <= "01001001"; -- 0x49
                when "11101110" => result <= "01001011"; -- 0x4b
                when "11101111" => result <= "01001110"; -- 0x4e
                when "11110000" => result <= "01010001"; -- 0x51
                when "11110001" => result <= "01010100"; -- 0x54
                when "11110010" => result <= "01010111"; -- 0x57
                when "11110011" => result <= "01011010"; -- 0x5a
                when "11110100" => result <= "01011101"; -- 0x5d
                when "11110101" => result <= "01100000"; -- 0x60
                when "11110110" => result <= "01100011"; -- 0x63
                when "11110111" => result <= "01100110"; -- 0x66
                when "11111000" => result <= "01101010"; -- 0x6a
                when "11111001" => result <= "01101101"; -- 0x6d
                when "11111010" => result <= "01110000"; -- 0x70
                when "11111011" => result <= "01110011"; -- 0x73
                when "11111100" => result <= "01110110"; -- 0x76
                when "11111101" => result <= "01111001"; -- 0x79
                when "11111110" => result <= "01111100"; -- 0x7c
                when "11111111" => result <= "01111111"; -- 0x7f
                when others => result <= (others => '0');
            end case;    
        end if;
    end process;
end sine_table_arch;   