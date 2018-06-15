library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity three_bit_decoder is
    port(
        a   : in std_logic_vector(2 downto 0);
    	d0  : out std_logic;
        d1  : out std_logic; 
        d2  : out std_logic; 
        d3  : out std_logic; 
        d4  : out std_logic; 
        d5  : out std_logic; 
        d6  : out std_logic; 
        d7  : out std_logic
    );
end entity three_bit_decoder;

architecture behave of three_bit_decoder is
	
	signal d_i : std_logic_vector(7 downto 0) := (others => '0');

begin

	d0 <= d_i(0);
	d1 <= d_i(1);
	d2 <= d_i(2);
	d3 <= d_i(3);
	d4 <= d_i(4);
	d5 <= d_i(5);
	d6 <= d_i(6);
	d7 <= d_i(7);
    
	process(a)
    begin
    	case a is
        	when "000" => d_i <= (0 => '1' , others => '0');
            when "001" => d_i <= (1 => '1' , others => '0');
            when "010" => d_i <= (2 => '1' , others => '0');
            when "011" => d_i <= (3 => '1' , others => '0');
            when "100" => d_i <= (4 => '1' , others => '0');
            when "101" => d_i <= (5 => '1' , others => '0');
            when "110" => d_i <= (6 => '1' , others => '0');
            when "111" => d_i <= (7 => '1' , others => '0');
            when others => d_i <= (others => '0');
        end case;
    end process;
	
end architecture behave;