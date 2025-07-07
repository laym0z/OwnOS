org 0x7C00 ; where code should be loaded (Directive)
bits 16

main:
    hlt ; stops CPU from executing

.halt
    jmp .halt

times 510-($-$$) db 0 ; $-$$ - size of the file (bytes)

; $ - equal to the memory offset of the current line
; $$ - equalt to the memory offset of the beginning of the current section

dw 0AA55h ; signature

