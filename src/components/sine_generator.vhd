library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;


entity sine_generator is
    -- Generic Configuration --
    generic(
        -- Output Sine Base (min) Frequency --
        BASE_SIN_FREQ_HZ: natural := 100;
        -- Input Frequency Clk Speed --
        CLOCK_RATE: natural := 50e6 
    );
    -- Port Declaration --
    port(
        -- Input Clock, shall run at CLOCK_RATE Hz --
        clk: in std_logic;
        
        -- Frequency Manipulators --
        up: in std_logic;
        down: in std_logic;

        -- 8 bit sinewave output --
        result: out std_logic_vector(7 downto 0)
    );
end;

architecture sine_generator_arch of sine_generator  is
    
    component buttons is
        generic(BTN_CNT_MAX_BITS: natural := 4);
        port(
            btn_up: in std_logic;
            btn_down: in std_logic;
            btn_cnt_out: out unsigned(BTN_CNT_MAX_BITS-1 downto 0)
        );
    end component;

    component sine_table is
        port(
          clk: in std_logic;
          mul: in unsigned(3 downto 0);
          result: out std_logic_vector(7 downto 0)
        );
    end component;

    component clk_gen is
      generic(
        SIN_SAMPLES_N: natural := 256;
        BASE_SIN_FREQ_HZ: natural := BASE_SIN_FREQ_HZ;
        CLOCK_RATE: natural := CLOCK_RATE
      );
      port(
        clk: in std_logic;
        rst: in std_logic;       
        clk_out: out std_logic
      );
    end component;

    signal downsampled_clk: std_logic := '0';
    signal sine_table_next: std_logic := '0';
    signal mul: unsigned(3 downto 0) := (others => '0');

begin

    BTNS: buttons
    port map(
      btn_up => up,
      btn_down => down,
      btn_cnt_out => mul
    );

    CLKGEN: clk_gen
    port map(
        clk => clk,
        rst => '0',
        clk_out => downsampled_clk
    );


    SIN_GEN: sine_table
    port map(
      clk => downsampled_clk,
      mul => mul,
      result => result
    );


end;