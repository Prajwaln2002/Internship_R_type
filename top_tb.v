module top_module_tb;
reg [31:0]instruction;
reg clk,rst;
wire [31:0]data_out;

top_module u4(instruction,clk,rst,data_out);

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

initial
begin
instruction=0;
#10

// Radd_en;

    instruction = 32'b0000000_00100_00111_000_01001_0110011; 
    #10
    
    instruction = 32'b0000000_01010_00101_000_01101_0110011; 
    #10


    
    
    //  Rsub_en;
    instruction = 32'b0100000_01101_00101_000_10011_0110011; 
    #10
    
    instruction = 32'b0100000_01000_00001_000_11011_0110011; 
    #10

    //  Rand_en;
instruction = 32'b0000000_00100_00111_111_01001_0110011; 
    #10
    
    instruction = 32'b0000000_01010_00101_111_01101_0110011; 
    #10

    //  Ror_en;
instruction = 32'b0000000_00100_00111_110_01001_0110011; 
    #10
    
    instruction = 32'b0000000_01010_00101_110_01101_0110011; 
    #10

//  Rsll_en;
instruction = 32'b0000000_00100_00111_001_01001_0110011; 
    #10
    
    instruction = 32'b0000000_01010_00101_001_01101_0110011; 
    #10;

//  Rslt_en;
instruction = 32'b0000000_00100_00111_010_01001_0110011; 
    #10
    
    instruction = 32'b0000000_01010_00101_010_01101_0110011; 
    #10

//  Rsltu_en;
instruction = 32'b0000000_00100_00111_011_01001_0110011; 
    #10
    
    instruction = 32'b0000000_01010_00101_011_01101_0110011; 
    #10;

//  Rxor_en;
instruction = 32'b0000000_00100_00111_100_01001_0110011; 
    #10
    
    instruction = 32'b0000000_01010_00101_100_01101_0110011; 
    #10

//  Rsrl_en;
instruction = 32'b0000000_00100_00111_101_01001_0110011; 
    #10
    
    instruction = 32'b0000000_01010_00101_101_01101_0110011; 
    #10

// Rsra_en;
instruction = 32'b0100000_00100_00111_101_01001_0110011; 
    #10
    
    instruction = 32'b0100000_01010_00101_101_01101_0110011; 
    #10
    //Default case
    instruction = 32'h1234_5678; 
    
    #10 $finish;
end
endmodule
