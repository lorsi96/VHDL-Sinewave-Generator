library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;


entity sine_gen is
    port(
        clk: in std_logic;
        btn_up: in std_logic;
        btn_down: in std_logic;
        sin_out: out std_logic_vector(7 downto 0)
    );
end;

architecture sine_gen_arch of sine_gen is
    
    component generic_counter is
         port (
            cout   :out std_logic_vector (7 downto 0); -- Output of the counter
            enable :in  std_logic;                     -- Enable counting
            clk    :in  std_logic;                     -- Input clock
            offset :in  std_logic_vector(2 downto 0);
            reset  :in  std_logic                      -- Input reset
         );
    end component;
    
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
   
    signal cnt_out_addr_in: std_logic_Vector(7 downto 0);
    signal btn_out_mul_in: std_logic_vector(2 downto 0);
   
begin
    
    buttons_counter: button_counter
    port map (
        clk => clk,
        up => btn_up,
        down => btn_down,
        cnt => btn_out_mul_in    
    );
    
    counter: generic_counter
    port map (
        clk => clk,
        enable => '1',
        reset => '0',
        offset => btn_out_mul_in,
        cout => cnt_out_addr_in    
    );
    

    sine : sine_lut
    port map(
        address_in => cnt_out_addr_in,
        data_out => sin_out
    );

end;