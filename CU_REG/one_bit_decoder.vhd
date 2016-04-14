-- Code your design here
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity one_bit_decoder is
port(input: in std_logic;
	 O0, O1: out std_logic
	 );
end entity one_bit_decoder;

architecture behave of one_bit_decoder is
	
	signal int_ops : std_logic_vector(1 downto 0) := (others => '1');

begin

	O0 <= int_ops(0);
	O1 <= int_ops(1);
    
	process(input)
    begin

    	case input is
        	when '0' => int_ops <= (0 => '1' , others => '0');
            when '1' => int_ops <= (1 => '1' , others => '0');
            when others => int_ops <= (others => '0');
            end case;

    end process;
	
end architecture behave;