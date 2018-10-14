library ieee;
library xil_defaultlib;
use ieee.std_logic_1164.all; 
use ieee.numeric_std.all;
use xil_defaultlib.cpu_constants.all;
use xil_defaultlib.alu_commands.all;

entity ALU is
    port(
        operand1 : in  signed((DB_WIDTH/2)-1 downto 0); 
        operand2 : in  signed((DB_WIDTH/2)-1 downto 0); 
        cmd      : in  alu_commands_t;
        q        : out std_logic_vector((DB_WIDTH/2)-1 downto 0) -- Output of ALU
    );
end entity ALU;

architecture behave of ALU is
    signal q_i : signed((DB_WIDTH/2)-1 downto 0);
    
begin
    
    process(cmd, operand2, operand1) 
    begin
        q_i <= (others => '0'); 
        case cmd is
            when alu_add1 => q_i <= operand1 + operand2;
            when alu_sub1 => q_i <= operand1 - operand2;
            when alu_inac1 => q_i <= operand1 + 1;
            when alu_clac1 => q_i <= (others => '0');
            when alu_and1 => q_i <= operand1 and operand2;
            when alu_or1 => q_i <= operand1 or operand2;
            when alu_not1 => q_i <= not operand1; 
            when alu_xor1 => q_i <= operand1 xor operand2; 
            when alu_op2_thru => q_i <= operand2;
            when alu_lshift => q_i <= operand1 sll 1;
            when alu_rshift => q_i <= operand1 srl 1;
            when others => NULL;
        end case; 
    end process;
    
    q <= std_logic_vector(q_i);
    
end architecture behave;
