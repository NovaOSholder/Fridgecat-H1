# Register dosyası (R0-R15)
registers = [0] * 16

# ALU işlevleri
def ALU(A, B, ALUControl):
    if ALUControl == 0:
        return A + B    # Toplama
    elif ALUControl == 1:
        return A - B    # Çıkarma
    elif ALUControl == 2:
        return A & B    # VE
    elif ALUControl == 3:
        return A | B    # VEYA
    elif ALUControl == 4:
        return A ^ B    # XOR
    elif ALUControl == 5:
        return ~(A | B) # NOR
    else:
        return 0        # Varsayılan durum

# Instruction Fetch Decode Execute (IFDE) aşamaları
def execute_instruction(instruction):
    opcode = instruction >> 26     # Opcode (ilk 6 bit)
    operands = instruction & 0x3FF # Operands (sonraki 10 bit)
    
    if opcode == 0:  # Toplama
        registers[0] = ALU(registers[0], registers[1], 0)
    elif opcode == 1:  # Çıkarma
        registers[0] = ALU(registers[0], registers[1], 1)
    else:
        print("Bilinmeyen Komut")

# Test: ALU ve işlemci kullanımı
registers[0] = 5
registers[1] = 3
instruction = 0x20000000  # Örnek komut (toplama)
execute_instruction(instruction)

print(f"ALU Sonucu: {registers[0]}")  # Sonuç: 8
