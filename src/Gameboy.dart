import 'dart:typed_data';

import 'CPU.dart';
import 'LCD.dart';
import 'memory/Memory.dart';
import 'registers/Register.dart';
import 'registers/FlagRegister.dart';
import 'registers/ProgramCounter.dart';

class Gameboy
{
	CPU cpu;
	LCD lcd;
	Memory memory;

	List<Register> registers;

	Register a;
	Register b;
	Register c;
	Register d;
	Register e;
	FlagRegister f;
	Register h;
	Register l;

	ProgramCounter program_counter;

	Gameboy(Uint8List fileData)
	{
		memory = new Memory(fileData);
		lcd = new LCD(memory);
		program_counter = new ProgramCounter(0x100);

		a = new Register();
		b = new Register();
		c = new Register();
		d = new Register();
		e = new Register();
		f = new FlagRegister();
		h = new Register();
		l = new Register();

		registers = [a, b, c, d, e, f, h, l];

		cpu = new CPU(memory, program_counter, registers);
		startupsequence();

	}

	void startupsequence()
	{
		print("PC: " + program_counter.toString());
		memory.write(19,0x105);
		print(memory.read(0x105));
		print(memory.read(0x106));
		print(memory.read(0x107));
		print(memory.read(0x108));
		print(memory.read(0x109));
		print(5);
	}
}
