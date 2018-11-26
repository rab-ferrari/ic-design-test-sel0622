# ic-design-test-sel0622
Some VHDL implementations of common integrated circuits modules and top-down project implementation using mentor graphics tools.

# Brief Description
The modules were implemented on an academic context at the Sao Carlos Engineering School (EESC-USP, Brazil) during the course SEL0622 — Integrated Circuits Project and Implementation II. This material should prove to be specially useful for students eager to obtain at least satisfactory results on the course's final exam.

# Files — VHDL Modules

1.a. div57 module: State machine representation implementation of a module that divides the input by 5 when "MC" = 1 and by 7 when "MC" = 5;
1.b. div46 module: Similar to module 1.a. but divind by 4 or 6;

2.a) count8 module: Counter by 8 with additional output "MC" = 1 only when the counting is on zero. Both assynchronous and synchronous implementations available;
2.b) count7 module: Similar to module 2.a. but counting up to 7;

3. prescaler4042 module: Dual modulus prescaler 40/42 implementation using the div57 and count8 modules;
4. ModelContador module: Simple counter from 0 to 28;

# Files — ELDO Simulation Scripts

1. q7.cir: Complete prescaler4042 simulation script;
2. q10.cir: Layout circuit simulation of the ModelContador module implementation (29 counter);
3. q11.cir: Layout circuit simulation of a logical port implementing the function ¬((¬C).(A + B)) returning the correct functioning of the circuit for all input combinations;
4. q11-tps.cir: Same circuit as 3. ELDO simulation, but returning the delays for worst case input->output changes.

# Files — Images
1. div46.png: State machine implemented on module div46;
2. div57.png: State machine implemented on module div57;
3. 7a.png: Simulation results of q7.cir ELDO script — input ("CLK") and output ("SM" and "SAI") voltages (V) vs time (s). Note that on the first half of the plot ("SM" = "1") the ratio between the frequencies is 42 whereas for the second half ("SM" = "0") the same ratio is 40;
4. 9a.png: Layout of the ModelContador module implemented using Mentor Graphics proprietary software;
5. 10a.png: Simulation of q10.cir ELDO simulation script — consumption (mW/GHz) and division factor versus operation frequency (Hz);
6. 11a.png: Empty Sea of Gates layout, ready to receive the upper layer contacts and vias;
7. 11b.png: Sea of Gates layout implementing the logical function ¬((¬C).(A + B));
8. 10c.png: Simulation results of q11.cir ELDO simulation script — input and output voltagens (V) versus time (s). Note that all binary inputs are tested  ("000", "001", "010", "011", "100", "101", "110" e "111").
9. 10d.png: Simulation results of q11-tps.cir ELDO simulation script — consumption (mW/GHz) and delay (s) versus operation frequency (Hz) for the worst cases of input->output rise/fall.
