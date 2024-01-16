module alu_tb;
reg [31:0] read_data1,read_data2;
reg Radd_en,Rsub_en,Ror_en,Rxor_en,Rand_en,Rslt_en,Rsltu_en,Rsll_en,Rsrl_en,Rsra_en;
wire [31:0] alu_out;


alu_module uut(Radd_en,Rsub_en,Ror_en,Rxor_en,Rand_en,Rslt_en,Rsltu_en,Rsll_en,Rsrl_en,Rsra_en,read_data1,read_data2,alu_out);
initial 
begin
$shm_open("wave.shm");
$shm_probe("ACTMF");
end

initial
begin
Radd_en=0;
Rsub_en=0;Ror_en=0;Rxor_en=0;Rand_en=0;Rslt_en=0;Rsltu_en=0;Rsll_en=0;Rsrl_en=0;Rsra_en=0;
read_data1=9;
read_data2=3;
end

initial
begin 

#10
Radd_en=1;
Rsub_en=0;Ror_en=0;Rxor_en=0;Rand_en=0;Rslt_en=0;Rsltu_en=0;Rsll_en=0;Rsrl_en=0;Rsra_en=0;

#10
Radd_en=0;
Rsub_en=1;Ror_en=0;Rxor_en=0;Rand_en=0;Rslt_en=0;Rsltu_en=0;Rsll_en=0;Rsrl_en=0;Rsra_en=0;

#10
Radd_en=0;
Rsub_en=0;Ror_en=1;Rxor_en=0;Rand_en=0;Rslt_en=0;Rsltu_en=0;Rsll_en=0;Rsrl_en=0;Rsra_en=0;

#10
Radd_en=0;
Rsub_en=0;Ror_en=0;Rxor_en=1;Rand_en=0;Rslt_en=0;Rsltu_en=0;Rsll_en=0;Rsrl_en=0;Rsra_en=0;

#10
Radd_en=0;
Rsub_en=0;Ror_en=0;Rxor_en=0;Rand_en=1;Rslt_en=0;Rsltu_en=0;Rsll_en=0;Rsrl_en=0;Rsra_en=0;

#10
Radd_en=0;
Rsub_en=0;Ror_en=0;Rxor_en=0;Rand_en=0;Rslt_en=1;Rsltu_en=0;Rsll_en=0;Rsrl_en=0;Rsra_en=0;

#10
Radd_en=0;
Rsub_en=0;Ror_en=0;Rxor_en=0;Rand_en=0;Rslt_en=0;Rsltu_en=1;Rsll_en=0;Rsrl_en=0;Rsra_en=0;

#10
Radd_en=0;
Rsub_en=0;Ror_en=0;Rxor_en=0;Rand_en=0;Rslt_en=0;Rsltu_en=0;Rsll_en=1;Rsrl_en=0;Rsra_en=0;

#10
Radd_en=0;
Rsub_en=0;Ror_en=0;Rxor_en=0;Rand_en=0;Rslt_en=0;Rsltu_en=0;Rsll_en=0;Rsrl_en=1;Rsra_en=0;

#10
Radd_en=0;
Rsub_en=0;Ror_en=0;Rxor_en=0;Rand_en=0;Rslt_en=0;Rsltu_en=0;Rsll_en=0;Rsrl_en=0;Rsra_en=1;

#10
Radd_en=0;
Rsub_en=0;Ror_en=0;Rxor_en=0;Rand_en=0;Rslt_en=0;Rsltu_en=0;Rsll_en=0;Rsrl_en=0;Rsra_en=0;

#200 $finish;
end
endmodule
