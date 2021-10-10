library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity sine_gen_tb is
end;

architecture sine_gen_tb_arch of sine_gen_tb is
    component sine_gen is
      port(
        clk: in std_logic;
        btn_up: in std_logic;
        btn_down: in std_logic;
        sin_out: out std_logic_vector(7 downto 0)
      );
    end component;

    signal clk_tb: std_logic := '0';
    signal btn_up_tb: std_logic := '0';
    signal btn_down_tb: std_logic := '0';
    signal result_tb: std_logic_vector(7 downto 0);

begin

    SINEWAVE_GEN : sine_gen 
    port map (
      clk => clk_tb,
      btn_up => btn_up_tb,
      btn_down => btn_down_tb,
      sin_out => result_tb
    );
    
    --- Test Procedure ---
    clk_tb <= not clk_tb after 10 ns;

    TEST: process
    begin
        wait for 1.5 us;
        btn_up_tb <= '0';
        wait for 100 ns;
        btn_up_tb <= '1';
        wait for 100 ns;
        btn_up_tb <= '0';
        wait;
    end process;
end;