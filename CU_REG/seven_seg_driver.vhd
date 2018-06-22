library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity seg is
	port(
		Inumber : in  std_logic_vector(3 downto 0);
		ODisp   : out std_logic_vector(6 downto 0)
	);
end entity seg;

architecture behave of seg is
	
	type mem_a is array(0 to 15) of std_logic_vector(6 downto 0);
	
	constant mem : mem_a := (
		"1111110", --0
		"0110000", --1
		"1101101", --2
		"1111001", --3
		"0110011", --4
		"1011011", --5
		"1011111", --6 
		"1110000", --7 
		"1111111", --8
		"1111011", --9
		"1110111", --A
		"0011111", --B
		"1001110", --C
		"0111101", --d
		"1001111", --E
		"1000111" --F
	);
	
	signal n : integer range 0 to 15;
	
begin
	
	n <= to_integer(unsigned(Inumber));
	
	ODisp <= not(mem(n));
	
end architecture behave;