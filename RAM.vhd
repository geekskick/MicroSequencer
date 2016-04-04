-- Quartus II VHDL Template
-- Single-port RAM with single read/write address and initial contents	

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ram is
	port 
	(
		addr		: in std_logic_vector((16-1) downto 0);
		datain	: in std_logic_vector((8-1) downto 0);
		wr			: in std_logic := '0';
		dataout	: out std_logic_vector((8-1) downto 0)
	);

end ram;

architecture rtl of ram is

	--64 bytes of program code and 64 of ram
	
	type mem is array (0 to 63) of std_logic_vector(7 downto 0); 
	signal ram: mem:= (0 => (others => '1'), others => (others => '0')); -- first byte all 1s
	
	signal addreg: integer range 0 to 128;
	
	constant rom : mem := ( -- program code
		0 => "00000001", -- ldac
		1 => "01000000", --lsb dec 64 = first byte of ram
		2 => "00000000", -- msb
		3 => "00000010", -- stac
		4 => "01000001", -- into the second byte of ram
		5 => "00000000", -- msb
		6 => "00000110",
		7 => "00000111",
		8 => "00001000",
		9 => "00001001",
		10 => "00001010",
		11 => "00001011",
		12 => "00001100",
		13 => "00001101",
		14 => "00001110",
		15 => "00001111",
		16 => "00010000",
		17 => "00010001",
		18 => "00010010",
		19 => "00010011",
		20 => "00010100",
		21 => "00010101",
		22 => "00010110",
		23 => "00010111",
		24 => "00011000",
		25 => "00011001",
		26 => "00011010",
		27 => "00011011",
		28 => "00011100",
		29 => "00011101",
		30 => "00011110",
		31 => "00011111",
		32 => "00100000",
		33 => "00100001",
		34 => "00100010",
		35 => "00100011",
		36 => "00100100",
		37 => "00100101",
		38 => "00100110",
		39 => "00100111",
		40 => "00101000",
		41 => "00101001",
		42 => "00101010",
		43 => "00101011",
		44 => "00101100",
		45 => "00101101",
		46 => "00101110",
		47 => "00101111",
		48 => "00110000",
		49 => "00110001",
		50 => "00110010",
		51 => "00110011",
		52 => "00110100",
		53 => "00110101",
		54 => "00110110",
		55 => "00110111",
		56 => "00111000",
		57 => "00111001",
		58 => "00111010",
		59 => "00111011",
		60 => "00111100",
		61 => "00111101",
		62 => "00111110",
		63 => "00111111"
	);  

begin

	-- Register the address for reading or writing
	addreg <= to_integer(unsigned(addr(7 downto 0)));
	
	-- when the address is less than 64 it's the rom, else it's the ram 
	dataout <= rom(addreg) when (wr = '0' and addreg < 64) else 
			     ram(addreg-64) when (wr = '0' and addreg >= 64) else		
				  (others => '1'); -- shouldn't happen
				
	-- put the data to the ram
		process(addreg, wr, datain)
		begin
	if (wr = '1' and addreg >= 64) then
			ram(addreg-64) <= datain;
	end if;
	end process;

	
end rtl;
