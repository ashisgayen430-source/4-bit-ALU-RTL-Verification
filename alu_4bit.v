`timescale 1ns/1ps
module alu_4bit (
    input wire [3:0] A,
    input wire [3:0] B,
    input wire [2:0] opcode,
    output reg [3:0] result,
    output reg carry_out
);
    always @(*) begin
        result = 4'b0000;
        carry_out = 1'b0;
        case (opcode)
            3'b000: {carry_out, result} = {1'b0, A} + {1'b0, B};
            3'b001: result = A - B;
            3'b010: result = A & B;
            3'b011: result = A | B;
            3'b100: result = A ^ B;
            3'b101: result = ~A;
            3'b110: result = A << 1;
            3'b111: result = A >> 1;
            default: begin
                result = 4'b0000;
                carry_out = 1'b0;
            end
        endcase
    end
endmodule
