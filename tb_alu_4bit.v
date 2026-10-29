`timescale 1ns/1ps
module tb_alu_4bit;
    reg [3:0] A, B;
    reg [2:0] opcode;
    wire [3:0] result;
    wire carry_out;
    integer errors;

    alu_4bit dut (
        .A(A), .B(B), .opcode(opcode),
        .result(result), .carry_out(carry_out)
    );

    task check_result;
        input [3:0] expected_result;
        input expected_carry;
        input [255:0] test_name;
        begin
            #10;
            if (result !== expected_result || carry_out !== expected_carry) begin
                $display("FAIL: %0s | A=%h B=%h opcode=%b result=%h carry=%b expected_result=%h expected_carry=%b",
                    test_name, A, B, opcode, result, carry_out, expected_result, expected_carry);
                errors = errors + 1;
            end else begin
                $display("PASS: %0s", test_name);
            end
        end
    endtask

    initial begin
        errors = 0;
        A=9; B=7; opcode=3'b000; check_result(0, 1'b1, "addition with carry");
        A=9; B=3; opcode=3'b000; check_result(12, 1'b0, "addition without carry");
        A=9; B=3; opcode=3'b001; check_result(6, 1'b0, "subtraction");
        A=4'b1100; B=4'b1010; opcode=3'b010; check_result(4'b1000, 0, "AND");
        A=4'b1100; B=4'b1010; opcode=3'b011; check_result(4'b1110, 0, "OR");
        A=4'b1100; B=4'b1010; opcode=3'b100; check_result(4'b0110, 0, "XOR");
        A=4'b0101; B=0; opcode=3'b101; check_result(4'b1010, 0, "NOT A");
        A=4'b0011; B=0; opcode=3'b110; check_result(4'b0110, 0, "left shift");
        A=4'b1000; B=0; opcode=3'b111; check_result(4'b0100, 0, "right shift");

        if (errors == 0) $display("ALL TESTS PASSED");
        else $display("TESTS FAILED: %0d error(s)", errors);
        $finish;
    end
endmodule
