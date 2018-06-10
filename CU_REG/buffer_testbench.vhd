library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity buffer_testbench is
end buffer_testbench;

architecture Behavioral of buffer_testbench is
    component buff is
	generic(data_width: natural);
	port(
    	IBus: in std_logic_vector(data_width-1 downto 0);
        OBus: out std_logic_vector(data_width-1 downto 0);
        e: in std_logic
	);
    end component;
    
    constant period : time := 200ns;
    signal clk  : std_logic;
    signal stop : boolean := false;
    signal en     : std_logic;
    signal inp  : std_logic_vector(15 downto 0);
    signal outp : std_logic_vector(15 downto 0);
    
    
begin
uut_16: buff 
    generic map(
        data_width =>16 
    )
    port map(
        inp, outp, en
    );
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
    
stim:
    process
    begin
        en <= '0';
        inp <= (others => '1');
        wait for period/10; -- wait at bit to allow the device to settle from XX
        assert outp = X"ZZZZ" report "Bus is outputting: " & to_hstring(outp);
        en <= '1';
        wait for period/10;
        assert inp = outp report "Buffer isn't outputting: " & to_hstring(outp);
        
        
        stop <= true;
        report "------------DONE-------------";
        wait;
    end process;

end Behavioral;
