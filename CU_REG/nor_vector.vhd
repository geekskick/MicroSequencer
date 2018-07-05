library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity nor_vector is
    generic(
        v_width : natural
    );
    port(
        d : in  std_logic_vector(v_width-1 downto 0);
        q : out std_logic
    );
end nor_vector;

architecture behav of nor_vector is
    
begin
    q <= '1' when to_integer(unsigned(d)) = 0 else '0';
    
end behav;
