library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity generic_counter_tb is
end;


architecture generic_counter_tb_arch of generic_counter_tb is

    component generic_counter is
       generic (
           N: natural := 8;
           S: natural := 1  
       );
       port(
           clk_in: in std_logic;
           rst_in: in std_logic;
           step_in: in unsigned(S-1 downto 0);
   
           data_out: out unsigned(N-1 downto 0);
           rst_out: out std_logic
       );
    end component generic_counter;


   signal clk_in_tb: std_logic := '0';
   signal rst_in_tb: std_logic := '0';
   signal step_in_tb: unsigned(0 downto 0) := (others => '0');

   signal data_out_tb: unsigned(7 downto 0);
   signal rst_out_tb: std_logic;
   signal hello: std_logic_vector(7 downto 0);



begin

    clk_in_tb <= not clk_in_tb after 10 ns;
    hello <= std_logic_vector(data_out_tb);

    DUT: generic_counter
    port map(
        clk_in => clk_in_tb,
        rst_in => rst_in_tb,
        step_in => step_in_tb,
        data_out => data_out_tb,
        rst_out => rst_out_tb
    );

    TEST: process
    begin
        wait for 100 ns;
    end process;
end;