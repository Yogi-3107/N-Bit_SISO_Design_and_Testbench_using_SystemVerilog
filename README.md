# N-bit SISO Design and Complete Testbench Architecture using SystemVerilog

# NOTE: This Project is still in progress. This message will be omitted after the completion

<p align="justify">In this project, a <b>N-bit Asynchronous SISO</b> with a <b>Left-Shift</b> operation is designed along with a <i>Testbench Architecture</i> which employs an <b>Interface</b> to establish a connection between the <b>Design Under Test</b>(<i>DUT</i>) and an <b>Environment</b> consisting components such as a <i>Generator, Driver, Monitor, and a Scoreboard</i>. These components have <b>transactions</b> between them, which in turn helps us to verify the functionality of the circuit.</p>

## Content

- [1. Tools and resources used](#1-Tools-and-resources-used)
  - [1.1 AMD Vivado](#11-AMD-Vivado)
  - [1.2 EDA Playground](#12-EDA-Playground)
 
- [2. Component and Testbench Architecture](#2-Component-and-Testbench-Architecture)
  - [2.1 Serial In Serial Out Shift Register](#21-Serial-In-Serial-Out-Shift-Register)
  - [2.2 SystemVerilog Testbench Architecture](#22-SystemVerilog-Testbench-Architecture)
 
## 1. Tools and resources used

### 1.1 AMD Vivado

<img src="https://www.xilinx.com/content/xilinx/en/support/quality/_jcr_content/root/responsivegridgraybottom/responsivegridgraybottomcolcontainer/parsyscol3/xilinxpromo_7cf.img.jpg/1686869423281.jpg">

[AMD Vivado Design Suite](https://www.amd.com/en/products/software/adaptive-socs-and-fpgas/vivado.html) is a software suite for _synthesis_ and _analysis_ of **Hardware Description Language** (_HDL_) designs, superseding _Xilinx ISE_ with additional features for **System-on-Chip** (_SoC_) development and **High-Level Synthesis** (_HLS_). Vivado represents a ground-up rewrite and re-thinking of the entire design flow (compared to ISE). Like the later versions of ISE, Vivado includes the in-built logic simulator. Vivado also introduces high-level synthesis, with a toolchain that converts C code into programmable logic.

In this project, Vivado Edition - **2024.2** is used for both design as well as simulation.

### 1.2 EDA Playground

<img src="https://www.doulos.com/media/oo2gm0ls/eda-playground-live-webinar-website.jpg?width=410&height=230&rnd=133746846539230000" width="330" height="150">

[EDA Playground](https://edaplayground.com/home) gives engineers immediate hands-on exposure to simulating and synthesizing _SystemVerilog, Verilog, VHDL, C++/SystemC, and other HDLs_. All you need is a web browser. 
- With a simple click, run your code and see console output in real time.
- View waves for your simulation using EPWave browser-based wave viewer.
- Save your code snippets (“Playgrounds”).
- Share your code and simulation results with a web link. Perfect for web forum discussions or emails. Great for asking questions or sharing your knowledge.

For the project, EDA Playground was also utilized to simulate the design using available commercial simulators such as [Aldec Riviera Pro](https://www.aldec.com/en/products/functional_verification/riviera-pro), [Cadence Xcelium](https://www.cadence.com/en_US/home/tools/system-design-and-verification/simulation-and-testbench-verification/xcelium-simulator.html), [Semiens Questa](https://eda.sw.siemens.com/en-US/ic/questa/simulation/advanced-simulator/) and [Synopsys VCS](https://www.synopsys.com/verification/simulation/vcs.html).
