-- Code your testbench here
library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;

entity rom is
port( addr: in std_logic_vector(5 downto 0);
	output: out std_logic_vector(9 downto 0)
);
end entity;

architecture struct of rom is

    -- conditions 
    -- 1  11
    -- Z  00  
    -- nZ 01
    -- xx 10

    -- branch types
    -- JUMP 00
    -- MAP  10  
    -- CALL 01
    -- RET  11
    
type mem is array (0 to 21) of std_logic_vector(9 downto 0); 
constant microcode : mem := ( 
--condition, bt, next address
0   =>"11" & "00" & "000001",	-- NOP		JUMP if 1 to FETCH1 at 0x01
1   =>"11" & "00" & "000010",	-- FETCH1	JUMP if 1 to FETCH2 at 0x02
2   =>"11" & "00" & "000011",	-- FETCH2	JUMP if 1 to FETCH3 at 0x03
3   =>"10" & "10" & "000001",	-- FETCH3	GOTO MAP address
4   =>"11" & "01" & "001101", -- LDAC0	CALL to LDST1       at 0x0D (13)
5   =>"11" & "00" & "000110", -- LDAC4	JUMP if 1 to LDAC5  at 0x06
6   =>"11" & "00" & "000001", -- LDAC5	JUMP if 1 to FETCH1 at 0x01
7   =>"00" & "00" & "000000", -- EMPTY INSTRUCTION
8   =>"11" & "01" & "001101", -- STAC0	CALL to LDST1       at 0x0D (13)
9   =>"11" & "00" & "001010", -- STAC4	JUMP if 1 to STAC5  at 0x0A (10)
10  =>"11" & "00" & "000001", -- STAC5	JUMP if 1 to FETCH1 at 0x01
11  =>"00" & "00" & "000000", -- EMPTY INSTRUCTION
12  =>"11" & "00" & "000001", -- MVAC1	JUMP if 1 to FETCH1 at 0x01
13  =>"11" & "00" & "001110", -- LDST1	JUMP if 1 to LDST2  at 0x0D (14)
14  =>"11" & "00" & "001111", -- LDST2	JUMP if 1 to LDST3  at 0x0E (15)
15  =>"10" & "11" & "000001", -- LDST3	RETURN to SUBROUTINE RETURN address
16  =>"00" & "00" & "010011", -- JMPZ		JUMP if z to JUMP1  at 0x13 (19)
17  =>"11" & "00" & "010010", -- JMPZN1	JUMP if 1 to JMPZN2 at 0x12 (18)
18  =>"11" & "00" & "000001", -- JMPZN2	JUMP if 1 to FETCH1 at 0x01
19  =>"11" & "00" & "010100", -- JUMP1	JUMP if 1 to JUMP2  at 0x14 (20)
20  =>"11" & "00" & "010101", -- JUMP2	JUMP if 1 to JUMP3  at 0x15 (21)
21  =>"11" & "00" & "000001" -- JMPZN2	JUMP if 1 to FETCH1 at 0x01
); 


begin

output <= microcode(to_integer(unsigned(addr)));


end architecture;
