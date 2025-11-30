`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/11/24 15:22:25
// Design Name: 
// Module Name: BrancCtrl
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module BrancCtrl(
    input [2:0] funct3,
    input zero,lt,ltu,
    output reg branch_taken
    );
    
always @(*) begin
        case (funct3)
            3'b000: branch_taken =  zero;      // BEQ
            3'b001: branch_taken = ~zero;      // BNE
            3'b100: branch_taken =  lt;        // BLT (signed)
            3'b101: branch_taken = ~lt;        // BGE (signed)
            3'b110: branch_taken =  ltu;       // BLTU (unsigned)
            3'b111: branch_taken = ~ltu;       // BGEU (unsigned)
            default: branch_taken = 1'b0;
        endcase
    end
    
endmodule
