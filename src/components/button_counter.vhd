library IEEE;
use IEEE.std_logic_1164.ALL;
use IEEE.numeric_std.all;


entity button_counter is
    generic(
        N: natural := 5;
        N_BITS: natural := 3
    );
    port( 
        clk:    in std_logic;
        up:     in std_logic;
        down:   in std_logic;
        cnt:    out std_logic_VECTOR (N_BITS - 1 downto 0)
    );
end button_counter;

architecture button_counter_arch of button_counter is 
    signal internal_counter: unsigned(N_BITS - 1 downto 0) := (others => '0'); 
    signal last_up    : std_logic := '0';
    signal last_down    : std_logic := '0';
begin
    process(clk)
    begin
        if rising_edge(clk) then
            if up = '1' and last_up = '0' and internal_counter < N then
                internal_counter <= internal_counter + 1;
            end if;
            if down = '1' and last_down = '0' and internal_counter > 0 then
                internal_counter <= internal_counter - 1;
            end if;
            last_up <= up;
            last_down <= down;
        end if; 
    end process;
    cnt <= std_logic_vector(internal_counter);
end button_counter_arch;
