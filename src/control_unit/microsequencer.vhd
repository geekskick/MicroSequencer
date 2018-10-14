library ieee;
library xil_defaultlib;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use xil_defaultlib.cpu_constants.all;
use xil_defaultlib.control_unit_constants.all;
use xil_defaultlib.alu_commands.alu_commands_t;

entity microsequencer is
    port(
        clk              : in  std_logic;
        z                : in  std_logic;
        instruction      : in  std_logic_vector(IR_WIDTH-1 downto 0);
        current_addr_out : out std_logic_vector(MICROCODE_ADDR_WIDTH-1 downto 0);
        m1               : out std_logic_vector(MICROCODE_M1_LEN-1 downto 0);
        m2               : out std_logic_vector(MICROCODE_M2_LEN-1 downto 0);
        m3               : out std_logic;
        alu_cmd          : out alu_commands_t
   );
end entity microsequencer;

architecture behavioural of microsequencer is
    
    component rom is
        port( 
            addr : in  std_logic_vector(MICROCODE_ADDR_WIDTH-1 downto 0);
            data : out std_logic_vector(MICROCODE_WIDTH-1 downto 0)
        );
    end component;
 
    signal alu_cmd_i  : std_logic_vector(ALU_CMD_WIDTH-1 downto 0);    
    signal map_out    : std_logic_vector(MICROCODE_ADDR_WIDTH-1 downto 0) := (others => '0'); -- the IR value as an address
    signal plus_one   : std_logic_vector(MICROCODE_ADDR_WIDTH-1 downto 0) := (others => '0'); -- the next microinstruction
    signal return_add : std_logic_vector(MICROCODE_ADDR_WIDTH-1 downto 0) := (others => '0'); -- the return from subroutine address
    signal next_addr  : std_logic_vector(MICROCODE_ADDR_WIDTH-1 downto 0) := (others => '0'); -- THE ADDRESS FROM THE MICROCODE
    
    signal current_addr: std_logic_vector(MICROCODE_ADDR_WIDTH-1 downto 0) := (0 => '1', others => '0'); -- the selected address
    
    signal mux_addr  : std_logic_vector(MICROCODE_ADDR_WIDTH-1 downto 0)  := (others => '0'); -- latched address
    signal mem_out   : std_logic_vector(MICROCODE_WIDTH-1 downto 0) := (others => '0'); -- the output of the memory
    
    signal cond      : std_logic_vector(MICROCODE_COND_LEN-1 downto 0) := (others => '0'); -- the condition from the microcode
    signal bt        : std_logic_vector(MICROCODE_BT_LEN-1 downto 0) := (others => '0'); -- the branch type from the microcode
    
    signal ldsr      : std_logic := '0'; -- load the subroutine register 
    
    type next_addr_src_t is (incremental_value, microcode_value, ir_value, return_value, error_value);
    signal logic_out : next_addr_src_t;
    
    type branch_type_t is (jump_type, call_type, ir_type, return_type, error_type);
    signal branch_type: branch_type_t;

    type condition_t is (always_condition, z_condition, nz_condition, dont_care_condition, error_condition);
    signal condition : condition_t;

begin
    
    microcode : rom port map(
        addr => current_addr, 
        data => mem_out
    );
    
    current_addr_out <= current_addr;
    
    -- LATCH THE SUBROUTINE RETURN ADDRESS WHEN THE BRANCH TYPE IS A CALL
    ldsr <= '1' when branch_type = call_type else '0';
    
    -- TURN THE INSTRUCTION REGISTER INPUT INTO A 6 BIT MICROCODE ADDRESS
    map_out <= (instruction(4) & instruction(3) & instruction(2) &instruction(1) &instruction(0) & "0");
    
    -- MAKE THE NEXT ADDRESS CORRECT BASED ON THE BRANCH AND CONDITION LOGIC OUTPUT
    with logic_out select mux_addr <= 
        plus_one        when incremental_value,
        next_addr       when microcode_value,
        map_out         when ir_value,
        return_add      when return_value,
        (others => 'X') when error_value;
    
    -- DECODE THE MICROCODE BRANCHTYPE
    with bt select branch_type <=
        jump_type       when "00",
        call_type       when "01",
        ir_type         when "10", 
        return_type     when "11",
        error_type       when others;

    -- DECODE THE JUMP CONDITIONS
    with cond select condition <= 
        always_condition    when "11", 
        z_condition         when "00", 
        nz_condition        when "01", 
        dont_care_condition when others;

    with alu_cmd_i select alu_cmd <= 
        alu_add1    when "0001",      
        alu_sub1    when "0010",
        alu_inac1   when "0011",
        alu_clac1   when "0100",
        alu_and1    when "0101",
        alu_or1     when "0110",
        alu_not1    when "0111",
        alu_xor1    when "1000",
        alu_op2_thru when "1001",
        alu_lshift  when "1011",
        alu_rshift  when "1100",
        alu_dont_care when others;
         
    -- LATCH THE NEXT ADDRESS INTO THE SUBROUTINE RETURN REGISTER
    process(ldsr)
    begin
        if ldsr = '1' then
            return_add <= plus_one;
        end if;
    end process;
    
    -- CHOOSE THE NEXT ADDRESS BASED ON THE BRANCH TYPE, AND CONDITION
    process(branch_type, condition, z)
    begin
        case branch_type is

            when jump_type => 
                if condition = always_condition then
                    logic_out <= microcode_value;
                elsif condition = z_condition then
                    if z = '1' then
                        logic_out <= microcode_value; -- if z is set then use the microcode address
                    else
                        logic_out <= incremental_value; -- if z is clr then use the next microinstruction
                    end if;
                elsif condition = nz_condition then
                    if z = '0' then
                        logic_out <= microcode_value; -- if z is clr then use the microcode address
                    else
                        logic_out <= incremental_value; -- if z is set then use the next microinstruction
                    end if;
                else -- in the case of a don't care
                    logic_out <= incremental_value; -- doesn't matter shouldn't be executed!
                end if;
                
            when call_type => logic_out <= microcode_value; -- use the microcode address

            when ir_type => logic_out <= ir_value; -- use the IR value

            when return_type => logic_out <= return_value; -- use the return address
            when others => logic_out <= incremental_value;
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
    alu_cmd_i <= mem_out(MICROCODE_ALU_HIGH-1 downto MICROCODE_ALU_LOW);
    next_addr <= mem_out(MICROCODE_NEXT_HIGH-1 downto MICROCODE_NEXT_LOW);

end architecture behavioural;
