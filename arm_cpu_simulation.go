package main

import "fmt"

// Register dosyası (R0-R15)
var registers [16]uint32

// ALU işlevleri
func ALU(A, B uint32, ALUControl uint8) uint32 {
    switch ALUControl {
    case 0:
        return A + B // Toplama
    case 1:
        return A - B // Çıkarma
    case 2:
        return A & B // VE
    case 3:
        return A | B // VEYA
    case 4:
        return A ^ B // XOR
    case 5:
        return ^(A | B) // NOR
    default:
        return 0 // Varsayılan durum
    }
}

// Instruction Fetch Decode Execute (IFDE) aşamaları
func executeInstruction(instruction uint32) {
    opcode := instruction >> 26    // Opcode (ilk 6 bit)
    operands := instruction & 0x3FF // Operands (sonraki 10 bit)
    switch opcode {
    case 0: // Toplama
        ALU(registers[0], registers[1], 0)
    case 1: // Çıkarma
        ALU(registers[0], registers[1], 1)
    default:
        fmt.Println("Bilinmeyen Komut")
    }
}

func main() {
    // Test: ALU ve işlemci kullanımı
    registers[0] = 5
    registers[1] = 3
    instruction := uint32(0x20000000) // Örnek komut (toplama)
    executeInstruction(instruction)

    fmt.Printf("ALU Sonucu: %d\n", registers[0]) // Sonuç: 8
}
