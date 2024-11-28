// ALU modülü (alu.v)
module ALU (
    input [31:0] A,         // Birinci operand
    input [31:0] B,         // İkinci operand
    input [3:0] ALUControl, // ALU kontrol sinyali
    output reg [31:0] Result,  // İşlem sonucu
    output reg Zero         // Sonuç sıfır mı?
);
    always @ (A, B, ALUControl) begin
        case (ALUControl)
            4'b0000: Result = A + B;          // Toplama
            4'b0001: Result = A - B;          // Çıkarma
            4'b0010: Result = A & B;          // Mantıksal VE
            4'b0011: Result = A | B;          // Mantıksal VEYA
            4'b0100: Result = A ^ B;          // Mantıksal XOR
            4'b0101: Result = ~(A | B);       // Mantıksal NOR
            default: Result = 32'b0;          // Varsayılan durum
        endcase
        Zero = (Result == 32'b0);  // Sonuç sıfır mı?
    end
endmodule
