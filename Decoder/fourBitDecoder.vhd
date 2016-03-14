-- Code your design here
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity four_bit_decoder is
port(input: in std_logic_vector(3 downto 0);
     O0, O1, O2, O3, O4, O5, O6, O7, O8, O9, O10, O11, O12, O13, O14, O15 : out std_logic
     );
end entity four_bit_decoder;

architecture behave of four_bit_decoder is
    
    signal int_ops : std_logic_vector(15 downto 0) := (others => '1');

begin

    O0 <= int_ops(0);
    O1 <= int_ops(1);
    O2 <= int_ops(2);
    O3 <= int_ops(3);
    O4 <= int_ops(4);
    O5 <= int_ops(5);
    O6 <= int_ops(6);
    O7 <= int_ops(7);
    O8 <= int_ops(8);
    O9 <= int_ops(9);
    O10 <= int_ops(10);
    O11 <= int_ops(11);
    O12 <= int_ops(12);
    O13 <= int_ops(13);
    O14 <= int_ops(14);
    O15 <= int_ops(15);
    
    process(input)
    begin

        case input is
            when "0000" => int_ops <= (0 => '1' , others => '0');
            when "0001" => int_ops <= (1 => '1' , others => '0');
            when "0010" => int_ops <= (2 => '1' , others => '0');
            when "0011" => int_ops <= (3 => '1' , others => '0');
            when "0100" => int_ops <= (4 => '1' , others => '0');
            when "0101" => int_ops <= (5 => '1' , others => '0');
            when "0110" => int_ops <= (6 => '1' , others => '0');
            when "0111" => int_ops <= (7 => '1' , others => '0');
            when "1000" => int_ops <= (8 => '1' , others => '0');
            when "1001" => int_ops <= (9 => '1' , others => '0');
            when "1010" => int_ops <= (10 => '1' , others => '0');
            when "1011" => int_ops <= (11 => '1' , others => '0');
            when "1100" => int_ops <= (12 => '1' , others => '0');
            when "1101" => int_ops <= (13 => '1' , others => '0');
            when "1110" => int_ops <= (14 => '1' , others => '0');
            when "1111" => int_ops <= (15 => '1' , others => '0');
            when others => int_ops <= (others => '0');
            end case;

    end process;
    
end architecture behave;