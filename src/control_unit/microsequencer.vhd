library ieee;
library xil_defaultlib;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use xil_defaultlib.cpu_constants.all;
use xil_defaultlib.control_unit_constants.all;

entity microsequencer is
    port(
        clk              : in  std_logic;
        z                : in  std_logic;
        instruction      : in  std_logic_vector(IR_WIDTH-1 downto 0);
        current_addr_out : out std_logic_vector(MICROCODE_ADDR_WIDTH-1 downto 0);
        m1               : out std_logic_vector(MICROCODE_M1_LEN-1 downto 0);
        m2               : out std_logic_vector(MICROCODE_M2_LEN-1 downto 0);
        m3               : out std_logic;
        alu_cmd          : out std_logic_vector(ALU_CMD_WIDTH-1 downto 0)
    );
end entity microsequencer;

architecture behavioural of microsequencer is
    
    component rom is
        port( 
            addr : in  std_logic_vector(MICROCODE_ADDR_WIDTH-1 downto 0);
            data : out std_logic_vector(MICROCODE_WIDTH-1 downto 0)
        );
    end component;
    
    signal map_out    : std_logic_vector(MICROCODE_ADDR_WIDTH-1 downto 0) := (others => '0'); -- the IR value as an address
    signal plus_one   : std_logic_vector(MICROCODE_ADDR_WIDTH-1 downto 0) := (others => '0'); -- the next microinstruction
    signal return_add : std_logic_vector(MICROCODE_ADDR_WIDTH-1 downto 0) := (others => '0'); -- the return from subroutine address
    signal next_addr  : std_logic_vector(MICROCODE_ADDR_WIDTH-1 downto 0) := (others => '0'); -- THE ADDRESS FROM THE MICROCODE
    
    signal current_addr : std_logic_vector(MICROCODE_ADDR_WIDTH-1 downto 0) := (0 => '1', others => '0'); -- the selected address
    
    signal logic_out : std_logic_vector(1 downto 0)  := (others => '0'); -- the control lines to select which address to use
    signal mux_addr  : std_logic_vector(MICROCODE_ADDR_WIDTH-1 downto 0)  := (others => '0'); -- latched address
    signal mem_out   : std_logic_vector(MICROCODE_WIDTH-1 downto 0) := (others => '0'); -- the output of the memory
    
    signal cond : std_logic_vector(MICROCODE_COND_LEN-1 downto 0) := (others => '0'); -- the condition from the microcode
    signal bt   : std_logic_vector(MICROCODE_BT_LEN-1 downto 0) := (others => '0'); -- the branch type from the microcode
    
    signal ldsr : std_logic := '0'; -- load the subroutine register 
    
    
begin
    
    microcode : rom port map(
        addr => current_addr, 
        data => mem_out
    );
    
    current_addr_out <= current_addr;
    
    -- LATCH THE SUBROUTINE RETURN ADDRESS WHEN THE BRANCH TYPE IS A CALL
    ldsr <= '1' when bt = "01" else '0';
    
    -- TURN THE INSTRUCTION REGISTER INPUT INTO A 6 BIT MICROCODE ADDRESS
    map_out <= (instruction(4) & instruction(3) & instruction(2) &instruction(1) &instruction(0) & "0");
    
    with logic_out select mux_addr <= 
        plus_one        when "00",
        next_addr       when "10",
        map_out         when "11",
        return_add      when "01",
        (others => '1') when others;
    
    -- LATCH THE NEXT ADDRESS INTO THE SUBROUTINE RETURN REGISTER
    process(ldsr)
    begin
        if ldsr = '1' then
            return_add <= plus_one;
        end if;
    end process;
    
    -- CHOOSE THE NEXT ADDRESS BASED ON THE BRANCH TYPE, AND CONDITION
    process(bt, cond, z)
    begin
        
        -- logic_out <= "11"; -- default value for logic_out provided so that latches aren't created and muxes used instead
        
        case bt is
                -- JUMP
            when "00" => 
                if cond = "11" then
                    logic_out <= "10";
                elsif cond = "00" then
                    if z = '1' then
                        logic_out <= "10"; -- if z is set then use the microcode address
                    else
                        logic_out <= "00"; -- if z is clr then use the next microinstruction
                    end if;
                elsif cond = "01" then
                    if z = '0' then
                        logic_out <= "10"; -- if z is clr then use the microcode address
                    else
                        logic_out <= "00"; -- if z is set then use the next microinstruction
                    end if;
                else -- in the case of a don't care
                    logic_out <= "00"; -- doesn't matter shouldn't be executed!
                end if;
                -- CALL
            when "01" => logic_out <= "10"; -- use the microcode address
                -- MAP
            when "10" => logic_out <= "11"; -- use the IR value
                -- RETURN
            when "11" => logic_out <= "01"; -- use the return address
            when others => logic_out <= "00";
        end case;
    end process;
    
    -- WHEN THE CLOCK TICKS LATCH THE MUX OUTPUT TO THE CURRENT ADDRESS
    process(clk)
    begin
        if rising_edge(clk) then
            current_addr <= mux_addr;
        end if;
    end process;
    
    plus_one <= std_logic_vector(unsigned(current_addr) + 1);
    
    -- split up the memory output
    bt        <= mem_out(MICROCODE_BT_HIGH-1 downto MICROCODE_BT_LOW);
    cond      <= mem_out(MICROCODE_COND_HIGH-1 downto MICROCODE_COND_LOW);
    m1        <= mem_out(MICROCODE_M1_HIGH-1 downto MICROCODE_M1_LOW);
    m2        <= mem_out(MICROCODE_M2_HIGH-1 downto MICROCODE_M2_LOW);
    m3        <= mem_out(MICROCODE_M3_HIGH-1);
    alu_cmd   <= mem_out(MICROCODE_ALU_HIGH-1 downto MICROCODE_ALU_LOW);
    next_addr <= mem_out(MICROCODE_NEXT_HIGH-1 downto MICROCODE_NEXT_LOW);
    
    
end architecture behavioural;
