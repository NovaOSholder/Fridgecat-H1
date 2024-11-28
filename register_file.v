// Register dosyası (register_file.v)
module RegisterFile (
    input clk,               // Saat sinyali
    input reset,             // Reset sinyali
    input [3:0] readReg1,    // Okuma 1. register
    input [3:0] readReg2,    // Okuma 2. register
    input [3:0] writeReg,    // Yazma register'ı
    input [31:0] writeData,  // Yazma verisi
    input writeEnable,       // Yazma izni
    output [31:0] readData1, // Okuma 1. veri
    output [31:0] readData2  // Okuma 2. veri
);

    // Register dosyasındaki 16 register
    reg [31:0] registers [0:15];

    // Yazma işlemi
    always @ (posedge clk or posedge reset) begin
        if (reset) begin
            // Reset işlemi: tüm register'ları sıfırla
            integer i;
            for (i = 0; i < 16; i = i + 1)
                registers[i] = 32'b0;
        end else if (writeEnable) begin
            registers[writeReg] = writeData;  // Yazma işlemi
        end
    end

    // Okuma işlemleri
    assign readData1 = registers[readReg1];
    assign readData2 = registers[readReg2];

endmodule
