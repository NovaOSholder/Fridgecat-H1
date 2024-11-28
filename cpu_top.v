// Ana CPU tasarımı (cpu_top.v)
module CPU (
    input clk,              // Saat sinyali
    input reset,            // Reset sinyali
    input [3:0] ALUControl, // ALU kontrol sinyali
    input [3:0] readReg1,   // Okuma 1. register
    input [3:0] readReg2,   // Okuma 2. register
    input [3:0] writeReg,   // Yazma register'ı
    input [31:0] writeData, // Yazma verisi
    input writeEnable,      // Yazma izni
    output [31:0] ALUResult, // ALU sonucu
    output Zero             // ALU sonucu sıfır mı?
);

    // ALU ve register dosyası örnekleri
    wire [31:0] readData1;
    wire [31:0] readData2;
    
    // Register dosyası modülü
    RegisterFile regFile (
        .clk(clk),
        .reset(reset),
        .readReg1(readReg1),
        .readReg2(readReg2),
        .writeReg(writeReg),
        .writeData(writeData),
        .writeEnable(writeEnable),
        .readData1(readData1),
        .readData2(readData2)
    );

    // ALU modülü
    ALU alu (
        .A(readData1),
        .B(readData2),
        .ALUControl(ALUControl),
        .Result(ALUResult),
        .Zero(Zero)
    );

endmodule
