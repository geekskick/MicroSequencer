-- ALU from BEN

library ieee;
use ieee.std_logic_1164.all; --libary for the standard signals
use ieee.numeric_std.all;  --libary for the arithmetic signals
 
entity ALU is
 port( -- Signed means these can be -ve or +ve, unsigned can only be +ve.
   --Enable  : in std_logic;     --clock signal
   AC, SigBus : in signed(7 downto 0); --input operands
   Logic   : in unsigned(3 downto 0); --Operation to be performed
   p_ALUOutput : out std_logic_vector(7 downto 0) --output of ALU

 );
end entity ALU;
 
architecture Behavior of ALU is
	signal ALUOutput: signed(7 downto 0);
 begin
 process(Logic, AC, SigBus) -- pm changed
  begin
	ALUOutput <= (others => '0'); -- pm added to prevent latch
   case Logic is
    when "0000" => NULL;
	 when "0001" => ALUOutput <= AC + SigBus; --ADD1
    when "0010" => ALUOutput <= AC - SigBus;  --SUB1
    when "0011" => ALUOutput <= AC + 1;   --INAC1
    when "0100" => ALUOutput <= "00000000"; --CLAC1
    when "0101" => ALUOutput <= AC and SigBus;--AND1
    when "0110" => ALUOutput <= AC or SigBus; --OR1
    when "0111" => ALUOutput <=   not AC;  --NOT1
    when "1000" => ALUOutput <= AC xor SigBus;--XOR1
    when "1001" => ALUOutput <= SigBus;   --LDAC5
    when "1010" => ALUOutput <= SigBus;   --MOVR1
	 when "1011" => ALUOutput <= AC sll 1;   --shift left 
	 when "1100" => ALUOutput <= AC srl 1;   --shift right
    when others => NULL;
   end case;	
 end process;
 
 p_alUOutput <= std_logic_vector(ALUOutput);
end architecture Behavior;