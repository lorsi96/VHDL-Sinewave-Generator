library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;


entity sinewave_gen_top is
    port(
        clk: in std_logic
    );
end;

architecture sinewave_gen_top_arch of sinewave_gen_top is
    component generic_counter is
         port (
            cout   :out std_logic_vector (7 downto 0); 
            enable :in  std_logic;                     
            clk    :in  std_logic;                     
            offset :in  std_logic_vector(2 downto 0);
            reset  :in  std_logic                      
         );
    end component;

    --component clk_gen is
    --    generic(
    --        SIN_SAMPLES_N: natural := 256;
    --        BASE_SIN_FREQ_HZ: natural := 100;
    --        CLOCK_RATE: natural := 50E6
    --   );
    --    port(
    --        clk: 			in std_logic;
    --        rst: 			in std_logic;       
    --        clk_out:		out std_logic := '0'
    --    );
    --end component;
    
    component sine_lut is
        port(
            address_in: in std_logic_vector(7 downto 0);
            data_out: out std_logic_vector(7 downto 0)
        );
    end component sine_lut;
    
    component button_counter is
        generic(
            N: natural := 5
        );
        port( 
            clk:    in std_logic;
            up:     in STD_LOGIC;
            down:   in STD_LOGIC;
            cnt:    out STD_LOGIC_VECTOR (2 downto 0)
        );
    end component button_counter;
        
    --- Debugging Components ---
    COMPONENT buttons_vio
      PORT (
        clk : IN STD_LOGIC;
        probe_in0 : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
        probe_out0 : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
        probe_out1 : OUT STD_LOGIC_VECTOR(0 DOWNTO 0)
      );
    END COMPONENT;

    COMPONENT ila_0
    PORT (
        clk : IN STD_LOGIC;
        probe0 : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
        probe1 : IN STD_LOGIC_VECTOR(7 DOWNTO 0)
    );
    END COMPONENT;
   
    -- Signals --
    signal dwnsmpl_clk: std_logic;
    signal cnt_out_addr_in: std_logic_vector(7 downto 0);
    signal data_out_probe_in: std_logic_vector(7 downto 0);
    signal btn_out_mul_in: std_logic_vector(2 downto 0);
    signal up_vio: std_logic_vector(0 downto 0);
    signal down_vio: std_logic_vector(0 downto 0);
   
begin
    
    sine_ila : ila_0
    PORT MAP (
        clk => dwnsmpl_clk,
        probe0 => data_out_probe_in,
        probe1 => cnt_out_addr_in
    );
    
    vio_buttons : buttons_vio
      PORT MAP (
        clk => clk,
        probe_in0 => btn_out_mul_in,
        probe_out0 => up_vio,
        probe_out1 => down_vio
      );
    
    buttons_counter: button_counter
    port map (
        clk => dwnsmpl_clk,
        up => up_vio(0),
        down => down_vio(0),
        cnt => btn_out_mul_in    
    );
    
    counter: generic_counter
    port map (
        clk => dwnsmpl_clk,
        enable => '1',
        reset => '0',
        offset => btn_out_mul_in,
        cout => cnt_out_addr_in    
    );


    sine : sine_lut
    port map(
        address_in => cnt_out_addr_in,
        data_out => data_out_probe_in
    );
    
    dwnsmpl_clk <= clk;
    --clk_gen_inst: clk_gen
    --port map(
    --    clk => clk,
    --    rst => '0',
    --    clk_out:		out std_logic := '0'
    --);

end;