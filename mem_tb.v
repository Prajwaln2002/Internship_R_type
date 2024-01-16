module memory_tb;
reg clk;
reg rst;
reg wr_en;
reg [4:0]wr_addr;
reg [31:0]wr_data;

reg rd_en;
reg [4:0] rd_addr1,rd_addr2;
wire [31:0]rd_data1,rd_data2;

memory uut(.clk(clk),.rst(rst),
.wr_en(wr_en),.wr_addr(wr_addr),.wr_data(wr_data),
.rd_en(rd_en),.rd_addr1(rd_addr1),.rd_addr2(rd_addr2),.rd_data1(rd_data1),.rd_data2(rd_data2));
initial 
begin
$shm_open("wave.shm");
$shm_probe("ACTMF");
end


initial
begin 
clk=0;
rst =1;
#10 rst=0;
end

initial
begin 
forever #5 clk=~clk;
end

initial begin
wr_en=1;
rd_en=0;
wr_addr=8;
wr_data=1122;
#10

wr_en=1;
rd_en=0;
wr_addr=2;
wr_data=3344;
#10

rd_en=1;
wr_en=0;
rd_addr1=8;
rd_addr2=2;
#10

rd_en=1;
wr_en=0;
rd_addr2=2;
rd_addr1=5;

#40 $finish;
end
endmodule
