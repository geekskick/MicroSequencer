library ieee;
library xil_defaultlib;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use xil_defaultlib.cpu_constants.all;
use xil_defaultlib.alu_commands.all;

entity alu_testbench is
end alu_testbench;

architecture behavioural of alu_testbench is
    
    component alu is
        port(
            operand1: in  signed((DB_WIDTH/2)-1 downto 0); -- Input operands
            operand2: in  signed((DB_WIDTH/2)-1 downto 0); -- Input operands
            cmd     : in  alu_commands_t; -- Operation to be performed
            q       : out std_logic_vector((DB_WIDTH/2)-1 downto 0)-- Output of ALU
        );
    end component;
    
    constant period : time := 200ns;
    signal clk      : std_logic;
    signal stop     : boolean := false;
    
    signal operand1 : std_logic_vector((DB_WIDTH/2)-1 downto 0);
    signal operand2 : std_logic_vector((DB_WIDTH/2)-1 downto 0);
    signal q  	    : std_logic_vector((DB_WIDTH/2)-1 downto 0);
    signal cmd      : alu_commands_t;
    
    
begin
    uut : alu port map(
        operand1 => signed(operand1),
        operand2 => signed(operand2),
        cmd      => cmd,
        q        => q
    );
   
    ------------------------------
    -- Stimulating the UUT itself
    ------------------------------
    stim : process
    begin
        operand1 <= (0 => '1', others => '0');
        operand2 <= (0 => '1', others => '0');
        cmd <= alu_add1;
        wait for 1ns;
        assert to_integer(unsigned(q)) = 2 report "Add didnt work : " & to_hstring(q);
        
        cmd <= alu_sub1;
        wait for 1ns;
        assert to_integer(unsigned(q)) = 0 report "Sub didnt work : " & to_hstring(q);
        
        cmd <= alu_inac1;
        wait for 1ns;
        assert to_integer(unsigned(q)) = 2 report "inac didnt work : " & to_hstring(q);
        
        cmd <= alu_clac1;
        wait for 1ns;
        assert to_integer(unsigned(q)) = 0 report "clac didnt work : " & to_hstring(q);
        
        cmd <= alu_and1;
        wait for 1ns;
        assert to_integer(unsigned(q)) = 1 report "And didnt work : " & to_hstring(q);
        
        operand2 <= (1 => '1', others => '0');
        wait for 1ns;
        assert to_integer(unsigned(q)) = 0 report "And didnt work : " & to_hstring(q);
        
        cmd <= alu_or1;
        wait for 1ns;
        assert to_integer(unsigned(q)) = 3 report "or didnt work : " & to_hstring(q);
        
        cmd <= alu_not1;
        wait for 1ns;
        assert q = X"fe" report "not didnt work : " & to_hstring(q);
        
        cmd <= alu_xor1;
        operand1 <= (0 => '1', 1 => '1', others => '0');
        operand2 <= (0 => '1', others => '0');
        wait for 1ns;
        assert q = X"02" report "xor didnt work : " & to_hstring(q);
        
        cmd <= alu_op2_thru;
        wait for 1ns;
        assert q = operand2 report "op2 through didnt work : " & to_hstring(q);
        
        cmd <= alu_lshift;
        wait for 1ns;
        assert q = X"06" report "sll didnt work : " & to_hstring(q);
        
        cmd <= alu_rshift;
        wait for 1ns;
        assert q = X"01" report "srl didnt work : " & to_hstring(q);
        
        stop <= true;
        report "------------DONE-------------";
        wait;
    end process;
    
end behavioural;
