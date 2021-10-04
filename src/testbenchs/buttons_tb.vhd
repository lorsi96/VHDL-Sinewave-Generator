library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity buttons_tb is
end;

architecture buttons_tb_arch of buttons_tb is
    component buttons is
        generic(BTN_CNT_MAX_BITS: natural := 2);
        port(
            btn_up: in std_logic;
            btn_down: in std_logic;
            btn_cnt_out: out unsigned(BTN_CNT_MAX_BITS-1 downto 0)
        );
    end component;


    -- Signals --
    signal btn_up_tb: std_logic := '0';
    signal btn_down_tb: std_logic := '0';
    signal btn_cnt_out_tb: unsigned(1 downto 0);

begin

    BUTTONS_DUT : buttons 
    port map (
      btn_up => btn_up_tb,
      btn_down => btn_down_tb,
      btn_cnt_out => btn_cnt_out_tb
    );

    TEST: process
    begin
        wait for 20 ns;
        btn_up_tb <= '0';
        wait for 20 ns;
        btn_up_tb <= '1';
        wait for 20 ns;
        btn_up_tb <= '0';
        
        assert (btn_cnt_out_tb = 1) report "Button Up not counting up" severity failure;

        wait for 20 ns;
        btn_up_tb <= '0';
        wait for 20 ns;
        btn_up_tb <= '1';
        wait for 20 ns;
        btn_up_tb <= '0';
        
        assert (btn_cnt_out_tb = 2) report "Button Up not counting up" severity failure;

        wait for 20 ns;
        btn_up_tb <= '0';
        wait for 20 ns;
        btn_up_tb <= '1';
        wait for 20 ns;
        btn_up_tb <= '0';
        
        assert (btn_cnt_out_tb = 3) report "Button Up not counting up" severity failure;

        wait for 20 ns;
        btn_up_tb <= '0';
        wait for 20 ns;
        btn_up_tb <= '1';
        wait for 20 ns;
        btn_up_tb <= '0';
        
        assert (btn_cnt_out_tb = 3) report "Button Up not counting up" severity failure;

        wait for 20 ns;
        btn_down_tb <= '0';
        wait for 20 ns;
        btn_down_tb <= '1';
        wait for 20 ns;
        btn_down_tb <= '0';
        
        assert (btn_cnt_out_tb = 2) report "Button Up not counting up" severity failure;

        wait for 20 ns;
        btn_down_tb <= '0';
        wait for 20 ns;
        btn_down_tb <= '1';
        wait for 20 ns;
        btn_down_tb <= '0';
        
        assert (btn_cnt_out_tb = 1) report "Button Up not counting up" severity failure;

        wait for 20 ns;
        btn_down_tb <= '0';
        wait for 20 ns;
        btn_down_tb <= '1';
        wait for 20 ns;
        btn_down_tb <= '0';
        
        assert (btn_cnt_out_tb = 0) report "Button Up not counting up" severity failure;

        wait for 20 ns;
        btn_down_tb <= '0';
        wait for 20 ns;
        btn_down_tb <= '1';
        wait for 20 ns;
        btn_down_tb <= '0';
        
        assert (btn_cnt_out_tb = 0) report "Button Up not counting up" severity failure;

        wait for 20 ns;
        wait;

    end process;
end;