library ieee;
use ieee.std_logic_1164.all;

entity tristate_buffer is
    generic(
        data_width : natural
    );
    port(
        a  : in  std_logic_vector(data_width-1 downto 0);
        q  : out std_logic_vector(data_width-1 downto 0);
        en : in  std_logic
    );
    
end entity tristate_buffer;

architecture behav of tristate_buffer is
    
begin
    q <= a when (en = '1') else (others => 'Z');
    
end architecture behav;