library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity buffer_testbench is
end buffer_testbench;

architecture Behavioral of buffer_testbench is
    component tristate_buffer is
    generic(
        data_width: natural
    );
    port(
        a    : in std_logic_vector(data_width-1 downto 0);
        q    : out std_logic_vector(data_width-1 downto 0);
        en   : in std_logic
    );
    end component;

    constant DATA_WIDTH : integer := 16;
    constant period : time := 200ns;
    signal clk      : std_logic;
    signal stop     : boolean := false;
    signal en       : std_logic;
    signal inp      : std_logic_vector(15 downto 0);
    signal outp     : std_logic_vector(15 downto 0);
    
    
begin
uut_16: tristate_buffer 
    generic map(
        data_width => DATA_WIDTH 
    )
    port map(
        a   => inp, 
        q   => outp, 
        en  => en
    );

------------------------------
-- The Clock of the test bench
------------------------------
clk_tick: 
    process
    begin
        while stop = false loop
            clk <= '1';
            wait for period/2;
            clk <= '0';
            wait for period/2;
        end loop;
        wait;
    end process;
    
------------------------------
-- Stimulating the UUT itself
------------------------------
stim:
    process
    begin
        en  <= '0';
        inp <= (others => '1');

        -- wait at bit to allow the device to settle from X
        wait for period/10; 

        assert outp = X"ZZZZ" report "Bus is outputting: " & to_hstring(outp);

        en  <= '1';

        -- wait at bit to allow the device to settle from X
        wait for period/10;

        assert inp = outp report "Buffer isn't outputting: " & to_hstring(outp);
        
        
        stop <= true;
        report "------------DONE-------------";
        wait;
    end process;

end Behavioral;
