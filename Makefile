all: os-image.bin

bootloader.bin: src/bootloader.asm
	nasm -f bin src/bootloader.asm -o build/bootloader.bin

kernel.o: src/kernel.c
	i686-elf-gcc -ffreestanding -m32 -c src/kernel.c -o build/kernel.o

kernel.bin: kernel.o src/linker.ld
	i686-elf-ld -m elf_i386 -T src/linker.ld build/kernel.o -o build/kernel.bin

os-image.bin: bootloader.bin kernel.bin
	cat build/bootloader.bin build/kernel.bin > build/os-image.bin

run: os-image.bin
	qemu-system-i386 -drive format=raw,file=build/os-image.bin