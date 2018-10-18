library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity nor_testbench is
end nor_testbench;

architecture behavioural of nor_testbench is
    
    component nor_vector is
        generic(
            v_width : natural
        );
        port(
            d : in  std_logic_vector(v_width-1 downto 0);
            q : out std_logic
        );
    end component;
    
    constant width  : natural := 16;
    constant period : time    := 200ns;
    signal clk      : std_logic;
    signal stop     : boolean := false;
    
    signal q : std_logic;
    signal d : std_logic_vector(width-1 downto 0);
    
begin
    uut : nor_vector generic map(
        v_width => width
    )
    port map(
        d => d,
        q => q
    );
    
    stim : process
    begin
        for i in 0 to width-1 loop
            d <= (i => '1', others => '0');
            wait for 1ns;
            assert q = '0' report "Q isn't 0 when " & integer'image(i) & " : " & std_logic'image(q); 
        end loop;
        
        d <= (others => '0');
        wait for 1ns;
        assert q = '1' report "Q isn't 1 : " & std_logic'image(q);
        
        stop <= true;
        report "-------------DONE--------------";
        wait;
    end process;
    
end behavioural;
