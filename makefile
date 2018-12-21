all: proj4_1

proj4_1: proj4_1.o asm_io.o driver.c
	 gcc -m32 -o proj4_1 driver.c proj4_1.o asm_io.o
proj4_1.o: proj4_1.asm
	nasm -f elf32 -o proj4_1.o proj4_1.asm
asm_io.o: asm_io.asm
	nasm -f elf32 -d ELF_TYPE asm_io.asm
clean:
	rm *.o proj4_1
