; bootloader.asm — 1 сектор = 512 байт
[BITS 16]
[ORG 0x7C00]

start:
    ; print '>'
    mov ah, 0x0E
    mov al, '>'
    int 0x10

    ; завантажуємо ядро з другого сектора
    mov bx, 0x8000       ; куди в пам'ять (ядро)
    mov ah, 0x02         ; функція: читати сектора
    mov al, 1            ; кількість секторів
    mov ch, 0
    mov cl, 2
    mov dh, 0
    mov dl, 0x80         ; диск
    int 0x13             ; BIOS: read sector

    jmp 0x0000:0x8000    ; переход до ядра

; вирівнювання до 510 байт
times 510 - ($ - $$) db 0
dw 0xAA55                ; boot signature