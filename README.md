# Verilog Traffic Light Controller

A **Verilog-based Traffic Light Controller** implemented using a **Finite State Machine (FSM)** approach.  
This project demonstrates **RTL design**, **simulation**, and **testbench-based verification**, suitable for digital design and IC front-end learning.

---

## Project Overview

This project implements a **traffic light control system** using **Verilog HDL**.  
The controller operates as a **sequential FSM**, transitioning between traffic light states (RED, YELLOW, GREEN) based on predefined timing parameters.

The design flow follows standard **RTL → Simulation → Verification** methodology.

---

## Objectives

- Practice **FSM-based RTL design** in Verilog
- Understand **sequential logic** and state transitions
- Perform **functional simulation and verification**
- Organize a clean **hardware design GitHub repository**

---

## Design Flow

Specification → FSM Modeling → RTL Coding → Testbench Verification → Simulation → Documentation

---

## Why This Project

This project reflects a typical RTL front-end workflow and demonstrates the ability to design, simulate, and verify a sequential FSM-based digital system.

---

## Design Description

- **FSM Type**: Moore Finite State Machine  
- **States**:
  - `RED`
  - `YELLOW`
  - `GREEN`
- **State Transition**:
  - Controlled by internal counters
  - Each state lasts a programmable number of clock cycles
- **Outputs**:
  - `red`
  - `yellow`
  - `green`

All outputs depend only on the **current state**, not directly on inputs.

---

## Simulation & Verification

- Simulation performed using **Vivado Simulator**
- Testbench verifies:
  - Correct state sequencing
  - Proper timing of RED / YELLOW / GREEN
  - Reset behavior
- Results are documented in the `docs/` directory:
  - **Waveform**: signal-level verification
  - **Schematic**: RTL structure visualization

---

## How to Run Simulation

1. Open **Vivado**
2. Create a new RTL project
3. Add files from:
   - `RTL code/`
   - `Testbench/`
4. Set testbench as top module
5. Run **Behavioral Simulation**

---

## Learning Outcomes

- FSM modeling in Verilog
- Separation of **combinational vs sequential logic**
- Writing clean, synthesizable RTL
- Creating a reusable and professional hardware project structure

