# 32-Bit ALU

Breakdown of files in repository:

- Verilog files (``*.v``):
    - ``alu.v``: Contains the code for the ALU, as well as all of its internal components (i.e. adder, multiplier, etc.)
    - ``testbench.v``: Contains the code for the testbench and sets the timescale and resolution of the simulation.
- Test-vector files (``*.tv``):
    - ``alu-tests.tv``: This file was originally intended to be used for the test vector, but using hexadecimal became inconvenient
    (slicing the bit vector properly became annoying) so we switched to ``new-alu-tests.tv``.
    - ``new-alu-tests.tv``: This contains the test vectors used for simulation (as can be seen in the testbench code). All the test vectors
    are encoded as binary strings, with underscores for readability.
- Waveform files (``*.png``): The entire waveform generated during simulation is broken up into the 3 files ``waveform1.png`` through ``waveform3.png``.
- ``to-binary.py``: A small python script used to convert the original ``alu-tests.tv`` file into a bunch of bit strings.
