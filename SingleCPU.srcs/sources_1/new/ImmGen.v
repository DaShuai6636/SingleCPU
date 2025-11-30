module ImmGen(
    input  [31:0] instr,
    output reg [31:0] Imm
);

    wire [6:0] opcode = instr[6:0];

    always @(*) begin
        case(opcode)

            // J
            7'b1101111: begin
                // imm[20|10:1|11|19:12] << 1
                Imm = {{12{instr[31]}},      // sign
                       instr[19:12],
                       instr[20],
                       instr[30:21],
                       1'b0};
            end

            // I
            7'b0000011,   // Load
            7'b0010011,   // ADDI / ORI / ANDI / SLTI / SLLI / SRLI / SRAI
            7'b1100111:   // JALR
            begin
                Imm = {{20{instr[31]}}, instr[31:20]};
            end

            // S
            7'b0100011: begin
                Imm = {{20{instr[31]}}, instr[31:25], instr[11:7]};
            end

            // B，左移一位
            7'b1100011: begin
                // imm[12|10:5|4:1|11] << 1
                Imm = {{19{instr[31]}}, 
                       instr[31], 
                       instr[7], 
                       instr[30:25], 
                       instr[11:8], 
                       1'b0};
            end

            // U
            7'b0110111,   // LUI
            7'b0010111:   // AUIPC
            begin
                Imm = {instr[31:12], 12'b0};     // 左移 12 位
            end

            default: Imm = 32'b0;

        endcase
    end

endmodule
