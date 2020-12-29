module test_Top_pipeline(); 
	reg [31:0]PC_VALUE_;		  
	reg [31:0] cycle;
	Top_pipline top(PC_VALUE_);
	initial begin
		PC_VALUE_ <= 212;	  
		cycle <= 1;
	end				   
	always @(posedge top.clk) begin	
#51 /*$display("cycle: %d" , cycle);
$display("PC: %d",top.program_counter);
$display("PC_in %d" , top.IF_ID.PC_4_in, " The correct value is 104");
$display("instruction_in %h" , top.IF_ID.instruction_in, " The correct value is 48080000");
$display("PC_out %d" , top.PC_4_out, " The correct value is 104");
$display("instruction_out %h" , top.instruction_out, " The correct value is 48080000");*/
$display("++++++++++++++++++ cycle: %d ++++++++++++++++++" , cycle);
$display("PC: %d",top.program_counter);
$display("************ID-Decoding*************");
$display("opcode %h" , top.opcode);
$display("rs %d" , top.rs);
$display("rt %d" , top.rt);
$display("rd %d" , top.rd);
$display("shamt %d" , top.shamt);
$display("funct %d" , top.funct);
$display("immediate %d" , top.immediate);
$display("address %d" , top.address);
$display("************ID-ControlUnit*************");
$display("ALUop %b" , top.ALUop);
$display("RegWrite %b" , top.RegWrite);
$display("branch_inst %b" , top.branch_inst);
$display("RegDest %b" , top.RegDest);
$display("ALUsrc1 %b" , top.ALUsrc1);
$display("ALUsrc2 %b" , top.ALUsrc2);
$display("jump %b" , top.jump);
$display("zero %b" , top.zero);
$display("RegSrc %b" , top.RegSrc);
$display("word_byte %b" , top.word_byte);
$display("Mem_Write_Read %b" , top.Mem_Write_Read);
$display("reg_2_src %b" , top.reg_2_src);
$display("MemData %b" , top.MemData);
$display("************ID-RegFile*************");
$display("data_out1 %d" , top.data_out1);
$display("data_out2 %d" , top.data_out2);
$display("data_out3 %d" , top.data_out3);
$display("signExtImm %d" , top.signExtImm);
$display("************ID_EX out*************");
$display("OUT_ALUop %b" , top.OUT_ALUop);
$display("OUT_RegWrite %b" , top.OUT_RegWrite);
$display("OUT_branch_inst %b" , top.OUT_branch_inst);
$display("OUT_RegDest %b" , top.OUT_RegDest);
$display("OUT_ALUsrc1 %b" , top.OUT_ALUsrc1);
$display("OUT_ALUsrc2 %b" , top.OUT_ALUsrc2);
$display("OUT_jump %b" , top.OUT_jump);
$display("OUT_zero %b" , top.OUT_zero);
$display("OUT_RegSrc %b" , top.OUT_RegSrc);
$display("OUT_word_byte %b" , top.OUT_word_byte);
$display("OUT_Mem_Write_Read %b" , top.OUT_Mem_Write_Read);
$display("OUT_Read_reg_2 %b" , top.OUT_Read_reg_2);
$display("OUT_MemData %b" , top.OUT_MemData);
$display("OUT_data_read1 %d" , top.OUT_data_read1);
$display("OUT_data_read2 %d" , top.OUT_data_read2);
$display("OUT_data_read3 %d" , top.OUT_data_read3);
$display("OUT_signExtenImm %d" , top.OUT_signExtenImm);
$display("OUT_PC_out %d" , top.OUT_PC_out);
$display("OUT_rt %d" , top.OUT_rt);
$display("OUT_rd %d" , top.OUT_rd);
if (cycle == 4)
begin
$finish;
end
cycle = cycle + 1;
end
endmodule