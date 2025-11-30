`timescale 1ns / 1ps

module ALUControl(
    input  [1:0] ALUop,
    input  [2:0] funct3,
    input  [6:0] funct7,
    output reg [3:0] AluCtrl
);

    always @(*) begin
        case (ALUop)
            2'b00: begin
                AluCtrl = `ADD;
            end

            2'b01: begin
                case (funct3)
                    3'b000: AluCtrl = `ADD;                  // ADDI
                    3'b111: AluCtrl = `AND;                  // ANDI
                    3'b110: AluCtrl = `OR;                   // ORI
                    3'b100: AluCtrl = `XOR;                  // XORI
                    3'b001: AluCtrl = `SLL;                  // SLLI
                    3'b101: begin
                        if (funct7[5]) AluCtrl = `SRA;       // SRAI
                        else           AluCtrl = `SRL;       // SRLI
                    end
                    3'b010: AluCtrl = `SLT;                  // SLTI
                    3'b011: AluCtrl = `SLTU;                 // SLTIU
                    default: AluCtrl = `ADD;
                endcase
            end

            2'b10: begin
                case (funct3)
                    3'b000: begin
                        if (funct7[5]) AluCtrl = `SUB;       // SUB
                        else           AluCtrl = `ADD;       // ADD
                    end
                    3'b111: AluCtrl = `AND;                  // AND
                    3'b110: AluCtrl = `OR;                   // OR
                    3'b100: AluCtrl = `XOR;                  // XOR
                    3'b001: AluCtrl = `SLL;                  // SLL
                    3'b101: begin
                        if (funct7[5]) AluCtrl = `SRA;       // SRA
                        else           AluCtrl = `SRL;       // SRL
                    end
                    3'b010: AluCtrl = `SLT;                  // SLT
                    3'b011: AluCtrl = `SLTU;                 // SLTU
                    default: AluCtrl = `ADD;
                endcase
            end

            2'b11: begin
                AluCtrl = `LUI;
            end

            default: begin
                AluCtrl = `ADD;
            end

        endcase
    end

endmodule
