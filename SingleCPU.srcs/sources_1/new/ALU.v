module ALU(
    input signed [31:0] srcA, srcB,
    input [3:0] ALUctrl,
    output zero,
    output lt,
    output ltu,
    output reg signed [31:0] rslC
);

`define AND   4'b0000
`define OR    4'b0001
`define ADD   4'b0010
`define SUB   4'b0011
`define XOR   4'b0100
`define SLL   4'b0101   
`define SRL   4'b0110   
`define SRA   4'b0111
`define LUI   4'b1000  
`define SLT   4'b1001
`define SLTU  4'b1010


// 主运算组合逻辑
always @(*) begin
    case(ALUctrl)
        `AND: rslC = srcA & srcB;
        `OR:  rslC = srcA | srcB;
        `ADD: rslC = srcA + srcB;
        `SUB: rslC = srcA - srcB;
        `XOR: rslC = srcA ^ srcB;
        `SLL: rslC = srcA << srcB[4:0];
        `SRL: rslC = $unsigned(srcA) >> srcB[4:0];
        `SRA: rslC = srcA >>> srcB[4:0];
        `LUI: rslC = srcB;
        `SLT:   rslC = (srcA < srcB) ? 32'd1 : 32'd0;              
        `SLTU:  rslC = ($unsigned(srcA) < $unsigned(srcB)) ? 1 : 0; 
        default: rslC = 0;
    endcase
end

// 比较信号
assign zero = (srcA == srcB);
assign lt   = (srcA < srcB);                        
assign ltu  = ($unsigned(srcA) < $unsigned(srcB));  

endmodule
