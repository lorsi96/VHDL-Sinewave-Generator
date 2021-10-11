library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity generic_counter_tb is
end;


architecture generic_counter_tb_arch of generic_counter_tb is

    component generic_counter is
        generic(
            OUTPUT_WIDTH:        natural := 8;
            COUNT_OFFSET_WIDTH:  natural := 3 
        );
        port (
            cout   :out std_logic_vector (OUTPUT_WIDTH - 1 downto 0); 
            enable :in  std_logic;                     
            clk    :in  std_logic;                     
            offset :in  std_logic_vector(COUNT_OFFSET_WIDTH - 1 downto 0);
            reset  :in  std_logic                      
        );
    end component generic_counter;


   signal clk_in_tb: std_logic := '0';
   signal step_in_tb: std_logic_vector(2 downto 0) := (others => '0');

   signal data_out_tb: std_logic_vector(7 downto 0);
   signal rst_out_tb: std_logic;

begin

    clk_in_tb <= not clk_in_tb after 10 ns;

    DUT: generic_counter
    port map(
        clk => clk_in_tb,
        enable => '1',
        offset => step_in_tb,
        reset => '0',
        cout => data_out_tb
    );

    TEST: process
    begin
        wait for 40 ns;
        step_in_tb <= "011";
        wait for 40 ns;
        step_in_tb <= "010";
        wait;
    end process;
end;