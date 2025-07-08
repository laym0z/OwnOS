// kernel.c — ядро
void main() {
    char* video = (char*)0xb8000;
    const char* text = "Hello from kernel!";
    for (int i = 0; text[i] != '\0'; i++) {
        video[i * 2] = text[i];       // символ
        video[i * 2 + 1] = 0x07;      // колір (білий на чорному)
    }

    while (1); // нескінченний цикл
}
