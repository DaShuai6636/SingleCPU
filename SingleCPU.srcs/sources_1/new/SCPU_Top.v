`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/11/23 22:08:53
// Design Name: 
// Module Name: SCPU_Top
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


module SCPU_Top(
    input clk,
    input rstn,
    input [15:0] sw_i,
    output [7:0] disp_an_o,disp_seg_o,
    output [15:0] led_o 
    );
    
    reg [31:0] PC;
    wire cpu_clk;
    wire [31:0] instr;
    wire [32:0] RFdata;
    wire [31:0] rs1,rs2;
    wire [31:0] Imm;
    wire zero, lt, ltu;
    wire [31:0] ALU_result;
    wire [31:0] DMout;
    
    //控制信号
    wire branch;
    wire jal;
    wire [1:0] ALUop;
    wire MemWrite;
    wire RegWrite;
    wire SumSrc;       // jalr 用
    wire ALUsrc1;       // 1: PC   0: rs1
    wire ALUsrc2;       // 1: 立即数   0: rs2
    wire MemtoReg;      // load指令
    wire RegDataSrc;     // 1:pc+4 0:WBdata
    
    wire [3:0] ALUctrl;
    wire branch_taken;
    //分频
    reg [31:0] clk_div;
always @(posedge clk or negedge rstn) begin
    if(!rstn) clk_div<=0;
    else clk_div<=clk_div+1'b1;
end
    assign cpu_clk = sw_i[15] ? clk_div[25] : sw_i[0];//自动时钟或手动时钟
    
    //实例化IM
    dist_mem_IM U_IM(
        .a(PC[8:2]),
        .spo(instr)
    );
    
    //实例化Control
    Control ControlUnit (
        .opcode     (instr[6:0]),
        .branch     (branch),
        .jal        (jal),
        .ALUop      (ALUop),
        .MemWrite   (MemWrite),
        .RegWrite   (RegWrite),
        .SumSrc     (SumSrc),
        .ALUsrc1    (ALUsrc1),
        .ALUsrc2    (ALUsrc2),
        .MemtoReg   (MemtoReg),
        .RegDataSrc (RegDataSrc)
    );
    
    //实例化RF
    wire [31:0] data1;
    assign data1 = MemtoReg? DMout : ALU_result;
    assign RFdata = RegDataSrc? PC+4 : data1;
    
    RF U_RF(
        .rs1(instr[19:15]),
        .rs2(instr[24:20]),
        .rd(instr[11:7]),
        .WriteData(RFdata),
        .RegWrite(RegWrite),
        .mode(sw_i[1]),
        .clk(cpu_clk),
        .rstn(rstn),
        .ReadData1(rs1),
        .ReadData2(rs2)
    );
    
    //实例化ImmGen
    ImmGen U_ImmGen(
    .instr(instr),
    .Imm(Imm)
);
    //实例化ALUcontrol
    ALUControl U_ALUControl(
        .ALUop(ALUop),
        .funct3(instr[14:12]),
        .funct7(instr[31:25]),
        .AluCtrl(ALUctrl)
    );
    
    //实例化ALU
// ALU 输入选择：srcA、srcB
    wire [31:0] ALU_A;
    wire [31:0] ALU_B;
    
    assign ALU_A = (ALUsrc1) ? PC : rs1;          // 1: PC, 0: rs1
    assign ALU_B = (ALUsrc2) ? Imm : rs2;         // 1: Imm, 0: rs2
 
    ALU U_ALU(
        .srcA(ALU_A),
        .srcB(ALU_B),
        .ALUctrl(ALUctrl),
        .zero(zero),
        .lt(lt),
        .ltu(ltu),
        .rslC(ALU_result)
    );
    
    //实例化DM
    DM U_DM(
        .clk(cpu_clk),
        .MemWrite(MemWrite),
        .addr(ALU_result[5:0]),
        .WriteData(rs2),
        .DMType(instr[14:12]),
        .ReadOut(DMout)
    );
    
    //写PC部分
 // 实例化branchctrl
    BrancCtrl U_BranchCtrl(
        .funct3(instr[14:12]),
        .zero(zero),
        .lt(lt),
        .ltu(ltu),
        .branch_taken(branch_taken)
    ); 
    
    wire PCsel;
    assign PCsel = (branch_taken & branch)|jal ;
    
    wire [31:0] PCtemp;
    assign PCtemp = SumSrc ? (ALU_result&(~1)):(PC+Imm);
    
    wire [31:0] PCnext;
    assign PCnext = PCsel ? PCtemp : (PC+4);
always @(posedge cpu_clk or negedge rstn)begin
    if(!rstn) PC <= 0;
    else PC <= PCnext;
end 

    //调试
    reg [63:0] disp_data;

always @(*) begin
    case (sw_i[4:1])
        4'b0000: disp_data <= {32'b0, ALU_result}; // ALU result
        4'b0001: disp_data <= {32'b0, ALU_A}; // ALU input A
        4'b0010: disp_data <= {32'b0, ALU_B}; // ALU input B
        4'b0011: disp_data <= {32'b0, data1}; // Writeback preselect
        4'b0100: disp_data <= {32'b0, Imm}; // Immediate
        4'b0101: disp_data <= {32'b0, rs1}; // rs1
        4'b0110: disp_data <= {32'b0, rs2}; // rs2
        4'b0111: disp_data <= {32'b0, instr}; // instruction
        4'b1000: disp_data <= {32'b0, DMout}; // DM output
        4'b1001: disp_data <= {32'b0, RFdata}; // Register file write data
        4'b1010: disp_data <= {32'b0, PC}; // PC
        4'b1011: disp_data <= {32'b0, PCnext}; // Next PC
        4'b1100: disp_data <= {32'b0, {28'b0,PC+4}}; // PC+4
        4'b1101: disp_data <= {32'b0, {31'b0,PCtemp}}; // PCtemp
        4'b1110: disp_data <= {32'b0, {31'b0,jal}}; // jal
        4'b1111: disp_data <= {63'b0, PCsel}; // PCsel
        default: disp_data <= 64'h0;
    endcase
end


    Disp U_Disp(
        .clk(clk),
        .rstn(rstn),
        .disp_mode(1'b0),        // graph 模式：每个数码管显示 8bit
        .i_data(disp_data),
        .o_seg(disp_seg_o),
        .o_sel(disp_an_o)
    );

    assign led_o = {
    branch,        // bit15
    jal,           // bit14
    ALUop,         // bit13-12
    MemWrite,      // bit11
    RegWrite,      // bit10
    SumSrc,        // bit9
    ALUsrc1,       // bit8
    ALUsrc2,       // bit7
    MemtoReg,      // bit6
    RegDataSrc,    // bit5
    branch_taken,  // bit4
    ALUctrl        // bit3-0
};

endmodule
