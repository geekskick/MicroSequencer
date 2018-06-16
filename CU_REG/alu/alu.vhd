library ieee;
library xil_defaultlib;
use ieee.std_logic_1164.all; 
use ieee.numeric_std.all;
use xil_defaultlib.constants.all;
 
entity ALU is
    port(
        op1      : in signed((DB_WIDTH/2)-1 downto 0);           -- Input operands
        op2      : in signed((DB_WIDTH/2)-1 downto 0);           -- Input operands
        command  : in std_logic_vector(ALU_CMD_WIDTH-1 downto 0);         -- Operation to be performed
        q        : out std_logic_vector((DB_WIDTH/2)-1 downto 0) -- Output of ALU
    );
end entity ALU;
 
architecture behave of ALU is
    signal q_i : signed((DB_WIDTH/2)-1 downto 0);

begin

    process(command, op2, op1) 
    begin
        q_i <= (others => '0'); 
        case command is
            when "0000" => NULL;
            when "0001" => q_i <= op1 + op2;   -- ADD1
            when "0010" => q_i <= op1 - op2;   -- SUB1
            when "0011" => q_i <= op1 + 1;     -- INAC1
            when "0100" => q_i <= (others => '0');  -- CLAC1
            when "0101" => q_i <= op1 and op2; -- AND1
            when "0110" => q_i <= op1 or op2;  -- OR1
            when "0111" => q_i <= not op1;     -- NOT1
            when "1000" => q_i <= op1 xor op2; -- XOR1
            when "1001" => q_i <= op2;         -- LDAC5
            when "1010" => q_i <= op2;         -- MOVR1
            when "1011" => q_i <= op1 sll 1;   -- shift left 
            when "1100" => q_i <= op1 srl 1;   -- shift right
        when others => NULL;
    end case;  
    end process;
 
    q <= std_logic_vector(q_i);

end architecture behave;