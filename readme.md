# RS Microsequencer Implementation
Implementation of the RS CPU microsequencer as described by Carpinelli in his [book](https://www.amazon.co.uk/Computer-Systems-Organization-Architecture-United/dp/0201612534/ref=sr_1_1?s=books&ie=UTF8&qid=1525965130&sr=1-1&refinements=p_27%3AJohn+Carpinelli). 
The intention of the repository is to provide an example implementation, and eventually a guide of how to for anyone struggling with getting their noggin around it. Including how to turn the description provided by Carpinelli into design and VHDL, how to make the test bench to test it and how to integrate it all together. 

## What it does
See the [microcode](CU_REG/control_unit/microcode.vhd).

## TODO
- [X] Refactor to suit a naming convention (any as long as its consistant).
- [X] Make register a generic entity the same way as the buffer.
- [ ] Separate the address and data busses.
- [X] Test ALU
- [ ] Document to help people learn from this!
- [ ] Implement this on a physical device
- [ ] Test Top Model
- [ ] ALU commands are repeatative - make them specific to operator rather than CU states.

