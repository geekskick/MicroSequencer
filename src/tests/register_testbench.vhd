library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity register_testbench is
end register_testbench;

architecture behavioural of register_testbench is
    component generic_register is
        generic(
            data_width : natural
        );
        port(
            clk  : in  std_logic;
            data : in  std_logic_vector(data_width-1 downto 0);
            load : in  std_logic;
            inc  : in  std_logic;
            q    : out std_logic_vector(data_width-1 downto 0)
        );
    end component;
    
    constant DATA_WIDTH : integer := 16;
    constant period     : time    := 200ns;
    signal clk          : std_logic;
    signal stop         : boolean := false;
    
    signal inc  : std_logic;
    signal ld   : std_logic;
    signal data : std_logic_vector(DATA_WIDTH-1 downto 0);
    signal q    : std_logic_vector(DATA_WIDTH-1 downto 0);
    
    
begin
    uut_16 : generic_register generic map(
        data_width => DATA_WIDTH 
    )
    port map(
        clk  => clk,
        data => data,
        load => ld,
        inc  => inc,
        q    => q
    );
    
    ------------------------------
    -- The Clock of the test bench
    ------------------------------
    clk_tick : process
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
    stim : process
    begin
        data <= (others => '1');
        ld   <= '0';
        inc  <= '0';
        
        wait for period;
        
        assert q /= data report "Outout of register is data without a load : " & to_hstring(q);
        
        ld <= '1';
        wait for period;
        assert q = data report "Outout of register isnt data with a load : " & to_hstring(q);
        ld  <= '0';
        inc <= '1';
        wait for period;
        assert to_integer(unsigned(q)) = 0 report "Outout of register didn't increment : " & to_hstring(q);
        
        
        stop <= true;
        report "------------DONE-------------";
        wait;
    end process;
    
end behavioural;
