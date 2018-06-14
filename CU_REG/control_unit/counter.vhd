library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;

entity counter is
port( 
    inc     : in std_logic;
    clk     : in std_logic;
    clr     : in std_logic;
	count   : out std_logic_vector(3 downto 0)
    );
end entity counter;
    
    
architecture behav of counter is
	
    signal count_i: std_logic_vector(3 downto 0) := "0000";

begin
	    
    process(clk)
    begin
    	if rising_edge(clk) then
            if inc = '1' then
                count_i <= std_logic_vector(unsigned(count_i) + 1);
            elsif clr = '1' then
                count_i <= "0000";
            end if;
        end if;
    end process;
    
    count <= count_i;
    
end architecture behav;