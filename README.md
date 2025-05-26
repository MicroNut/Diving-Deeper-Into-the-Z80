# [Diving Deeper into the Z80](https://github.com/MicroNut/Diving-Deeper-Into-the-Z80/blob/main/Documentation/Diving%20Deeper%20into%20the%20Z80.pdf)
<p align="center">
  <a href="/Documentation/Diving Deeper into the Z80.pdf">
    <img src="/Documentation/Resources/coverart.png" alt="Diving Deeper into the Z80"/>
  </a>
</p>

# Description

Come with me on an adventure discovering how the logic of the Zilog Z80 computer processing unit works. I'll be diving deep into the following
* Registers - Where all values are stored

*  ALU - The arithmetic logic unit. Where all the logic is handled.

*  PLA - The programmable logic array. The decoder that reads the operation codes and directs them to the correct logic function

* Timing - the timing of the read, write and other cycles

* Control - The traffic cop directing the bus and control lines

* Putting it all together - Making a Z80 simulated system using VGA, 7 segment displays, 4x4 keypad and serial io using [Digital](https://github.com/hneemann/Digital) logic simulator.

# Status 
In progress - Working on the Register section

# References
* [Visual6502](http://visual6502.org/images/pages/Zilog_Z84C00_die_shots.html) High resolution die shots of the Z80.

* [Ken Shirrif' Blog](https://www.righto.com/p/index.html) His site reverse engineered the Z80 die.

    *  [Z80 notes](https://github.com/shirriff/z80-notes) Gitub site of his notes on the layout of the Z80 die 

* [Baltazar Studios](https://baltazarstudios.com/) Goran Devic's site where he reversed the Z80 die to make a netlist Z80 simulator and a FPGA Z80 soft core
  
    *   [Z80Explorer](https://github.com/gdevic/Z80Explorer) Github site of the netlist Z80 simulator where you can see the processing on the Z80 die visually.
  
    *  [A-Z80](https://github.com/gdevic/A-Z80) Github site with bdf files for Intel's FPGA to make a Z80 soft core. He includes an example of a working ZX Spectrum.
  
