module decoder_tb;

  reg [31:0] instruction;
  reg clock; 
  reg reset;
  wire Radd_en, Rsub_en;
  wire Rand_en,Ror_en;
  wire Rsll_en,Rslt_en,Rsltu_en,Rxor_en,Rsrl_en,Rsra_en;
  wire [4:0] rs1, rs2, rd;
  wire rd_en, wr_en;
 

decoder dut(
    .instruction(instruction),
    .Radd_en(Radd_en),
    .Rsub_en(Rsub_en),
    .Rand_en(Rand_en),
    .Ror_en(Ror_en),
    .Rsll_en(Rsll_en),
    .Rslt_en(Rslt_en),
    .Rsltu_en(Rsltu_en),
    .Rxor_en(Rxor_en),
    .Rsrl_en(Rsrl_en),
    .Rsra_en(Rsra_en),
    .rs1(rs1),
    .rs2(rs2),
    .rd(rd),
    .rd_en(rd_en),
    .wr_en(wr_en)
  );


initial 
begin
$shm_open("wave.shm");
$shm_probe("ACTMF");
end

  
  initial begin
    forever #5 clock = ~clock;
  end

  // Initial block
  initial begin
  clock = 0;
  reset = 1;
 
 
  instruction = 32'h0000_0000; // Initial instruction value
 
    // Apply reset
   
    #10 reset = 0;

    // Test case 1: Radd_en;

    instruction = 32'b0000000_00100_00111_000_01001_0110011; 
    #10;
    
    instruction = 32'b0000000_01010_00101_000_01101_0110011; 
    #10;


    #10;
    
    // Test case 2: Rsub_en;
    instruction = 32'b0100000_01101_00101_000_10011_0110011; 
    #10;
    
    instruction = 32'b0100000_01000_00001_000_11011_0110011; 
    #10

    // Test case 3: Rand_en;
instruction = 32'b0000000_00100_00111_111_01001_0110011; 
    #10;
    
    instruction = 32'b0000000_01010_00101_111_01101_0110011; 
    #10;

    // Test case 4: Ror_en;
instruction = 32'b0000000_00100_00111_110_01001_0110011; 
    #10;
    
    instruction = 32'b0000000_01010_00101_110_01101_0110011; 
    #10;

// Test case 5: Rsll_en;
instruction = 32'b0000000_00100_00111_001_01001_0110011; 
    #10;
    
    instruction = 32'b0000000_01010_00101_001_01101_0110011; 
    #10;

// Test case 6: Rslt_en;
instruction = 32'b0000000_00100_00111_010_01001_0110011; 
    #10;
    
    instruction = 32'b0000000_01010_00101_010_01101_0110011; 
    #10;

// Test case 7: Rsltu_en;
instruction = 32'b0000000_00100_00111_011_01001_0110011; 
    #10;
    
    instruction = 32'b0000000_01010_00101_011_01101_0110011; 
    #10;

// Test case 8: Rxor_en;
instruction = 32'b0000000_00100_00111_100_01001_0110011; 
    #10;
    
    instruction = 32'b0000000_01010_00101_100_01101_0110011; 
    #10;

// Test case 9: Rsrl_en;
instruction = 32'b0000000_00100_00111_101_01001_0110011; 
    #10;
    
    instruction = 32'b0000000_01010_00101_101_01101_0110011; 
    #10;

// Test case 10: Rsra_en;
instruction = 32'b0100000_00100_00111_101_01001_0110011; 
    #10;
    
    instruction = 32'b0100000_01010_00101_101_01101_0110011; 
    #10;
    // Test case 11: Default case
    instruction = 32'h1234_5678; // default
    #10;

 

    // End simulation
    #1000 $finish;
  end
endmodule
