# processor32
#Global architecture of the processor
It is a question of linking all the components (registers, ALU, control) between them, by inserting multiplexers and registers correctly controlled at the necessary places. It is enough to follow the global scheme of the processor given previously.
A .vhd file is then used to describe the global architecture in a structural way by instantiating all the components already described. 
Create a project named processor and add .vhd files to describe the different components of this processor. Start by describing: 
⦁ the registers (instruction, status and register bank),
⦁ the ALU,
⦁ the control unit,
⦁ the overall architecture of the processor on which the previous components will be grafted.
A file is provided to you serving as a draft of VHDL models as well as test benchs to validate your components. You must therefore determine the behavioral description of your component at the RTL (Register Transfer Level) written in VHDL. Simulate and verify its correct operation using the ModelSim tool. 
