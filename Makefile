build/main.img: build/main.bin
	cp build/main.bin build/main.img
	truncate -s 1440k build/main.img

build/main.bin: src/bootloader.asm
	nasm src/bootloader.asm -f bin -o build/main.bin