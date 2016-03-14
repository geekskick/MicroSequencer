-- Code your testbench here
library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;

entity tb is
end entity;

architecture b of tb is

    signal clk_i, z_i, error_i  : std_logic;
    signal IR_i                 : std_logic_vector(3 downto 0);
    signal current_a            : std_logic_vector(5 downto 0);

    -- test bench control signals
    signal stop     :  boolean := false;
    constant period : time:= 1ns;
    
    component top_model is
    port( 
        z, clk  : in std_logic;
        IR      : in std_logic_vector(3 downto 0);
        error   : out std_logic;
        curr_add: out std_logic_vector(5 downto 0)
    );
    end component;

begin

    rs_cpu:top_model port map(z_i, clk_i, IR_i, error_i, current_a);
    
    clock: process
    begin
        while not STOP loop
            clk_i <= '1';
            wait for period/2;
            clk_i <= '0';
            wait for period/2;
        end loop;
        wait;
        
    end process clock;
    
    stim: process
    begin
    
        IR_i <= "0000"; --nop
        z_i <= '1';
        
        wait for 8 * period;
        IR_i <= std_logic_vector(unsigned(IR_i) + 1);
        wait for 8 * period;
        IR_i <= std_logic_vector(unsigned(IR_i) + 1);
        wait for 8 * period;
        IR_i <= std_logic_vector(unsigned(IR_i) + 1);
        wait for 8 * period;
        IR_i <= std_logic_vector(unsigned(IR_i) + 1);
        wait for 8 * period;
        IR_i <= std_logic_vector(unsigned(IR_i) + 1);
        wait for 8 * period;
        IR_i <= std_logic_vector(unsigned(IR_i) + 1);
        wait for 8 * period;
        IR_i <= std_logic_vector(unsigned(IR_i) + 1);
        wait for 8 * period;
        IR_i <= std_logic_vector(unsigned(IR_i) + 1);
        wait for 8 * period;
        IR_i <= std_logic_vector(unsigned(IR_i) + 1);
        wait for 8 * period;
        IR_i <= std_logic_vector(unsigned(IR_i) + 1);
        wait for 8 * period;
        IR_i <= std_logic_vector(unsigned(IR_i) + 1);
        wait for 8 * period;
        IR_i <= std_logic_vector(unsigned(IR_i) + 1);
        wait for 8 * period;
        IR_i <= std_logic_vector(unsigned(IR_i) + 1);
        wait for 8 * period;
        IR_i <= std_logic_vector(unsigned(IR_i) + 1);
        wait for 8 * period;
        IR_i <= std_logic_vector(unsigned(IR_i) + 1);
        wait for 8 * period;
        IR_i <= std_logic_vector(unsigned(IR_i) + 1);
        wait for 8 * period;
        
        stop <= true;
        wait;

    end process stim;


end architecture;