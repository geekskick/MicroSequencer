library IEEE;
library xil_defaultlib;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;
use xil_defaultlib.constants.all;

entity top_model_cu is
    port( 
        z       : in std_logic;
        clk     : in std_logic;
        ir      : in std_logic_vector(4 downto 0);    -- instruction register low nibble + 1
        error   : out std_logic;
        arload  : out std_logic;
        arinc   : out std_logic;
        rd      : out std_logic;
        wr      : out std_logic; 
        membus  : out std_logic;
        busmem  : out std_logic;
        pcinc   : out std_logic;
        pcload  : out std_logic;
        pcbus   : out std_logic;
        drlbus  : out std_logic;
        drhbus  : out std_logic;
        drload  : out std_logic;
        trload  : out std_logic; 
        trbus   : out std_logic;
        irload  : out std_logic;
        rload   : out std_logic; 
        rbus    : out std_logic;
        acload  : out std_logic;
        acbus   : out std_logic;
        zload   : out std_logic;
        alu_cmd : out std_logic_vector(ALU_CMD_WIDTH-1 downto 0)     -- to the alu input
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
    SIGNAL ALUSELECT    : std_logic_vector(ALU_CMD_WIDTH-1 downto 0);
     
    -- CURRENT ADDRESS OF THE MICROCODE
    signal curr_add     : std_logic_vector(5 downto 0);
     

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
        aluselect          : out std_logic_vector(ALU_CMD_WIDTH-1 downto 0)
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
     
begin    
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
     arload <= arpc or ardt;
     arinc  <= arin;
     rd     <= drm;
     wr     <= mdr;
     membus <= drm;
     busmem <= mdr;
     pcinc  <= pcin;
     pcload <= pcdt;
     pcbus  <= arpc;
     drlbus <= acdr or mdr;
     drhbus <= pcdt or ardt;
     drload <= drm or drac;
     trload <= trdr;
     trbus  <= ardt or pcdt;
     irload <= irdr;
     rload  <= rac;
     rbus   <= '1' when(aluselect = "0001" or aluselect = "0010" or aluselect = "0101" or aluselect = "0110" or aluselect = "1000" or acr = '1') else '0';
     acload <= '1' when (to_integer(unsigned(aluselect)) > 0) else '0';
     acbus  <= drac or rac;
     zload  <= zalu;
     alu_cmd <= aluselect;
     
     m3_vector <= "00" & m3;

end architecture;