library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity cu_testbench is
end cu_testbench;

architecture Behavioral of cu_testbench is

    component top_model_cu is
    port( 
        -- INPUTS
        z, clk      : in std_logic;
        IR          : in std_logic_vector(4 downto 0); -- INSTRUCTION REGISTER LOW NIBBLE + 1
       
        -- COMMAND SIGNALS
        error, ARLOAD, ARINC, R, W, MEMBUS, BUSMEM, PCINC, PCLOAD, PCBUS, DRLBUS, DRHBUS, DRLOAD, TRLOAD, TRBUS, IRLOAD, RLOAD, RBUS, ACLOAD, ACBUS, ZLOAD    : out std_logic;

        alu_cmd : out std_logic_vector(3 downto 0); -- TO THE ALU INPUT
       
        --segment displayers
        curr_add_H: out std_logic_vector(6 downto 0); -- HIGH NIBBLE OF CURRENT MICROCODE ADDRESS
        curr_add_L: out std_logic_vector(6 downto 0); -- LOW NIBBLE OF CURRENT MICROCODE ADDRESS
        curr_alu_S: out std_logic_vector(6 downto 0)  -- ALUSELECT DISPLAY
    );
    end component;
    
    constant ldac : std_logic_vector(7 downto 0) := X"01";
    constant period : time := 200ns;
    signal clk  : std_logic;
    signal stop : boolean := false;
    
    signal ir: std_logic_vector(4 downto 0);
    signal alu:std_logic_vector(3 downto 0);
    
    signal z, error, ARLOAD, ARINC, R, W, MEMBUS, BUSMEM, PCINC, PCLOAD, PCBUS, DRLBUS, DRHBUS, DRLOAD, TRLOAD, TRBUS, IRLOAD, RLOAD, RBUS, ACLOAD, ACBUS, ZLOAD: std_logic;

    
begin
uut: top_model_cu port map(
    z, clk, ir, error, ARLOAD, ARINC, R, W, MEMBUS, BUSMEM, PCINC, PCLOAD, PCBUS, DRLBUS, DRHBUS, DRLOAD, TRLOAD, TRBUS, IRLOAD, RLOAD, RBUS, ACLOAD, ACBUS, ZLOAD, alu, open, open, open
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
        -- LDAC
        ir <= "00001"; 
        
        -- allow for rising edge to be detected on first tick
        -- FETCH1
        wait for period/4;
        report "FETCH1";
        assert PCBUS = '1' report "PCBUS incorrect in FETCH1: " & std_logic'image(PCBUS);
        assert ARLOAD = '1' report "ARLOAD incorrect in FETCH1: " & std_logic'image(ARLOAD);
         
        --FETCH2 
        wait for period;
        report "FETCH2";
        assert MEMBUS = '1' report "MEMBUS incorrect in FETCH2: " & std_logic'image(MEMBUS);
        assert PCINC = '1' report "PCINC";
        assert DRLOAD = '1' report "DRLOAD";
         
        -- FETCH3
        wait for period;
        report "FETCH3";
        assert PCBUS = '1' report "PCBUS";
        assert IRLOAD = '1' report "IRLOAD";
        assert ARLOAD = '1' report "ARLOAD";
        
        --LDAC0
        wait for period;
        report "LDAC0";
        
        -- LDAC 1
        wait for period;
        report "LDAC1";
        assert DRLOAD = '1' report "DRLOAD";
        assert MEMBUS = '1' report "MEMBUS";
        assert PCINC = '1' report "PCINC";
        assert ARINC = '1' report "ARINC";
        
        -- LDAC 2
        wait for period;
        report "LDAC2";
        assert TRLOAD = '1' report "TRLOAD";
        assert DRLOAD = '1' report "DRLOAD";
        assert MEMBUS = '1' report "MEMBUS";
        assert PCINC = '1' report "PCINC";
        
        -- LDAC 3
        wait for period;
        report "LDAC3";
        assert ARLOAD = '1' report "ARLOAD";
        assert TRBUS = '1' report "TRBUS";
        assert DRHBUS = '1' report "DRHBUS";
        
        --LDAC 4
        wait for period;
        report "LDAC4";
        assert DRLOAD = '1' report "DRLOAD";
        assert MEMBUS = '1' report "MEMBUS";
        
        --LDAC 5
        wait for period;
        report "LDAC5";
        assert ACLOAD = '1' report "ACLOAD";
        assert DRLBUS = '1' report "DRLBUS";
        
        --FETCH1
        wait for period;
        report "FETCH1";
        assert PCBUS = '1' report "PCBUS incorrect in FETCH1: " & std_logic'image(PCBUS);
        assert ARLOAD = '1' report "ARLOAD incorrect in FETCH1: " & std_logic'image(ARLOAD);
        
        stop <= true;
        wait;
    end process;

end Behavioral;
