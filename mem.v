module memory(
input clk,
input rst,
input wr_en,
input [4:0]wr_addr,
input [31:0]wr_data,

input rd_en, 
input [4:0]rd_addr1,
input [4:0]rd_addr2,
output reg [31:0]rd_data1,
output reg [31:0]rd_data2
);

reg [31:0]mem[0:31];

initial
begin
$readmemh("mem.hex",mem);
end

always@(posedge clk)
begin
if(rst)
begin
rd_data1<=0;
rd_data2<=0;
end

else
  begin
  if(wr_en)
    

     mem[wr_addr]<=wr_data;
     
  else
    mem[wr_addr]<=0;
   end
end

always@(posedge clk)
    begin
  if(rst)
begin
rd_data1<=0;
rd_data2<=0;
end
    else
    begin 
      if (rd_en)
      begin
        rd_data1<=mem[rd_addr1];
        rd_data2<=mem[rd_addr2];
      end
      else
        begin
        rd_data1<=0;
        rd_data2<=0;
        end
 end
end

endmodule

