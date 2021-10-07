library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;


entity sinewave_gen_top is
    port(
        clk: in std_logic
    );
end;

architecture sinewave_gen_top_arch of sinewave_gen_top is

    -- Note: Commented out code lists the changes needed to make this module
    --        runnable in a real environment (a.k.a with physical switches).

    COMPONENT vio_0
      PORT (
        clk : IN STD_LOGIC;
        probe_in0 : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
        probe_out0 : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
        probe_out1 : OUT STD_LOGIC_VECTOR(0 DOWNTO 0)
      );
    END COMPONENT;

    -- component meta_harden is
    --    port(
    --        clk_dst: 	in std_logic;	-- Destination clock
    --        rst_dst: 	in std_logic;	-- Reset - synchronous to destination clock
    --        signal_src: in std_logic;	-- Asynchronous signal to be synchronized
    --        signal_dst: out std_logic	-- Synchronized signal
    --    );
    -- end component;
    
    COMPONENT ila_sine
    PORT (
        clk : IN STD_LOGIC;
        probe0 : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
        probe1 : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
        probe2 : IN STD_LOGIC_VECTOR(7 DOWNTO 0)
    );
    END COMPONENT;

    component sine_generator is
        generic(
            BASE_SIN_FREQ_HZ: natural := 5000;
            CLOCK_RATE: natural := 50e6 
        );
        port(
            clk: in std_logic;
            up: in std_logic;
            down: in std_logic;
            result: out std_logic_vector(7 downto 0);
            dsclk: out std_logic;
            dbg_table_cnt: out std_logic_vector(7 downto 0)
        );
    end component;

    signal up_btn_async: std_logic_vector(0 downto 0) := "0";
    signal dwn_btn_async: std_logic_vector(0 downto 0) := "0";
    signal up_btn: std_logic := '0';
    signal dwn_btn: std_logic := '0';
    signal digital_sine: std_logic_vector(7 downto 0) := (others => '0');

    -- Debug Signals --
    signal dsclk_probe: std_logic_vector(0 downto 0);
    signal dbg_table_cnt: std_logic_vector(7 downto 0);

begin

   SINE_VIO : vio_0
   PORT MAP (
     clk => clk,
     probe_in0 => digital_sine,
     probe_out0 => up_btn_async,  -- up_btn,
     probe_out1 => dwn_btn_async -- dwn_btn
   );

   
    --META_HARDEN_UP: meta_harden 
    --port map (
    --    clk_dst => clk,
    --    rst_dst => '0',
    --    signal_src => up_btn_async(0),
    --    signal_dst => up_btn
    --);

    --META_HARDEN_DOWN: meta_harden 
    --port map (
    --    clk_dst => clk,
    --    rst_dst => '0',
    --    signal_src => dwn_btn_async(0),
    --    signal_dst => dwn_btn
    --);
    
    sine_ila : ila_sine
    PORT MAP (
        clk => clk,
        probe0 => digital_sine,
        probe1 => dsclk_probe,
        probe2 => dbg_table_cnt
    );

    SINE_GEN: sine_generator
    port map (
        clk => clk,
        up => up_btn_async(0), -- up_btn
        down => dwn_btn_async(0), --down_btn
        result => digital_sine,
        dsclk => dsclk_probe(0),
        dbg_table_cnt => dbg_table_cnt
    );

end;