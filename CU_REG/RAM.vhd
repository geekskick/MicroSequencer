library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity small_memory is
  port( 
    adr : in  std_logic_vector(6 downto 0); -- address to use
    o0  : out std_logic_vector(7 downto 0); -- output data
    i0  : in std_logic_vector(7 downto 0);  --input data
    r, w: in std_logic := '0'               -- read or write
  );

end small_memory;

architecture rtl of small_memory is

    -- 64 bytes of program code and 64 of ram
    subtype my_word is std_logic_vector(7 downto 0); 
    type mem is array (0 to 63) of my_word; 
    
    signal ram: mem;
    
    signal addreg: integer range 0 to 128;
    
    constant rom : mem := ( -- program code
                            "00001011", -- bit 6 set means its ram, dont care about second byte as it's not used
                            "00000010","01000001","00000000",
                            "00000010","01000010","00000000",
                            "00000001","01000010","00000001",
                            "00001010",
                            "00000010","01000010","00000001",
                            "00000011",
                            "00000001","01000001","00000001",
                            "00001000",
                            "00000010","01000001","00000001",
                            "00000001","00011110","00000000",
                            "00001001",
                            "00000111","00000111","00000000",
                            "00000000",
                            "00000101",
                            "00000000","00000000",
                            "00000000","00000000","00000000","00000000",
                            "00000000","00000000","00000000","00000000",
                            "00000000","00000000","00000000","00000000",
                            "00000000","00000000","00000000","00000000",
                            "00000000","00000000","00000000","00000000",
                            "00000000","00000000","00000000","00000000",
                            "00000000","00000000","00000000","00000000",
                            "00000000","00000000","00000000"
                        );


begin

    -- Register the address for reading or writing
    addreg <= to_integer(unsigned(adr));
    
    -- when the address is less than 64 it's the rom, else it's the ram 
    o0 <=   rom(addreg)     when (r = '1' and addreg < 64)  else 
            ram(addreg-64)  when (r = '1' and addreg >= 64) else        
            (others => 'Z'); -- shouldn't happen
                
    -- put the data to the ram
    process(addreg, w, r, i0)
    begin
        if (w = '1' and addreg >= 64) then
            ram(addreg - 64) <= i0;
        end if;
    end process;

end rtl;


-- source code mapping for simple program
-- ROM base address 0x00
-- RAM base address 0x
--
-- n = 5; 
-- total = 0; use ram address 0x01
-- i = 0;     use ram address 0x02
-- for i = 0; i<n; i++;
-- total += i;
-- 
-- 0x0000 CLAC                 00001011
-- 0x0001 STAC total           00000010 01000001 00000001
-- 0x0004 STAC i               00000010 01000010 00000001
-- 0x0007 LDAC i               00000001 01000010 00000001 ;loop
-- 0x000A INAC                 00001010
-- 0x000B STAC i               00000010 01000010 00000001
-- 0x000E MVAC                 00000011 
-- 0x000F LDAC total           00000001 01000001 00000001
-- 0x0012 ADD                  00001000 *
-- 0x0013 STAC total           00000010 01000001 00000001
-- 0x0016 LDAC n               00000001 00011110 00000000
-- 0x0019 SUB                  00001001 
-- 0x001A JPNZ loop            00000111 00000111 00000000
-- 0x001D NOP                  00000000
-- 0x001E n                    00000101 ; hardwired constant