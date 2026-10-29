# 4-Bit ALU Design and RTL Verification

A beginner-friendly Verilog HDL project implementing a 4-bit Arithmetic Logic Unit (ALU) and a self-checking testbench.

> Learning/demo project: run the simulation, understand the code, and make changes you can explain before publishing it as your portfolio work. Do not claim FPGA/hardware testing unless you perform it.

## Operations

| Opcode | Operation |
|---|---|
| `000` | Addition (4-bit result plus carry-out) |
| `001` | Subtraction (4-bit two's-complement result) |
| `010` | Bitwise AND |
| `011` | Bitwise OR |
| `100` | Bitwise XOR |
| `101` | Bitwise NOT of A |
| `110` | Logical left shift A by one |
| `111` | Logical right shift A by one |

## Files
- `rtl/alu_4bit.v` — combinational ALU
- `tb/tb_alu_4bit.v` — self-checking testbench

## Simulate with Icarus Verilog
From this folder run:
```bash
iverilog -g2012 -o alu_sim rtl/alu_4bit.v tb/tb_alu_4bit.v
vvp alu_sim
```
A successful simulation should end with `ALL TESTS PASSED`.

## Concepts demonstrated
- Combinational logic and `case`
- Verilog module ports and bit widths
- Arithmetic and bitwise operators
- Testbench stimulus and expected-result checking
- Basic RTL verification workflow

## Limitations / next steps
- Educational example, not production IP.
- Subtraction has no borrow or signed-overflow flag.
- Add exhaustive tests for every input/opcode combination.
- Add zero/overflow flags and run lint/synthesis as a follow-up.

## Interview topics to prepare
1. Combinational vs sequential logic
2. Why `always @(*)` is used
3. What a testbench does and why it is not synthesized
4. How `case` selects operations
5. How carry/overflow could be handled
