library ieee;
use ieee.std_logic_1164.all;
use IEEE.numeric_std.all;
 
 entity generic_counter is
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
 end entity;
 
 architecture rtl of generic_counter is
     signal count: unsigned(OUTPUT_WIDTH - 1 downto 0) := (others => '0');
 begin
     process (clk, reset) begin
         if (reset = '1') then
             count <= (others=>'0');
        elsif (rising_edge(clk)) then
            if (enable = '1') then
                count <= count + unsigned(offset) + 1;
             end if;
         end if;
     end process;
     cout <= std_logic_vector(count);
 end architecture;