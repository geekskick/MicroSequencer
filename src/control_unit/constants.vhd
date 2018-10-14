package control_unit_constants is
        constant MICROCODE_WIDTH    : integer := 21;

        constant MICROCODE_BT_HIGH  : integer := 21;
        constant MICROCODE_BT_LEN   : integer := 2;
        constant MICROCODE_BT_LOW   : integer := MICROCODE_BT_HIGH - MICROCODE_BT_LEN; 
        constant MICROCODE_COND_HIGH: integer := MICROCODE_BT_LOW;
        constant MICROCODE_COND_LEN : integer := 2;
        constant MICROCODE_COND_LOW : integer := MICROCODE_COND_HIGH - MICROCODE_COND_LEN;
        constant MICROCODE_M1_HIGH  : integer := MICROCODE_COND_LOW;
        constant MICROCODE_M1_LEN   : integer := 3;
        constant MICROCODE_M1_LOW   : integer := MICROCODE_M1_HIGH - MICROCODE_M1_LEN;
        constant MICROCODE_M2_HIGH  : integer := MICROCODE_M1_LOW;
        constant MICROCODE_M2_LEN   : integer := 3;
        constant MICROCODE_M2_LOW   : integer := MICROCODE_M2_HIGH - MICROCODE_M2_LEN;
        constant MICROCODE_M3_HIGH  : integer := MICROCODE_M2_LOW;
        constant MICROCODE_M3_LEN   : integer := 1;
        constant MICROCODE_M3_LOW   : integer := MICROCODE_M3_HIGH - MICROCODE_M3_LEN;
        constant MICROCODE_ALU_HIGH : integer := MICROCODE_M3_LOW;  
        constant MICROCODE_ALU_LEN  : integer := 4;
        constant MICROCODE_ALU_LOW  : integer := MICROCODE_ALU_HIGH - MICROCODE_ALU_LEN;
        constant MICROCODE_NEXT_HIGH: integer := MICROCODE_ALU_LOW;
        constant MICROCODE_ADDR_WIDTH:integer := 6;
        constant MICROCODE_NEXT_LOW : integer := MICROCODE_NEXT_HIGH - MICROCODE_ADDR_WIDTH;

end package control_unit_constants;
