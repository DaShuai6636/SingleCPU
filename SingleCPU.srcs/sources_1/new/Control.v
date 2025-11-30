`timescale 1ns / 1ps

module Control(
    input  [6:0] opcode,
    output reg branch,
    output reg jal,
    output reg [1:0] ALUop,
    output reg MemWrite,
    output reg RegWrite,
    output reg SumSrc,       // jalr 用
    output reg ALUsrc1,       // 1: PC   0: rs1
    output reg ALUsrc2,       // 1: 立即数   0: rs2
    output reg MemtoReg,      // load指令
    output reg RegDataSrc     // 1:pc+4 0:WBdata
);

    always @(*) begin
        // 默认值
        branch   = 0;
        jal      = 0;
        ALUop    = 2'b00;
        MemWrite = 0;
        RegWrite = 0;
        SumSrc   = 0;
        ALUsrc1   = 0;
        ALUsrc2   = 0;
        MemtoReg = 0;
        RegDataSrc= 0;

        case(opcode)

            // -----------------------
            // Load (I-type)
            // -----------------------
            7'b0000011: begin
                ALUsrc2   = 1;         // 地址 = rs1 + imm
                MemtoReg = 1;         // 读DM写回
                RegWrite = 1;
                ALUop    = 2'b00;     // ADD
            end

            // -----------------------
            // Store (S-type)
            // -----------------------
            7'b0100011: begin
                ALUsrc2   = 1;         // 地址 = rs1 + imm
                MemWrite = 1;         // 写DM
                ALUop    = 2'b00;     // ADD
            end

            // -----------------------
            // Branch (B-type)
            // -----------------------
            7'b1100011: begin
                branch = 1;
            end

            // -----------------------
            // I-type (ADDI, ORI, ANDI...)
            // -----------------------
            7'b0010011: begin
                ALUsrc2   = 1;         // imm
                RegWrite = 1;
                ALUop    = 2'b01;     // 交给 ALUControl 用 funct3+funct7 细分
            end

            // -----------------------
            // R-type
            // -----------------------
            7'b0110011: begin       
                RegWrite = 1;
                ALUop    = 2'b10;     // R 指令交由 ALUControl 解析
            end

            // -----------------------
            // JAL
            // -----------------------
            7'b1101111: begin
                jal      = 1;
                RegWrite = 1;
                RegDataSrc =1;         
            end

            // -----------------------
            // JALR
            // -----------------------
            7'b1100111: begin
                jal      = 1;
                SumSrc   = 1;         // rs1 + imm
                RegWrite = 1;
                ALUsrc2   = 1;         // imm
                RegDataSrc =1;
            end

            // -----------------------
            // LUI
            // -----------------------
            7'b0110111: begin
                ALUsrc2   = 1;
                RegWrite = 1;
                ALUop    = 2'b11;     // LUI
            end

            // -----------------------
            // AUIPC
            // -----------------------
            7'b0010111: begin
                RegWrite = 1;
                ALUsrc1  = 1;
                ALUsrc2   = 1;
            end

            default: begin
                // 保持默认
            end

        endcase
    end

endmodule
