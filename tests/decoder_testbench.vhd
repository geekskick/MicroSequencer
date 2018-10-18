library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity decoder_testbench is
end decoder_testbench;

architecture behavioural of decoder_testbench is
    
    -------------------------------------------
    -- Count the number of bits set in a vector
    -------------------------------------------
    function bits_set(v : std_logic_vector) return natural is
        variable n : natural := 0;
    begin
        for i in v'range loop
            if v(i) = '1' then
                n := n + 1;
            end if;
        end loop;
        return n;
    end function bits_set;
    
    component three_bit_decoder is
        port(
            a  : in  std_logic_vector(2 downto 0);
            d0 : out std_logic;
            d1 : out std_logic; 
            d2 : out std_logic; 
            d3 : out std_logic; 
            d4 : out std_logic; 
            d5 : out std_logic; 
            d6 : out std_logic; 
            d7 : out std_logic
        );
    end component;
    
    constant period : time := 200ns;
    signal clk      : std_logic;
    signal stop     : boolean := false;
    
    signal d : std_logic_vector(7 downto 0);
    signal a : std_logic_vector(2 downto 0);
    
    
begin
    uut : three_bit_decoder port map(
        a  => a,
        d0 => d(0),
        d1 => d(1), 
        d2 => d(2), 
        d3 => d(3), 
        d4 => d(4), 
        d5 => d(5),
        d6 => d(6), 
        d7 => d(7)
    );
        
    ------------------------------
    -- Stimulating the UUT itself
    ------------------------------
    stim : process
    begin
        for i in 0 to 7 loop
            a <= std_logic_vector(to_unsigned(i, a'length));
            wait for 1ns;
            assert bits_set(d) = 1 report "1 bit isn't set : " & to_hstring(d) severity failure;
            assert d(i) = '1' report "wrong bit set, its not " & integer'image(i) severity failure;
        end loop;
        
        stop <= true;
        report "------------DONE-------------";
        wait;
    end process;
    
end behavioural;
