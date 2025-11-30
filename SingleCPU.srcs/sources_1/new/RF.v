`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/11/22 10:57:55
// Design Name: 
// Module Name: RF
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


module RF(
    input [5:0] rs1,rs2,rd,
    input RegWrite,
    input mode,//调试模式
    input [31:0] WriteData,
    input clk,
    input rstn,
    output [31:0] ReadData1,ReadData2
    );
    
    //寄存器堆
    reg [31:0] registers[0:31];
    
    //写逻辑
    integer j;
    
always @(posedge clk or negedge rstn) begin
    if(!rstn) begin
        for(j=0;j<32;j=j+1)
            registers[j] <= 32'b0;
    end
    else if(RegWrite && (!mode)&& (rd != 0)) begin
        registers[rd] <= WriteData;
    end
end    
    //读逻辑（不受时钟控制）
    assign ReadData1 =  registers[rs1];
    assign ReadData2 =  registers[rs2];
    
endmodule
