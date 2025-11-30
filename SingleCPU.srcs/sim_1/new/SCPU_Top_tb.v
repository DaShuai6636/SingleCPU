`timescale 1ns/1ps

module SCPU_Top_tb();

    reg clk;
    reg rstn;
    reg [15:0] sw_i;

    wire [7:0] disp_an_o;
    wire [7:0] disp_seg_o;

    // 实例化 CPU 顶层
    SCPU_Top uut(
        .clk(clk),
        .rstn(rstn),
        .sw_i(sw_i),
        .disp_an_o(disp_an_o),
        .disp_seg_o(disp_seg_o)
    );

    // 时钟
    initial begin
        clk = 0;
        forever #5 clk = ~clk;   // 100MHz 仿真
    end

    // 仿真控制
    initial begin
        $display("================= RISC-V CPU SIM START =================");

        sw_i = 16'h8000; // sw[15] = 1 => 使用自动时钟 cpu_clk = clk_div[27]
        rstn = 0;

        // 上电复位
        #100;
        rstn = 1;

        // 运行足够周期
        repeat(2000) begin
            @(posedge clk);

            // 打印关键信号
            $display("PC=%h  instr=%h  ALU_A=%h  ALU_B=%h  ALU_result=%h  zero=%b lt=%b ltu=%b",
                     uut.PC,
                     uut.instr,
                     uut.ALU_A,
                     uut.ALU_B,
                     uut.ALU_result,
                     uut.zero,
                     uut.lt,
                     uut.ltu
            );

            // 打印寄存器堆（前 10 个）
            $display("x1=%h x2=%h x3=%h x4=%h x5=%h x6=%h x7=%h x8=%h x9=%h x10=%h",
                uut.U_RF.rf[1], uut.U_RF.rf[2], uut.U_RF.rf[3],
                uut.U_RF.rf[4], uut.U_RF.rf[5], uut.U_RF.rf[6],
                uut.U_RF.rf[7], uut.U_RF.rf[8], uut.U_RF.rf[9],
                uut.U_RF.rf[10]
            );

            // 打印数据内存前 8 字
            $display("DM[0]=%h DM[1]=%h DM[2]=%h DM[3]=%h",
                uut.U_DM.mem[0],
                uut.U_DM.mem[1],
                uut.U_DM.mem[2],
                uut.U_DM.mem[3]
            );

            $display("-------------------------------------------------------");
        end

        $display("================= SIM END =================");
        $stop;
    end

endmodule
