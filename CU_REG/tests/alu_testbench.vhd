library IEEE;
library xil_defaultlib;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use xil_defaultlib.constants.all;

entity alu_testbench is
end alu_testbench;

architecture Behavioral of alu_testbench is

    component alu is
    port(
        op1      : in signed((DB_WIDTH/2)-1 downto 0);           -- Input operands
        op2      : in signed((DB_WIDTH/2)-1 downto 0);           -- Input operands
        command  : in std_logic_vector(ALU_CMD_WIDTH-1 downto 0);         -- Operation to be performed
        q        : out std_logic_vector((DB_WIDTH/2)-1 downto 0) -- Output of ALU
    );
    end component;

    constant period : time := 200ns;
    signal clk      : std_logic;
    signal stop     : boolean := false;
   
    signal op1  : std_logic_vector((DB_WIDTH/2)-1 downto 0);
    signal op2  : std_logic_vector((DB_WIDTH/2)-1 downto 0);
    signal q    : std_logic_vector((DB_WIDTH/2)-1 downto 0);
    signal cmd  : std_logic_vector(ALU_CMD_WIDTH-1 downto 0);
    
    
begin
uut: 
    alu port map(
        op1 => signed(op1),
        op2 => signed(op2),
        command => cmd,
        q => q
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
        op1 <= (0 => '1', others => '0');
        op2 <= (0 => '1', others => '0');
        cmd <= "0001";
        wait for 1ns;
        assert to_integer(unsigned(q)) = 2 report "Add didnt work: " & to_hstring(q);
        
        cmd <= "0010";
        wait for 1ns;
        assert to_integer(unsigned(q)) = 0 report "Sub didnt work: " & to_hstring(q);
        
        cmd <= "0011";
        wait for 1ns;
        assert to_integer(unsigned(q)) = 2 report "inac didnt work: " & to_hstring(q);
        
        cmd <= "0100";
        wait for 1ns;
        assert to_integer(unsigned(q)) = 0 report "clac didnt work: " & to_hstring(q);
        
        cmd <= "0101";
        wait for 1ns;
        assert to_integer(unsigned(q)) = 1 report "And didnt work: " & to_hstring(q);
        
        op2 <= (1 => '1', others => '0');
        wait for 1ns;
        assert to_integer(unsigned(q)) = 0 report "And didnt work: " & to_hstring(q);
        
        cmd <= "0110";
        wait for 1ns;
        assert to_integer(unsigned(q)) = 3 report "or didnt work: " & to_hstring(q);
        
        cmd <= "0111";
        wait for 1ns;
        assert q = X"fe" report "not didnt work: " & to_hstring(q);
        
        cmd <= "1000";
        op1 <= (0 => '1', 1 => '1', others => '0');
        op2 <= (0 => '1', others => '0');
        wait for 1ns;
        assert q = X"02" report "xor didnt work: " & to_hstring(q);
        
        cmd <= "1001";
        wait for 1ns;
        assert q = op2 report "ldac didnt work: " & to_hstring(q);

        cmd <= "1010";
        wait for 1ns;
        assert q = op2 report "movr didnt work: " & to_hstring(q);
        
        cmd <= "1011";
        wait for 1ns;
        assert q = X"06" report "sll didnt work: " & to_hstring(q);
        
        cmd <= "1100";
        wait for 1ns;
        assert q = X"01" report "srl didnt work: " & to_hstring(q);
        
        stop <= true;
        report "------------DONE-------------";
        wait;
    end process;

end Behavioral;
