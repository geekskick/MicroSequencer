library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity 16_bit_data_reg_with_incr is
	port(
		input : in STD_LOGIC_VECTOR (15 downto 0);
		clk 	: in STD_LOGIC;
		pcld 	: in STD_LOGIC;
		pcinc : in STD_LOGIC;
		output: out STD_LOGIC_VECTOR (15 downto 0)
		);
end entity 16_bit_data_reg_with_incr;

architecture beh of 16_bit_data_reg_with_incr is
	signal current_pc: std_logic_vector(15 downto 0) := (others => '0');

begin
	output <= current_pc;
	
	process (clk, pcinc, pcld)
	begin
		if rising_edge(clk) then   
			if pcinc = '1' then			
				current_pc <= std_LOGIC_VECTOR(unsigned(current_pc) + 1);
			elsif pcld = '1' then   
				current_pc <= input;
			end if;
		end if;
	end process;
	
end architecture beh;
 