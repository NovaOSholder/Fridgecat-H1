.global _start

.section .data
    result: .word 0

.section .text
_start:
    MOV R0, #5            // R0 = 5
    MOV R1, #3            // R1 = 3
    ADD R2, R0, R1        // R2 = R0 + R1 (Toplama)
    LDR R3, =result       // Sonuç adresini yükle
    STR R2, [R3]          // Sonucu memory'ye yaz

    // Çıkış
    MOV R7, #1            // Exit syscall
    SVC 0
