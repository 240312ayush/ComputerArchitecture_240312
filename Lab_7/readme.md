# Lab 7: VHDL Implementation of Sequential Circuits Using Flip-Flops

**Course:** Computer Architecture (CMP 262)
**Program:** Bachelor of Computer Engineering
**Semester:** Fourth Semester
**College:** Cosmos College of Management and Technology
**Department:** Department of Information and Communication Technology

---

## Objective

* Develop VHDL models for SR, D, JK, and T flip-flops.
* Examine how clock signals control state changes in sequential logic circuits.

---

## Theory

A flip-flop is a sequential storage element capable of holding a single binary bit. Unlike combinational circuits, whose outputs depend only on current inputs, a flip-flop also remembers its previous state. In this experiment, every flip-flop changes its output only when a **rising edge** of the clock signal occurs.

---

### SR Flip-Flop

The SR (Set-Reset) flip-flop uses two control inputs: **S (Set)** and **R (Reset)**. Depending on these inputs, the output can be set, reset, or remain unchanged. The combination where both inputs are HIGH is considered an invalid operating condition.

| S | R | Q (next)      |
| - | - | ------------- |
| 0 | 0 | Q (no change) |
| 0 | 1 | 0 (reset)     |
| 1 | 0 | 1 (set)       |
| 1 | 1 | X (forbidden) |

---

### D Flip-Flop

The D (Data) flip-flop transfers the value present at input **D** to the output whenever the clock experiences a rising edge. Since it has only one data input, it removes the invalid state found in the SR flip-flop.

```
Q(next) = D
```

---

### JK Flip-Flop

The JK flip-flop is an enhanced version of the SR flip-flop. It avoids the forbidden input combination by defining the case where both inputs are HIGH as a toggle operation.

```
Q(next) = J·Q' + K'·Q
```

| J | K | Q (next)      |
| - | - | ------------- |
| 0 | 0 | Q (no change) |
| 0 | 1 | 0 (reset)     |
| 1 | 0 | 1 (set)       |
| 1 | 1 | Q' (toggle)   |

---

### T Flip-Flop

The T (Toggle) flip-flop changes its output whenever **T = 1** during a rising clock edge. If **T = 0**, the stored value remains unchanged.

```
Q(next) = T ⊕ Q
```

| T | Q (next)      |
| - | ------------- |
| 0 | Q (no change) |
| 1 | Q' (toggle)   |

---

## Design Files

### 1. SR Flip-Flop

**Filename:** `sr_ff.vhd`

*(Code remains unchanged.)*

---

### 2. D Flip-Flop

**Filename:** `d_ff.vhd`

*(Code remains unchanged.)*

---

### 3. JK Flip-Flop

**Filename:** `jk_ff.vhd`

*(Code remains unchanged.)*

---

### 4. T Flip-Flop

**Filename:** `t_ff.vhd`

*(Code remains unchanged.)*

---

## Testbench File

**Filename:** `ff_tb.vhd`

A unified testbench is created to verify the operation of all four flip-flops in a single simulation. A clock with a **20 ns period** is generated continuously, while the stimulus process supplies different input combinations to each flip-flop. Every test case is maintained for **40 ns**, allowing two rising clock edges to occur before moving to the next input condition. This approach confirms the correct behavior of Set, Reset, Hold, and Toggle operations.

*(Testbench code remains unchanged.)*

---

## Simulation Commands

```bash
# 1. Analyze all design files and testbench
ghdl -a sr_ff.vhd d_ff.vhd jk_ff.vhd t_ff.vhd ff_tb.vhd

# 2. Elaborate the testbench
ghdl -e FF_TB

# 3. Run the simulation and generate a VCD file
ghdl -r FF_TB --vcd=flipflops.vcd

# 4. View the waveform in GTKWave
gtkwave flipflops.vcd
```

---

## Simulation File

**Filename:** `flipflops.vcd`

The simulation produces a **Value Change Dump (VCD)** file containing the timing information for every input and output signal throughout the execution. Opening this file in GTKWave makes it possible to inspect waveform transitions and verify that each flip-flop performs according to its expected functionality.

---

## Output

The generated waveform was viewed using **GTKWave**. Clock, input, and output signals for all flip-flops were added to the waveform window, and the display was adjusted for easier observation.

![GTKWave Simulation Output](screenshot(158).png)

**Observation:**
The simulation results confirmed the expected operation of each flip-flop. The SR flip-flop successfully performed set, reset, and hold operations while avoiding the invalid input combination. The D flip-flop copied the input value to the output at every rising clock edge. The JK flip-flop correctly toggled when both J and K were HIGH, and the T flip-flop alternated its output whenever T was HIGH while maintaining its previous state when T was LOW. In every design, the **QB** output consistently remained the inverse of **Q**.

---

## Discussion and Conclusion

In this experiment, four commonly used flip-flops—SR, D, JK, and T—were implemented using the **Behavioral modeling** approach in VHDL. Each circuit was designed as a rising-edge-triggered sequential device and utilized an internal signal to generate both the normal and complementary outputs. A single testbench was sufficient to validate all designs by applying different input combinations under a common clock signal. The simulation waveforms obtained in GTKWave matched the expected truth tables and confirmed proper state transitions, including hold, set, reset, and toggle operations. Completing this lab strengthens the understanding of sequential logic and provides the groundwork for implementing larger digital systems such as registers, counters, and finite state machines.
