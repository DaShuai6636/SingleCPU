`timescale 1ns / 1ps

module DM(
    input clk,
    input MemWrite,
    input [5:0] addr,
    input [31:0] WriteData,
    input [2:0] DMType,
    output reg [31:0] ReadOut
    );

    // 64 字节 DM
    reg [7:0] data [0:63];

    // DMType 定义
    `define dm_word               3'b010 
    `define dm_halfword           3'b001 
    `define dm_halfword_unsigned  3'b101 
    `define dm_byte               3'b000 
    `define dm_byte_unsigned      3'b100

    // 写逻辑
    always @(posedge clk) begin
        if(MemWrite) begin
            case (DMType)
                `dm_byte: begin
                    data[addr] <= WriteData[7:0];
                end

                `dm_halfword: begin
                    data[addr]   <= WriteData[7:0];
                    data[addr+1] <= WriteData[15:8];
                end

                `dm_word: begin
                    data[addr]   <= WriteData[7:0];
                    data[addr+1] <= WriteData[15:8];
                    data[addr+2] <= WriteData[23:16];
                    data[addr+3] <= WriteData[31:24];
                end
            endcase
        end
    end

    // 读逻辑
    always @(*) begin
        case (DMType)

            `dm_byte: begin
                ReadOut = {{24{data[addr][7]}}, data[addr]};
            end

            `dm_byte_unsigned: begin
                ReadOut = {24'b0, data[addr]};
            end

            `dm_halfword: begin
                ReadOut = {{16{data[addr+1][7]}}, data[addr+1], data[addr]};
            end

            `dm_halfword_unsigned: begin
                ReadOut = {16'b0, data[addr+1], data[addr]};
            end

            `dm_word: begin
                ReadOut = {data[addr+3], data[addr+2], data[addr+1], data[addr]};
            end

            default: ReadOut = 32'b0;
        endcase
    end

endmodule
