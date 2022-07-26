# IKR RISC II Project
During the wintersemester 21/22 my fellow student Kenton and myself designed a RISC processor in VHDL. The architecture is based on the IKR RISC II of the Institute of Communication Networks and Computer Engineering at University of Stuttgart.
It follows the classic five stage RISC pipeline but implements a different ISA and does only allow word-adressable instead of byte-adressable memory.

# About this Project
We submitted our project in July 2022 with a synthesizable 5 stage pipeline including fowarding and branch-functionalities. We testet and validated our design on a Terasic Cyclone V development board.

More details on the architecture will follow

## Pipeline
A simplified schematic of the implemented pipeline is shown below:
![Simplified pipeline](raro_ikr_risc_II/graphics/pipeline.png)

The graphic was provided with kind permission of Dipl.-Ing. Mattias Meyer - Lecture script "Rechnerarchitektur und Rechnerorganisation", Wintersemester 2021/22, University of Stuttgart, Institute of Communication Networks and Computer Engineering (IKR).

So far we implemented every stage and depicted components. However, in the current state the SBPU and DBPU only implement static branches (conditional and unconditional) but no dynamic branch prediction. 

## Code
Following bullet points list the important components of each stage

### 1. Instruction Fetch
- [Program Counter](raro_ikr_risc_II/raro_ikr_risc_II_lib/hdl/mux_init_behav.vhd)
- [Instruction Memory](raro_ikr_risc_II/raro_ikr_risc_II_lib/hdl/step_if_behav.vhd)

### 2. Decode
- [Decoder](raro_ikr_risc_II/raro_ikr_risc_II_lib/hdl/dec_dc_behav.vhd)
- [Register File](raro_ikr_risc_II/raro_ikr_risc_II_lib/hdl/rf_dc_behav.vhd)
- [Static Branch Processing Unit](raro_ikr_risc_II/raro_ikr_risc_II_lib/hdl/sbpu_behav.vhd)

### 3. Execute
- [ALU](raro_ikr_risc_II/raro_ikr_risc_II_lib/hdl/alu_ex_behav.vhd)
- [Dynamic Branch Processing Unit](raro_ikr_risc_II/raro_ikr_risc_II_lib/hdl/dbpu_behav.vhd)

### 4. Memory
- [Data Memory](raro_ikr_risc_II/raro_ikr_risc_II_lib/hdl/step_me_behav.vhd)

### 5. Write Back
- No explicit vhdl files, only feedback of signals.

### Software Usage
- HDL Designer Series by Mentor Graphics
- ModelSim
- Intel Quartus
- Git


## To-Dos
- Dynamic Branch Prediction
- Clean up code (tab, spaces, comments, ...)
- Define case sensitivity to enhance readability. Either keep everything in lowercase or change to uppercase for ports, generics, ... 


## Change Log
7/25/2022: Duplicated repo from university github to private account