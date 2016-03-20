-- Code your design here
library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;

entity counter is
port( INC, CLK, CLR : in std_logic;
	COUNT: out std_logic_vector(3 downto 0)
    );
end entity counter;
    
    
architecture behav of counter is
	
    signal ICount: std_logic_vector(3 downto 0) := "0000";

begin
	    
    process(clk)
    begin
    	if rising_edge(clk) then
        	if INC = '1' then
            	ICount <= std_logic_vector(unsigned(ICount) + 1);
            elsif CLR = '1' then
            	ICount <= "0000";
            end if;
        end if;
    end process;
    
    COUNT <= ICount;
    
end architecture behav;