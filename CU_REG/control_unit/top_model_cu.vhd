library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;

entity top_model_cu is
    port( 
        -- INPUTS
        z        : in std_logic;
        clk       : in std_logic;
        IR        : in std_logic_vector(4 downto 0);    -- INSTRUCTION REGISTER LOW NIBBLE + 1
       
        -- COMMAND SIGNALS
        error, ARLOAD, ARINC, R, W, MEMBUS, BUSMEM, PCINC, PCLOAD, PCBUS, DRLBUS, DRHBUS, DRLOAD, TRLOAD, TRBUS, IRLOAD, RLOAD, RBUS, ACLOAD, ACBUS, ZLOAD    : out std_logic;

        alu_cmd : out std_logic_vector(3 downto 0);     -- TO THE ALU INPUT
       
        --segment displayers
        curr_add_H: out std_logic_vector(6 downto 0);   -- HIGH NIBBLE OF CURRENT MICROCODE ADDRESS
        curr_add_L: out std_logic_vector(6 downto 0);   -- LOW NIBBLE OF CURRENT MICROCODE ADDRESS
        curr_alu_S: out std_logic_vector(6 downto 0)    -- ALUSELECT DISPLAY
    );
end entity;

architecture structure of top_model_cu is

    -- MICRO OPERATIONS FIELDS
    -- As the decoder is now always 3 bit, the m3 signal needs to be converted to 
    -- a vector.
    signal m3_vector    : std_logic_vector(2 downto 0);
    signal m3           : std_logic;
    signal m1           : std_logic_vector(2 downto 0);
    signal m2           : std_logic_vector(2 downto 0);

    -- COMMAND TO SEND TO THE ALU
    SIGNAL ALUSELECT    : std_logic_vector(3 downto 0);
     
    -- CURRENT ADDRESS OF THE MICROCODE
    signal curr_add     : std_logic_vector(5 downto 0);
     
    -- HIGH NIBBLE OF THE MICROCODE ADDRESS
    signal haddr        : std_logic_vector(3 downto 0);

    -- MICROOPERATIONS
    signal nop1, nop2, nop3, arin, ardt, arpc, acin, aczo, acr, acdr, minu, plus, aand, oor, xxor, nnot, trdr, pcin, pcdt, irdr, rac, mdr, drac, zalu, drm, lshift, rshift  : std_logic := '0';
    
     
    -- COMPONENT DECLARATIONS FOLLOW
    component microsequencer is
    port(
        clk, z             : in std_logic;
        instruction        : in std_logic_vector(4 downto 0);
        current_addr_out   : out std_logic_vector(5 downto 0);
        m1                 : out std_logic_vector(2 downto 0);
        m2                 : out std_logic_vector(2 downto 0);
        m3                 : out std_logic;
        aluselect          : out std_logic_vector(3 downto 0)
    );
    end component microsequencer;
   
    component three_bit_decoder is
    port(
        a   : in std_logic_vector(2 downto 0);
        d0  : out std_logic;
        d1  : out std_logic; 
        d2  : out std_logic; 
        d3  : out std_logic; 
        d4  : out std_logic; 
        d5  : out std_logic; 
        d6  : out std_logic; 
        d7  : out std_logic
    );
    end component three_bit_decoder;
     
     -- 7 SEGMENT DISPLAY LOGIC
    component seg is
    port(
        Inumber : in std_logic_vector(3 downto 0);
        ODisp   : out std_logic_vector(6 downto 0)
    );
    end component seg;
    
    
begin

    -- DEBUGGING COMMANDS
    haddr <= "00" & curr_add(5 downto 4) ;          -- THE HIGH NIBBLE OF THE CURRENT ADDRESS NEEDS TO BE MAPPED TO GO FROM 2 BITS TO 4

-- THE HIGH NIBBLE DISPLAY
HDigit: 
    seg port map(
        INumber => haddr, 
        ODisp => curr_add_H
     );
     
-- THE LOW NIBBLE DISPLAY
LDigit: 
    seg port map( 
        INumber => curr_add(3 downto 0), 
        ODisp   => curr_add_L
    );  

-- THE ALU SELECT VALUE DISPLAY     
ALUSEL: 
    seg port map( 
        INumber => ALUSELECT,  
        ODisp   => curr_alu_S
    );            

--     M1           M2        M3         ALU 
-- NOP   000    NOP   000   NOP 0   NOP     0000
-- ARIN  001    PCIN  001   DRM 1   PLUS    0001                    
-- ARDT  010    PCDT  010
-- ARPC  011    IRDR  011           MINU    0010
-- TRDR  100    RAC   100
-- ERROR 101    MDR   101           ACIN    0011
-- ACR   110    DRAC  110           ACZO    0100
-- ACDR  111    ZALU  111           AND     0101
--                                  OR      0110
--                                  NOT     0111
--                                  XOR     1000
--                                  THRU    1001
--                                  THRU    1010
--                                  LSHIFT  1011
--                                  RSHIFT  1100  

    -- DECODER INSTANTIATION, WHERE EACH MICROCODE FIELD (M1, M2, M3) GETS IT'S OWN DECODER
m1_ops: 
    three_bit_decoder port map(
        a   => m1, 
        d0  => nop1, 
        d1  => arin, 
        d2  => ardt, 
        d3  => arpc, 
        d4  => trdr, 
        d5  => error, 
        d6  => acr, 
        d7  => acdr
    );

m2_ops: 
    three_bit_decoder port map(
        a   => m2, 
        d0  => nop2, 
        d1  => pcin, 
        d2  => pcdt, 
        d3  => irdr, 
        d4  => rac, 
        d5  => mdr, 
        d6  => drac, 
        d7  => zalu
    );

m3_ops: 
    three_bit_decoder port map(
        a   => m3_vector, 
        d0  => nop3, 
        d1  => drm, 
        d2  => open, 
        d3  => open, 
        d4  => open, 
        d5  => open, 
        d6  => open,
        d7  => open
    );
    
     -- INSTANTIATE THE MICROSEQUENCER
mseq: 
    microsequencer port map(
        clk                 => clk, 
        z                   => z, 
        instruction         => IR, 
        current_addr_out    => curr_add, 
        m1                  => m1, 
        m2                  => m2, 
        m3                  => m3, 
        aluselect           => ALUSELECT
     );
    
     -- COMMAND SIGNALS AND WHEN THEY ARE ACTIVE
     ARLOAD <= arpc     or ardt;
     ARINC  <= arin;
     R      <= drm;
     W      <= mdr;
     MEMBUS <= drm;
     BUSMEM <= mdr;
     PCINC  <= pcin;
     PCLOAD <= pcdt;
     PCBUS  <= arpc;
     DRLBUS <= acdr     or mdr;
     DRHBUS <= pcdt     or ardt;
     DRLOAD <= drm      or drac;
     TRLOAD <= trdr;
     TRBUS  <= ardt     or pcdt;
     IRLOAD <= irdr;
     RLOAD  <= rac;
     RBUS   <= '1' when(ALUSELECT = "0001" or ALUSELECT = "0010" or ALUSELECT = "0101" or ALUSELECT = "0110" or ALUSELECT = "1000" or acr = '1') else '0';
     ACLOAD <= '1' when (to_integer(unsigned(ALUSELECT)) > 0) else '0';
     ACBUS  <= drac     or rac;
     ZLOAD  <= zalu;

     alu_cmd <= ALUSELECT;
     
     m3_vector <= "00" & m3;

end architecture;