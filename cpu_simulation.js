// Register dosyası (R0-R15)
let registers = Array(16).fill(0);

// ALU işlevleri
function ALU(A, B, ALUControl) {
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

// Test: ALU kullanımı
registers[0] = 5;
registers[1] = 3;
let ALUControl = 0;  // Toplama
let result = ALU(registers[0], registers[1], ALUControl);

console.log("ALU Sonucu: " + result);  // ALU Sonucu: 8
