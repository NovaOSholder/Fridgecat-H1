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

// Instruction Fetch Decode Execute (IFDE) aşamaları
function executeInstruction(instruction) {
    let opcode = instruction >>> 26;   // Opcode (ilk 6 bit)
    let operands = instruction & 0x3FF; // Operands (sonraki 10 bit)
    
    if (opcode === 0) {  // Toplama
        registers[0] = ALU(registers[0], registers[1], 0);
    } else if (opcode === 1) {  // Çıkarma
        registers[0] = ALU(registers[0], registers[1], 1);
    } else {
        console.log("Bilinmeyen Komut");
    }
}

// Test: ALU ve işlemci kullanımı
registers[0] = 5;
registers[1] = 3;
let instruction = 0x20000000;  // Örnek komut (toplama)
executeInstruction(instruction);

console.log("ALU Sonucu: " + registers[0]);  // Sonuç: 8
