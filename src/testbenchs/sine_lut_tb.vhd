library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity sine_lut_tb is
end;


architecture sine_lut_tb_arch of sine_lut_tb is
    constant ADDR_BITS : natural := 10;
    constant OUTPUT_BITS : natural := 8;

    component sine_lut is
        port(
            address_in: in std_logic_vector(ADDR_BITS - 1 downto 0);
            data_out: out std_logic_vector(OUTPUT_BITS - 1 downto 0)
        );
    end component sine_lut;


   signal address_in_tb: std_logic_vector(ADDR_BITS - 1 downto 0);
   signal data_out_tb: std_logic_vector(OUTPUT_BITS - 1 downto 0);


begin

    DUT: sine_lut
    port map(
        address_in => address_in_tb,
        data_out => data_out_tb
    );

    TEST: process
    begin
        address_in_tb <= "0000000000";
        wait for 10 ns;
        address_in_tb <= "0111111111";
        wait for 10 ns;
        wait;        
    end process;
end;