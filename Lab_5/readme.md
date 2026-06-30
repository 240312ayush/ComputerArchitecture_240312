# Lab 5: VHDL Code for Combinational Circuits (Comparator)

**Course:** Computer Architecture (CMP 262)
**Program:** Bachelor of Computer Engineering
**Semester:** Fourth Semester
**College:** Cosmos College of Management and Technology
**Department:** Department of Information and Communication Technology

---

## Objective

- To design and simulate a 2-bit magnitude comparator in VHDL.
- To understand how comparison operations are implemented in hardware.

---

## Theory

A magnitude comparator compares two binary numbers and produces three output signals:
- **EQ (Equal):** HIGH when A = B
- **GT (Greater Than):** HIGH when A > B
- **LT (Less Than):** HIGH when A < B

For a 2-bit comparator with inputs A = $A_1A_0$ and B = $B_1B_0$, the logic can be described using relational operators in VHDL. By casting the `std_logic_vector` inputs to `unsigned`, we can use standard comparison operators (`=`, `>`, `<`) which the VHDL compiler synthesizes into the appropriate gate logic.

### Expected Truth Table

| A | B | EQ | GT | LT |
|---|---|----|----|----|
| 00 | 00 | 1 | 0 | 0 |
| 01 | 00 | 0 | 1 | 0 |
| 00 | 01 | 0 | 0 | 1 |
| 10 | 11 | 0 | 0 | 1 |
| 11 | 10 | 0 | 1 | 0 |
| 11 | 11 | 1 | 0 | 0 |

---

## Design Files

**Filename:** `comparator_2bit.vhd`

The design uses the `NUMERIC_STD` library to perform unsigned comparisons between the two 2-bit input vectors.

---

## Testbench File

**Filename:** `comparator_tb.vhd`

The testbench instantiates the `COMPARATOR_2BIT` entity and applies the sequence of inputs defined in the lab manual at 10 ns intervals.

---

## Simulation Commands

Run the following commands in your terminal to compile and simulate:

```bash
# 1. Analyze (compile) the design and testbench
ghdl -a comparator_2bit.vhd comparator_tb.vhd

# 2. Elaborate the testbench
ghdl -e COMPARATOR_TB

# 3. Simulate and generate the waveform file
ghdl -r COMPARATOR_TB --vcd=comparator.vcd

# 4. Open the waveform in GTKWave
gtkwave comparator.vcd
```

---

## Output

![output](image.png)

The simulation generates a `comparator.vcd` file. When viewed in GTKWave, you should observe the following transitions:

1. At **0-10ns**: A=00, B=00 → EQ=1
2. At **10-20ns**: A=01, B=00 → GT=1
3. At **20-30ns**: A=00, B=01 → LT=1
4. At **30-40ns**: A=10, B=11 → LT=1
5. At **40-50ns**: A=11, B=10 → GT=1
6. At **50-60ns**: A=11, B=11 → EQ=1

---

## Discussion and Conclusion

In this lab, a 2-bit magnitude comparator was successfully designed and simulated. By using the `Behavioral` modeling style with `if-elsif-else` statements and the `unsigned` type from `IEEE.NUMERIC_STD`, the comparison logic was implemented concisely. 

The simulation results in GTKWave perfectly matched the expected truth table, verifying that the circuit correctly identifies equal, greater than, and less than relationships between two-bit binary numbers. This confirms the effectiveness of using high-level VHDL constructs to describe complex combinational logic.

---