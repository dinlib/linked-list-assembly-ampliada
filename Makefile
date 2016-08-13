program = linked-list-ampliado
dl = -dynamic-linker
lib = /lib/ld-linux.so.2

all: compile link run
debug: compile link gdb
x64: compile64 link64 run

compile:
	as -gstabs $(program).asm -o $(program).o

compile64:
	as -32 -gstabs $(program).asm -o $(program).o

link:
	ld $(program).o -l c $(dl) $(lib) -o $(program)

link64:
	ld -m elf_i386 $(program).o -l c $(dl) $(lib) -o $(program)

gdb:
	gdb $(program)

run:
	./$(program)

clean:
	rm *.o $(program)
