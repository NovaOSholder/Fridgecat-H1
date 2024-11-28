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

# Test: ALU kullanımı
registers[0] = 5
registers[1] = 3
ALUControl = 0  # Toplama
result = ALU(registers[0], registers[1], ALUControl)

print(f"ALU Sonucu: {result}")  # ALU Sonucu: 8
