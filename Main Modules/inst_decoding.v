module inst_decoding(Instruction, opcode, rs, rt, rd, shamt, funct, immediate, address);

input [31:0] Instruction;
output reg [5:0] opcode, funct;
output reg [4:0] rs, rt, rd, shamt;
output reg [15:0] immediate;
output reg [25:0] address;


always @(*) begin
opcode = Instruction [31:26];
case(opcode)
6'h3: begin
//R
rs = Instruction [25:21];
rt = Instruction [20:16];
rd = Instruction [15:11];
shamt = Instruction [10:6];
funct = Instruction [5:0];
end
6'h7: begin
//J
address = Instruction [25:0];
end
6'h2: begin
//J
address = Instruction [25:0];
end
default: begin
//I
rs = Instruction [25:21];
rt = Instruction [20:16];
immediate = Instruction[15:0];
end
endcase
end
endmodule