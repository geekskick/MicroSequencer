# RS Microsequencer Implementation
Implementation of the RS CPU microsequencer as described by Carpinelli in his [book](https://www.amazon.co.uk/Computer-Systems-Organization-Architecture-United/dp/0201612534/ref=sr_1_1?s=books&ie=UTF8&qid=1525965130&sr=1-1&refinements=p_27%3AJohn+Carpinelli). 
This was demonstrated on a [DE2 board](https://www.terasic.com.tw/cgi-bin/page/archive.pl?No=30) using it's seven segment displays to show the contents of various registers and control unit states. 

From memory it also used the RAM chip on the board but it looks like I didn't include that code. 

## What it does
See the [microcode](CU_REG/control_unit/microcode.vhd).

## TODO
- [ ] Refactor to suit a naming convention (any as long as its consistant.
- [ ] Make register a generic entity the same way as the buffer.
- [ ] Separate the address and data busses.
- [ ] Test ALU
- [ ] Document to help people learn from this!
- [ ] Implement this on a physical device