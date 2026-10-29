# Simulation Results — 4-Bit ALU

## Simulator
- Tool: Icarus Verilog
- Version: 13.0

## Compilation
```bash
iverilog -g2012 -o alu_sim rtl/alu_4bit.v tb/tb_alu_4bit.v
```

## Run Simulation
```bash
vvp alu_sim
```

## Result
All 9 directed test cases passed in the local simulation.

Tested operations:
- Addition with carry
- Addition without carry
- Subtraction
- AND
- OR
- XOR
- NOT
- Left shift
- Right shift

**Status: ALL TESTS PASSED**

This result covers the test cases included in the current testbench. It does not represent exhaustive verification of every possible input combination.
