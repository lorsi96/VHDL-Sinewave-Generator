library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity button_counter_tb is
end;

architecture button_counter_tb_arch of button_counter_tb is
    component button_counter is
        generic(
            N: natural := 2;
            N_BITS: natural := 2
        );
        port( 
            clk:    in std_logic;
            up:     in std_logic;
            down:   in std_logic;
            cnt:    out std_logic_VECTOR (N_BITS - 1 downto 0)
        );
    end component;


    -- Signals --
    signal clk_tb: std_logic := '0';
    signal btn_up_tb: std_logic := '0';
    signal btn_down_tb: std_logic := '0';
    signal btn_cnt_out_tb: std_logic_vector(1 downto 0);

begin

    clk_tb <= not clk_tb after 10 ns;

    DUT : button_counter 
    port map (
      clk => clk_tb,
      up => btn_up_tb,
      down => btn_down_tb,
      cnt => btn_cnt_out_tb
    );

    TEST: process
    begin
        wait for 100 ns;
        btn_up_tb <= '0';
        wait for 100 ns;
        btn_up_tb <= '1';
        wait for 100 ns;
        btn_up_tb <= '0';
        
        assert (unsigned(btn_cnt_out_tb) = 1) report "Button Up not counting up" severity failure;

        wait for 100 ns;
        btn_up_tb <= '0';
        wait for 100 ns;
        btn_up_tb <= '1';
        wait for 100 ns;
        btn_up_tb <= '0';
        
        assert (unsigned(btn_cnt_out_tb) = 2) report "Button Up not counting up" severity failure;

        wait for 100 ns;
        btn_up_tb <= '0';
        wait for 100 ns;
        btn_up_tb <= '1';
        wait for 100 ns;
        btn_up_tb <= '0';
        
        assert (unsigned(btn_cnt_out_tb) = 2) report "Button Up not counting up" severity failure;

        wait for 100 ns;
        btn_up_tb <= '0';
        wait for 100 ns;
        btn_up_tb <= '1';
        wait for 100 ns;
        btn_up_tb <= '0';
        
        assert (unsigned(btn_cnt_out_tb) = 2) report "Button Up not counting up" severity failure;

        wait for 100 ns;
        btn_down_tb <= '0';
        wait for 100 ns;
        btn_down_tb <= '1';
        wait for 100 ns;
        btn_down_tb <= '0';
        
        assert (unsigned(btn_cnt_out_tb) = 1) report "Button Up not counting up" severity failure;

        wait for 100 ns;
        btn_down_tb <= '0';
        wait for 100 ns;
        btn_down_tb <= '1';
        wait for 100 ns;
        btn_down_tb <= '0';
        
        assert (unsigned(btn_cnt_out_tb) = 0) report "Button Up not counting up" severity failure;

        wait for 100 ns;
        btn_down_tb <= '0';
        wait for 100 ns;
        btn_down_tb <= '1';
        wait for 100 ns;
        btn_down_tb <= '0';
        
        assert (unsigned(btn_cnt_out_tb) = 0) report "Button Up not counting up" severity failure;

        wait for 100 ns;
        btn_down_tb <= '0';
        wait for 100 ns;
        btn_down_tb <= '1';
        wait for 100 ns;
        btn_down_tb <= '0';
        
        assert (unsigned(btn_cnt_out_tb) = 0) report "Button Up not counting up" severity failure;

        wait for 100 ns;
        wait;

    end process;
end;