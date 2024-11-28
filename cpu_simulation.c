#include <stdio.h>
#include <stdint.h>

#define NUM_REGISTERS 16

// Register dosyası (R0-R15)
uint32_t registers[NUM_REGISTERS];

// ALU işlevleri
uint32_t ALU(uint32_t A, uint32_t B, uint8_t ALUControl) {
    switch (ALUControl) {
        case 0: return A + B;    // Toplama
        case 1: return A - B;    // Çıkarma
        case 2: return A & B;    // VE
        case 3: return A | B;    // VEYA
        case 4: return A ^ B;    // XOR
        case 5: return ~(A | B); // NOR
        default: return 0;       // Varsayılan durum
    }
}

int main() {
    // Tüm register'ları sıfırlama
    for (int i = 0; i < NUM_REGISTERS; i++) {
        registers[i] = 0;
    }

    // Test: ALU kullanımı
    registers[0] = 5;
    registers[1] = 3;
    
    uint8_t ALUControl = 0; // Toplama
    uint32_t result = ALU(registers[0], registers[1], ALUControl);

    printf("ALU Sonucu: %u\n", result); // ALU Sonucu: 8
