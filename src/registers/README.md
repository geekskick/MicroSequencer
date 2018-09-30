# Registers

As part of the CPU a number of registers are required:
* PC
* T
* R
* AR
* ... etc ...

I have decided to use one module to describe all of these in the _generic_register_. This is so that there is only one set of code to test and to minimise the work required. The registers have the following requirements:

> The registers, on a rising clock edge and a '1' on the `load` input, shall store the data on the 'data' input.

> The registers, on a rising clock edge and a '1' on the `inc` input, shall increment the stored value by 1.

> The registers, when neither of the above condition are met, shall not change the stoared value.

> The registers shall output the stored value.

Some of them however don't need the increment functionality so it can be left tied low to stop it from happening.

The register are __synchronous__ in that they act on a rising edge of the clock, rather than as soon as the `inc` or `load` value changes.

## Different Widths

In order to achieve different widths the register can be instantiated with a width specified on the `data_width` generic. Notice how the `inc` input it also mapped to a signal in the PC instance below but tied low in the Data register instance:

```vhdl
    -- Program counter (has inc)
    pc_inst : generic_register generic map(
        data_width => DB_WIDTH
    )
    port map(
        clk  => clk, 
        data => databus, 
        load => pcload, 
        inc  => pcinc, 
        q    => pcbridge
    );
    
    -- Data reg (without inc)
    dr_inst : generic_register generic map(
        data_width => REG_WIDTH
    )
    port map(
        clk  => clk, 
        data => databus(REG_WIDTH-1 downto 0), 
        load => drload, 
        inc  => '0', 
        q    => drbridge
    );
```
