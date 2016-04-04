-- Code your testbench here
library IEEE;
use IEEE.std_logic_1164.all;

entity tb is
end entity;

architecture b of tb is

    signal clk,z, m3: std_logic;
    signal IR : std_logic_vector(4 downto 0);
    signal m1, m2 : std_logic_vector (2 downto 0);
    signal c_add	: std_logic_vector(5 downto 0);
    signal alus: std_logic_vector(3 downto 0);
    signal stop :  boolean := false;
    constant period : time:= 1ns;
    
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

begin

    rs_cpu: microsequencer port map(clk, z, IR, c_add, m1, m2, m3, alus);
    
    clock: process
    begin
        while not STOP loop
            clk <= '1';
            wait for period/2;
            clk <= '0';
            wait for period/2;
        end loop;
        wait;
        
    end process clock;
    
    stim: process
    begin
    
        IR<= "00000"; -- nop
        z <= '1';
        
        wait for 4 * period;
        
        IR <= "00001"; -- ldac
        wait for 9 * period;
        
        IR <= "00010"; -- stac
        wait for 9 * period;

        stop <= true;
        wait;

    end process stim;


end architecture;