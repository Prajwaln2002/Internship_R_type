module alu_module(Radd_en,Rsub_en,Ror_en,Rxor_en,Rand_en,Rslt_en,Rsltu_en,Rsll_en,Rsrl_en,Rsra_en,read_data1,read_data2,top_out);

input wire Radd_en,Rsub_en,Ror_en,Rxor_en,Rand_en,Rslt_en,Rsltu_en,Rsll_en,Rsrl_en,Rsra_en;
input wire [31:0] read_data1,read_data2;
output reg [31:0] top_out;

wire [31:0] adddata_out,subdata_out,ordata_out,xordata_out,anddata_out,sltdata_out,sltudata_out,slldata_out,srldata_out,sradata_out;

alu_add u1(.read_data1(read_data1),.read_data2(read_data2),.adddata_out(adddata_out),.Radd_en(Radd_en));
alu_sub u2(.read_data1(read_data1),.read_data2(read_data2),.subdata_out(subdata_out),.Rsub_en(Rsub_en));
alu_or u3(.read_data1(read_data1),.read_data2(read_data2),.ordata_out(ordata_out),.Ror_en(Ror_en));
alu_xor u4(.read_data1(read_data1),.read_data2(read_data2),.xordata_out(xordata_out),.Rxor_en(Rxor_en));
alu_and u5(.read_data1(read_data1),.read_data2(read_data2),.anddata_out(anddata_out),.Rand_en(Rand_en));
alu_slt u6(.read_data1(read_data1),.read_data2(read_data2),.sltdata_out(sltdata_out),.Rslt_en(Rslt_en));
alu_sltu u7(.read_data1(read_data1),.read_data2(read_data2),.sltudata_out(sltudata_out),.Rsltu_en(Rsltu_en));
alu_sll u8(.read_data1(read_data1),.read_data2(read_data2),.slldata_out(slldata_out),.Rsll_en(Rsll_en));
alu_srl u9(.read_data1(read_data1),.read_data2(read_data2),.srldata_out(srldata_out),.Rsrl_en(Rsrl_en));
alu_sra u10(.read_data1(read_data1),.read_data2(read_data2),.sradata_out(sradata_out),.Rsra_en(Rsra_en));

always@(*)
begin
case({Radd_en,Rsub_en,Ror_en,Rxor_en,Rand_en,Rslt_en,Rsltu_en,Rsll_en,Rsrl_en,Rsra_en})

10'b1000000000 : top_out<=adddata_out;
10'b0100000000 : top_out<=subdata_out;
10'b0010000000 : top_out<=ordata_out;
10'b0001000000 : top_out<=xordata_out;
10'b0000100000 : top_out<=anddata_out;
10'b0000010000 : top_out<=sltdata_out;
10'b0000001000 : top_out<=sltudata_out;
10'b0000000100 : top_out<=slldata_out;
10'b0000000010 : top_out<=srldata_out;
10'b0000000001 : top_out<=sradata_out;
default : top_out<=0;
endcase
end
endmodule

//add
module alu_add(
input [31:0]read_data1,
input [31:0]read_data2,
output [31:0] adddata_out,
input Radd_en
);

assign adddata_out=Radd_en?(read_data1 + read_data2):0;
endmodule


//sub
module alu_sub(
input [31:0]read_data1,
input [31:0]read_data2,
output [31:0] subdata_out,

input Rsub_en
);

assign subdata_out=Rsub_en?((read_data1 > read_data2)?(read_data1-read_data2):(read_data2-read_data1)):0;
endmodule


//or
module alu_or(
input [31:0]read_data1,
input [31:0]read_data2,
output [31:0] ordata_out,

input Ror_en
);

assign ordata_out=Ror_en?(read_data1 | read_data2):0;
endmodule


//xor
module alu_xor(
input [31:0]read_data1,
input [31:0]read_data2,
output [31:0] xordata_out,

input Rxor_en
);

assign xordata_out=Rxor_en?(read_data1^read_data2):0;
endmodule

//and
module alu_and(
input [31:0]read_data1,
input [31:0]read_data2,
output reg [31:0] anddata_out,

input Rand_en
);

always@(*)
begin
if(Rand_en)
anddata_out<=(read_data1) & (read_data2);
else
anddata_out<=0;
end
endmodule

//slt
module alu_slt(
input [31:0]read_data1,
input [31:0]read_data2,
output reg [31:0] sltdata_out,

input Rslt_en
);

always@(*)
begin
case(Rslt_en)
1'b1:
begin
if(read_data1[31]==0 && read_data2[31]==0)
   begin
   if(read_data1<read_data2)
        sltdata_out<=1;
   else if(read_data1>read_data2)
	sltdata_out<=0;
   else
	sltdata_out<=32'bx;
   end
else if(read_data1[31]==0 && read_data2[31]==1)
        sltdata_out<=0;
else if(read_data1[31]==1 && read_data2[31]==0)
	sltdata_out<=1;
else if(read_data1[31]==1 && read_data2[31]==1)
   begin
   if(read_data1<read_data2)
        sltdata_out<=0;
   else if(read_data1>read_data2)
	sltdata_out<=1;
   else
	sltdata_out<=32'bx;
   end
else
	sltdata_out<=1'bx;
end
endcase
end
endmodule

//sll.........................................
module alu_sll(
input [31:0]read_data1,
input [31:0]read_data2,
output [31:0] slldata_out,

input Rsll_en
);

assign slldata_out=Rsll_en?(read_data1 << read_data2):0;
endmodule

//sltu..........................................
module alu_sltu(
input [31:0]read_data1,
input [31:0]read_data2,
output reg [31:0] sltudata_out,

input Rsltu_en
);

always@(*)
begin
case(Rsltu_en)
1'b1:
  if(read_data1[31]==0 && read_data2[31]==0)
      begin
         if(read_data1>read_data2)	
	  sltudata_out<=1;
         else
	  sltudata_out<=0;
      end
  else
     sltudata_out<=0;

  default:
     sltudata_out<=0;

endcase
end
endmodule

//sra.......................................................
module alu_sra(
input [31:0]read_data1,
input [31:0]read_data2,
output [31:0] sradata_out,

input Rsra_en
);

assign sradata_out=Rsra_en?(read_data1 >>> read_data2):0;
endmodule

//srl......................................................
module alu_srl(
input [31:0]read_data1,
input [31:0]read_data2,
output [31:0] srldata_out,

input Rsrl_en
);

assign srldata_out=Rsrl_en?(read_data1 >> read_data2):0;
endmodule
