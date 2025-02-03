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
 
- [3. SISO Design and Testbench Components]
  - [3.1 SISO Design](#31-SISO-Design)
  - [3.2 Testbench_Top Components](#32-Testbench-Components)
    - [3.2.1 Interface](#321-Interface)
 
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

## 2. Component and Testbench Architecture

### 2.1 Serial In Serial Out Shift Register

<p align="center"><img src="https://media.geeksforgeeks.org/wp-content/uploads/20230611225553/SISO.png" width = "500" height = "200"></p>

<p align="justify">A <b>Serial-In Serial-Out</b> (<i>SISO</i>) shift register is a sequential logic circuit that allows data to be shifted in and out one bit at a time in a serial manner. It consists of a cascade of flip-flops connected in series, forming a chain. The input data is applied to the first flip-flop in the chain, and as the clock pulses, the data propagates through the flip-flops, ultimately appearing at the output.</p>

<p align="justify">The synchronous nature of the flip-flops ensures that the shifting of data occurs in a coordinated manner. When the clock signal rises, the input data is sampled and stored in the first flip-flop. On subsequent clock pulses, the stored data propagates through the flip-flops, moving from one flip-flop to the next.</p>

<div style="display: flex; justify-content: space-between; align-items: center;">
  <img src="https://media.geeksforgeeks.org/wp-content/uploads/20240821170249/IMG_COM_202408211659308480.jpg" width="300" height="350">
  <img src="https://media.geeksforgeeks.org/wp-content/uploads/20240821170523/IMG_COM_202408211658185730.jpg" width="400" height="350">
</div>

The operation of a SISO shift register relies on two primary components: the flip-flops and the clock signal:
- <p align="justify"><b>Flip-Flops:</b> A flip-flop is a fundamental building block of sequential circuits. In the case of a SISO shift register, each flip-flop stores a single bit of data. The number of flip-flops determines the length or size of the shift register.</p>
- <p align="justify"><b>Clock Signal:</b> The clock signal synchronizes the movement of data through the shift register. With each clock pulse, the data shifts from one flip-flop to the next. The clock signal ensures that the data propagates in a controlled and synchronized manner.</p>

<p align="justify">When the clock signal transitions from low to high (or high to low, depending on the specific implementation), the input data is sampled and stored in the first flip-flop. On subsequent clock pulses, the stored data moves through the chain of flip-flops. The output of the shift register is taken from the last flip-flop in the series.</p>

### 2.2 SystemVerilog Testbench Architecture

<p align="center"><img src="https://verificationguide.com/images/systemverilog/testbench/sv_mem_model_block_diagram.png"></p>

<p align="justify">To check the functional correctness of the design, testbench is written. The verification process allows verification engineers in finding bugs, checking for RTL correctness based on the design specification. The first step in the verification process is to prepare a verification plan which is tightly coupled with the design specification that involves what all features need to be tested and techniques used to verify the design under test (DUT) such as scoreboard check planning, assertions, and functional coverage writing, etc. The testbench is a setup or environment that allows verification of DUT.</p>

**Testbench Components:**
1. <p align="justify"><b>DUT:</b> DUT stands for <b>Design Under Test</b> and is the hardware design written in Verilog or VHDL. DUT is a term typically used in post validation of the silicon once the chip is fabricated. In pre validation, it is also called as Design Under Verification, DUV in short.</p>
2. <p align="justify"><b>Interface:</b> If the design contained hundreds of port signals it would be cumbersome to connect, maintain and re-use those signals. Instead, we can place all the design input-output ports into a container which becomes an interface to the DUT. The design can then be driven with values through this interface.</p>
3. <p align="justify"><b>Transaction:</b> The transaction is a packet that is driven to the DUT or monitored by the monitor as a pin-level activity.In simple terms, the transaction is a class that holds a structure that is used to communicate with DUT.</p>
4. <p align="justify"><b>Driver:</b> The driver is the verification component that does the pin-wiggling of the DUT, through a task defined in the interface. When the driver has to drive some input values to the design, it simply has to call this pre-defined task in the interface, without actually knowing the timing relation between these signals. The timing information is defined within the task provided by the interface. This is the level of abstraction required to make testbenches more flexible and scalable. In the future, if the interface changed, then the new driver can call the same task and drive signals in a different way.</p>
5. <p align="justify"><b>Monitor:</b> Until now, how data is driven to the DUT was discussed. But that's only half way through, because our primary aim is to verify the design. The DUT processes input data and sends the result to the output pins. The monitor picks up the processed data, converts it into a data object and sends it to the scoreboard.</p>
6. <p align="justify"><b>Scoreboard:</b> The Scoreboard can have a reference model that behaves the same way as the DUT. This model reflects the expected behavior of the DUT. Input sent to the DUT is also sent to this reference model. So if the DUT has a functional problem, then the output from the DUT will not match the output from our reference model. So comparison of outputs from the design and the reference model will tell us if there is a functional defect in the design. This is usually done in the scoreboard.</p>
7. <p align="justify"><b>Environment:</b> It makes the verification more flexible and scalable because more components can be plugged into the same environment for a future project.</p>
8. <p align="justify"><b>Testbench_Top:</b> This is the topmost file, which connects the DUT and Environment. It consists of DUT, Environment and interface instances, the interface connects the DUT and Environemnt.</p>
