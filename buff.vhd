-- Code your design here
library IEEE;
use IEEE.std_logic_1164.all;

entity buff is
	generic(data_width: natural);
	port(
    	IBus: in std_logic_vector(data_width-1 downto 0);
        OBus: out std_logic_vector(data_width-1 downto 0);
        e: in std_logic
	);

end entity buff;

architecture behav of buff is

begin
    
    OBus <= IBus when (e = '1') else (others => 'Z');

end architecture behav;