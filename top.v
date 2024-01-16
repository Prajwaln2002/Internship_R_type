module top_module(instruction,clk,rst,data_out);
input [31:0]instruction;
input clk,rst;
output [31:0]data_out;

wire Radd_en_w,Rsub_en_w,Ror_en_w,Rxor_en_w,Rand_en_w,Rslt_en_w,Rsltu_en_w,Rsll_en_w,Rsrl_en_w,Rsra_en_w;
wire [4:0] rd_addr1,rd_addr2,wr_addr;
wire rd_en_w,wr_en_w;
wire [31:0] rd_data1_w,rd_data2_w;
wire [4:0]rs1_w,rs2_w,rd_w;
wire [31:0] data_out_w;

decoder u1(.instruction(instruction),.clock(clk),.Radd_en(Radd_en_w),.Rsub_en(Rsub_en_w),.Ror_en(Ror_en_w),
.Rxor_en(Rxor_en_w),.Rand_en(Rand_en_w),.Rslt_en(Rslt_en_w),.Rsltu_en(Rsltu_en_w),.Rsll_en(Rsll_en_w),.Rsrl_en(Rsrl_en_w),.Rsra_en(Rsra_en_w),.rs1(rs1_w),.rs2(rs2_w),.rd(rd_w)
,.rd_en(rd_en_w),.wr_en(wr_en_w));

memory u2(.clk(clk),.rst(rst),.rd_en(rd_en_w),.wr_en(wr_en_w),.rd_addr1(rs1_w),.rd_addr2(rs2_w),.wr_addr(rd_w),
.wr_data(data_out_w),.rd_data1(rd_data1_w),.rd_data2(rd_data2_w));

alu_module u3(.Radd_en(Radd_en_w),.Rsub_en(Rsub_en_w),.Ror_en(Ror_en_w),.Rxor_en(Rxor_en_w),.Rand_en(Rand_en_w),.Rslt_en(Rslt_en_w),.Rsltu_en(Rsltu_en_w),
.Rsll_en(Rsll_en_w),.Rsrl_en(Rsrl_en_w),.Rsra_en(Rsra_en_w),.read_data1(rd_data1_w),.read_data2(rd_data2_w),.top_out(data_out_w));

endmodule

