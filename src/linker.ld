ENTRY(main)

SECTIONS {
    . = 0x8000;      /* Адреса завантаження ядра */
    .text : { *(.text*) }
    .data : { *(.data*) }
    .bss  : { *(.bss*)  }
}