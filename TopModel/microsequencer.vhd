-- Code your testbench here
library IEEE;
use IEEE.std_logic_1164.all;

entity top_model is
    port( 
        z, clk  : in std_logic;
        IR      : in std_logic_vector(3 downto 0);
        error   : out std_logic;
        curr_add: out std_logic_vector(5 downto 0)
    );
end entity;

architecture b of top_model is

    signal m3           : std_logic;
    signal m1           : std_logic_vector(3 downto 0);
    signal m2           : std_logic_vector(2 downto 0);

    signal nop1, arin, ardt, arpc, acin, aczo, acr, acdr, minu, plus, aand, oor, xxor, nnot, trdr: std_logic; --m1 signals
    
    signal nop2, pcin, pddt, irdr, rac, mdr, drac, zalu: std_logic; -- m2 signal
    
    signal nop3, drm : std_logic; --m3 signal
    
    component microsequencer is
    port(
        clk, z             : in std_logic;
        instruction        : in std_logic_vector(3 downto 0);
        current_addr_out   : out std_logic_vector(5 downto 0);
        m1                 : out std_logic_vector(3 downto 0);
        m2                 : out std_logic_vector(2 downto 0);
        m3                 : out std_logic
    );
    end component microsequencer;
    
    component four_bit_decoder is
    port(
        input   : in std_logic_vector(3 downto 0);
        O0, O1, O2, O3, O4, O5, O6, O7, O8, O9, O10, O11, O12, O13, O14, O15 : out std_logic
    );
    end component four_bit_decoder;

    component three_bit_decoder is
    port(
        input   : in std_logic_vector(2 downto 0);
        O0, O1, O2, O3, O4, O5, O6, O7 : out std_logic
    );
    end component three_bit_decoder;
    
    component one_bit_decoder is
    port(input: in std_logic;
         O0, O1: out std_logic
         );
    end component one_bit_decoder;
    
begin

    m1_ops   : four_bit_decoder port map(m1, nop1, arin, ardt, arpc, acin, aczo, acr, acdr, minu, plus, aand, oor, xxor, nnot, trdr, error);
    
    m2_ops   : three_bit_decoder port map(m2, nop2, pcin, pddt, irdr, rac, mdr, drac, zalu);
    
    m3_ops   : one_bit_decoder port map(m3, nop3, drm);
    
    mseq    : microsequencer port map(clk, z, IR, curr_add, m1, m2, m3);
    
    
end architecture;