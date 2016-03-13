-- Code your testbench here
library IEEE;
use IEEE.std_logic_1164.all;

entity tb is
end entity;

architecture b of tb is

    signal clk, z, error: std_logic;
    signal IR           : std_logic_vector(3 downto 0);
    signal current_a    : std_logic_vector(5 downto 0);


    signal stop     :  boolean := false;
    constant period : time:= 1ns;
    
    component microsequencer is
    port(
        clk, z             : in std_logic;
        instruction        : in std_logic_vector(3 downto 0);
        ERROR              : out std_logic;
        current_addr_out   : out std_logic_vector(5 downto 0)
    );
    end component microsequencer;

begin

    rs_cpu: microsequencer port map(clk, z, IR, error, current_a);
    
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
    
        IR<= "0000"; --nop
        z <= '1';
        
        wait for 4 * period;
        
        IR <= "0001"; --ldac
        wait for 9 * period;
        
        IR <= "0010"; --sdac
        wait for 9 * period;
        
        IR <= "0100"; --jump if z
        wait for 9 * period;
        
        z <= '0';
        wait for 9 * period;

        stop <= true;
        wait;

    end process stim;


end architecture;
