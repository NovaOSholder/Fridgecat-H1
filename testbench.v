// Testbench (testbench.v)
module testbench;

    reg clk;
    reg reset;
    reg [3:0] ALUControl;
    reg [3:0] readReg1, readReg2, writeReg;
    reg [31:0] writeData;
    reg writeEnable;
    wire [31:0] ALUResult;
    wire Zero;

    // CPU modülünü oluştur
    CPU cpu (
        .clk(clk),
        .reset(reset),
        .ALUControl(ALUControl),
        .readReg1(readReg1),
        .readReg2(readReg2),
        .writeReg(writeReg),
        .writeData(writeData),
        .writeEnable(writeEnable),
        .ALUResult(ALUResult),
        .Zero(Zero)
    );

    // Saat sinyali üretme
    always begin
        #5 clk = ~clk;
    end

    // Test senaryosu
    initial begin
        clk = 0;
        reset = 1;
        #10 reset = 0;
        
        // Test 1: ALU işlemi
        writeReg = 4'b0001;
        writeData = 32'h00000010;
        writeEnable = 1;
        #10 writeEnable = 0;
        
        readReg1 = 4'b0001;
        readReg2 = 4'b0000;
        ALUControl = 4'b0000;  // Toplama işlemi
        #10;
        
        $display("ALU Result: %h", ALUResult);
        $display("Zero Flag: %b", Zero);

        // Test 2: ALU çıkışı sıfır mı?
        ALUControl = 4'b0001;  // Çıkarma işlemi
        #10;
        
        $display("ALU Result: %h", ALUResult);
        $display("Zero Flag: %b", Zero);

        $finish;
    end

endmodule
