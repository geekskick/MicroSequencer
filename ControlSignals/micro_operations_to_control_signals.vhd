library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- map the micro operations to the control signals for the registers and the controls for the alu


entity micro_operations_to_control_signals is
port(
    --micro operations
    nop1, 
    arin, 
    ardt, 
    arpc, 
    acin, 
    aczo, 
    acr, 
    acdr,
    minu, 
    plus, 
    aand, 
    oor, 
    xxor, 
    nnot, 
    trdr, 
    nop2, 
    pcin, 
    pcdt, 
    irdr, 
    rac, 
    mdr, 
    drac, 
    zalu, 
    nop3, 
    drm : in std_logic;

    -- control signals for the cpu
    ARLOAD,
    ARINC,
    READ,
    WRITE,
    BUSMEM,
    MEMBUS,
    PCINC
    PCLOAD,
    PCBUS,
    DRLBUS,
    DRHBUS,
    DRLOAD,
    TRLOAD,
    TRBUS,
    IRLOAD,
    RLOAD,
    RBUS,
    ACLOAD,
    ACBUS,
    ZLOAD : out std_logic;

    ALUSELECT: out std_logic_vector(3 downto 0)
);
end entity micro_operations_to_control_signals;

architecture behave of micro_operations_to_control_signals is
    
begin

    ZLOAD   <= ZALU;
    ACBUS   <= DRAC or RAC;
    ACLOAD  <= ACDR or ACR or PLUS or MINU or ACIN or ACZO or AAND or OOR or XXOR or NNOT; 

    RBUS    <= ACR or AAND or OOR or XXOR;
    RLOAD   <= RAC;

    IRLOAD  <= IRDR;
    TRBUS   <= PCDT or ARDT;
    TRLOAD  <= TRDR;

    DRLOAD  <= DRM or DRAC;
    DRHBUS  <= ARDT or PCDT;
    DRLBUS  <= ACDR or MDR;

    PCBUS   <= ARPC;
    PCLOAD  <= PCDT;

    PCINC   <= PCIN;

    MEMBUS  <= DRM;
    WRITE   <= MDR;
    BUSMEM  <= MDR;
    READ    <= DRM;

    ARINC   <= ARIN;
    ARLOAD  <= ARPC or ARDT;

    -- the vertical microcode prevents more than one of the following being selected at the same time
    aluselection: process(acin, aczo, acr, acdr, minu, plus, aand, oor, xxor, nnot)
    begin

        if acin = '1' then
            ALUSELECT <= "0001"; 
        elsif aczo = '1' then
            ALUSELECT <= "0010";
        elsif acr = '1' then
            ALUSELECT <= "0011";
        elsif acdr = '1' then
            ALUSELECT <= "0100";
        elsif minu = '1' then
            ALUSELECT <= "0101";
        elsif plus = '1' then
            ALUSELECT <= "0110";
        elsif aand = '1' then
            ALUSELECT <= "0111";
        elsif oor = '1' then
            ALUSELECT <= "1000";
        elsif xxor = '1' then
            ALUSELECT <= "1001";
        elsif nnot = '1' then
            ALUSELECT <= "1010";
        end if;

    end process aluselection;
    
end architecture behave;
