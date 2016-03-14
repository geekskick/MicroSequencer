-- Code your design here
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity three_bit_decoder is
port(input: in std_logic_vector(2 downto 0);
	 O0, O1, O2, O3, O4, O5, O6, O7 : out std_logic
	 );
end entity three_bit_decoder;

architecture behave of three_bit_decoder is
	
	signal int_ops : std_logic_vector(7 downto 0) := (others => '1');

begin

	O0 <= int_ops(0);
	O1 <= int_ops(1);
	O2 <= int_ops(2);
	O3 <= int_ops(3);
	O4 <= int_ops(4);
	O5 <= int_ops(5);
	O6 <= int_ops(6);
	O7 <= int_ops(7);
    
	process(input)
    begin

    	case input is
        	when "000" => int_ops <= (0 => '1' , others => '0');
            when "001" => int_ops <= (1 => '1' , others => '0');
            when "010" => int_ops <= (2 => '1' , others => '0');
            when "011" => int_ops <= (3 => '1' , others => '0');
            when "100" => int_ops <= (4 => '1' , others => '0');
            when "101" => int_ops <= (5 => '1' , others => '0');
            when "110" => int_ops <= (6 => '1' , others => '0');
            when "111" => int_ops <= (7 => '1' , others => '0');
            when others => int_ops <= (others => '0');
            end case;

    end process;
	
end architecture behave;