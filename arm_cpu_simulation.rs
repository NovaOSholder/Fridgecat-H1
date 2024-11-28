use std::fmt;

// Register dosyası (R0-R15)
const NUM_REGISTERS: usize = 16;
static mut REGISTERS: [u32; NUM_REGISTERS] = [0; NUM_REGISTERS];

// ALU işlevleri
fn ALU(A: u32, B: u32, ALUControl: u8) -> u32 {
    match ALUControl {
        0 => A + B,  // Toplama
        1 => A - B,  // Çıkarma
        2 => A & B,  // VE
        3 => A | B,  // VEYA
        4 => A ^ B,  // XOR
        5 => !(A | B), // NOR
        _ => 0,      // Varsayılan durum
    }
}

// CPU'nun temel işlevlerini simüle etmek
fn execute_instruction(instruction: u32) {
    let opcode = instruction >> 26;   // Opcode (ilk 6 bit)
    let operands = instruction & 0x3FF; // Operands (sonraki 10 bit)

    match opcode {
        0 => {
            unsafe {
                REGISTERS[0] = ALU(REGISTERS[0], REGISTERS[1], 0); // Toplama
            }
        },
        1 => {
            unsafe {
                REGISTERS[0] = ALU(REGISTERS[0], REGISTERS[1], 1); // Çıkarma
            }
        },
        _ => println!("Bilinmeyen Komut"),
    }
}

fn main() {
    unsafe {
        REGISTERS[0] = 5;
        REGISTERS[1] = 3;
    }

    let instruction = 0x20000000;  // Örnek komut (toplama)
    execute_instruction(instruction);

    unsafe {
        println!("ALU Sonucu: {}", REGISTERS[0]); // Sonuç: 8
    }
}
