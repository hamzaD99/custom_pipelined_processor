module MEM_WB_Reg(clk,
//inputs
mem_wb_in_RegSrc,mem_wb_in_RegWrite,mem_wb_in_ALUOut_EXEC,mem_wb_in_write_reg_dest,mem_wb_in_Mem_dataOut,mem_wb_in_immediate,
//outputs
mem_wb_out_RegSrc,mem_wb_out_RegWrite,mem_wb_out_ALUOut_EXEC,mem_wb_out_write_reg_dest,mem_wb_out_Mem_dataOut,mem_wb_out_immediate
);
input clk;
input [1:0] mem_wb_in_RegSrc;
input mem_wb_in_RegWrite;
input [31:0] mem_wb_in_ALUOut_EXEC,mem_wb_in_Mem_dataOut;
input [4:0] mem_wb_in_write_reg_dest;
input [15:0] mem_wb_in_immediate;

output reg [1:0] mem_wb_out_RegSrc;
output reg mem_wb_out_RegWrite;
output reg [31:0] mem_wb_out_ALUOut_EXEC,mem_wb_out_Mem_dataOut;
output reg [4:0] mem_wb_out_write_reg_dest;
output reg [15:0] mem_wb_out_immediate;

reg [1:0] mem_wb_temp_RegSrc;
reg mem_wb_temp_RegWrite;
reg [31:0] mem_wb_temp_ALUOut_EXEC,mem_wb_temp_Mem_dataOut;
reg [4:0] mem_wb_temp_write_reg_dest;
reg [15:0] mem_wb_temp_immediate;
always @(posedge clk) begin
mem_wb_out_RegSrc <= mem_wb_temp_RegSrc;
mem_wb_out_RegWrite <= mem_wb_temp_RegWrite;
mem_wb_out_ALUOut_EXEC <= mem_wb_temp_ALUOut_EXEC;
mem_wb_out_write_reg_dest <= mem_wb_temp_write_reg_dest;
mem_wb_out_Mem_dataOut <= mem_wb_temp_Mem_dataOut;
mem_wb_out_immediate <= mem_wb_temp_immediate;
end

always @(negedge clk) begin
#1 mem_wb_temp_RegSrc <= mem_wb_in_RegSrc;
mem_wb_temp_RegWrite <= mem_wb_in_RegWrite;
mem_wb_temp_ALUOut_EXEC <= mem_wb_in_ALUOut_EXEC;
mem_wb_temp_write_reg_dest <= mem_wb_in_write_reg_dest;
mem_wb_temp_Mem_dataOut <= mem_wb_in_Mem_dataOut;
mem_wb_temp_immediate <= mem_wb_in_immediate;
end
endmodule