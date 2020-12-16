/*
stage1 : instruction fetch (IF)
stage2 : instruction decode and register fetch (ID)
stage3 : execuction stage (EXEC)
stage4 : memory stage (MEM)
stage5 : writeback stage (WB)
*/

//module Top(PC_VALUE);// testbench holds the PC Value.
module Top(PC, result);
input [31:0] PC;
wire [31:0] instruction; //opcode & func/ EnableWrite & read write regs
output reg [31:0] result;
reg EnableWrite;
reg [4:0] read_reg1, read_reg2, write_reg;
reg [31:0] write_data;
wire [31:0] data_out1, data_out2;
wire [4:0] rs, rt, rd;
wire [4:0] shamt;
wire [31:0] alu_result;
wire [5:0] opcode, funct;
wire [15:0] immediate;
wire [25:0] address;
wire clk;
clock c1(clk);
instructionMemory i1(instruction, PC);
inst_decoding i2(clk,instruction, opcode, rs, rt, rd, shamt, funct, immediate, address);
always@(posedge clk) begin
read_reg1<= rs; read_reg2<=rt; EnableWrite<=1'b0; write_reg <= rd; write_data<= 32'd0;
#1 read_reg1<=rs; read_reg2<=rt; EnableWrite<=1'b1; write_reg <= rd; write_data<= alu_result;
#1 read_reg1<= rd; read_reg2<=5'd0; EnableWrite<=1'b0; write_reg <= 5'd0; write_data<= 32'd0;
#1 result = data_out1;
end
RegisterFile main_reg_file(EnableWrite,read_reg1, read_reg2, write_reg, write_data,data_out1, data_out2);
ALU main_ALU(instruction,data_out1,data_out2,alu_result);
endmodule 