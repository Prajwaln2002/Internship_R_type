module decoder(
  input [31:0]instruction ,
  input clock,
  
  output reg Radd_en  ,
  output reg Rsub_en   ,
  output reg Rand_en,
  output reg Ror_en,
  output reg Rsll_en,
  output reg Rslt_en,
  output reg Rsltu_en,
  output reg Rxor_en,
  output reg Rsrl_en,
  output reg Rsra_en,
 
  output reg [4:0]rs1  ,
  output reg [4:0]rs2  ,
  output reg [4:0]rd   ,

  output reg rd_en     ,
  output reg wr_en     

);


	wire [6:0]opcode ;
	wire [6:0]func7 ;                        
	wire [2:0]func3 ;

assign opcode = instruction[6:0];
assign func7 = instruction [31:25];
assign func3 = instruction [14:12];


always@(opcode ,func7, func3)
begin
case(opcode)
7'b0110011:
	if(func7==7'b0000000 && func3==3'b000)
		begin
				Radd_en  = 1'b1;
   				Rsub_en  = 1'b0;
                                Rand_en  = 1'b0;
				Ror_en   = 1'b0; 
   				Rsll_en  = 1'b0;
				Rslt_en  = 1'b0;
				Rsltu_en = 1'b0;
				Rxor_en = 1'b0;
 				Rsrl_en = 1'b0;
				Rsra_en = 1'b0;
				rs1 = instruction[19:15];
				rs2= instruction[24:20];
				rd = instruction[11:7];
				rd_en     = 1'b1; 
				wr_en  = 1'b1;

		end

	 else if(func7==7'b0100000 && func3==3'b000)
		begin
				Radd_en  = 1'b0;
   				Rsub_en  = 1'b1;
                                Rand_en  = 1'b0;
				Ror_en   = 1'b0;
				Rsll_en  = 1'b0;
				Rslt_en  = 1'b0;
				Rsltu_en = 1'b0;
				Rxor_en = 1'b0;
 				Rsrl_en = 1'b0;
				Rsra_en = 1'b0;
   				rs1 = instruction[19:15];
				rs2= instruction[24:20];
				rd = instruction[11:7];
  				
				rd_en     = 1'b1; 
				wr_en =  1'b1;
		end
        else if(func7==7'b0000000 && func3==3'b111)
		begin
				Radd_en  = 1'b0;
   				Rsub_en  = 1'b0;
                                Rand_en  = 1'b1;
				Ror_en   = 1'b0; 
   				Rsll_en  = 1'b0;
				Rslt_en  = 1'b0;
				Rsltu_en = 1'b0;
				Rxor_en = 1'b0;
 				Rsrl_en = 1'b0;
				Rsra_en = 1'b0;
				rs1 = instruction[19:15];
				rs2= instruction[24:20];
				rd = instruction[11:7];
				rd_en     = 1'b1; 
				wr_en  = 1'b1;

		end
        else if(func7==7'b0000000 && func3==3'b110)
		begin
				Radd_en  = 1'b0;
   				Rsub_en  = 1'b0;
                                Rand_en  = 1'b0;
				Ror_en   = 1'b1; 
   				Rsll_en  = 1'b0;
				Rslt_en  = 1'b0;
				Rsltu_en = 1'b0;
				Rxor_en = 1'b0;
 				Rsrl_en = 1'b0;
				Rsra_en = 1'b0;
				rs1 = instruction[19:15];
				rs2= instruction[24:20];
				rd = instruction[11:7];
				rd_en     = 1'b1; 
				wr_en  = 1'b1;

		end
      else if(func7==7'b0000000 && func3==3'b001)
		begin
				Radd_en  = 1'b0;
   				Rsub_en  = 1'b0;
                                Rand_en  = 1'b0;
				Ror_en   = 1'b0; 
   				Rsll_en  = 1'b1;
				Rslt_en  = 1'b0;
				Rsltu_en = 1'b0;
				Rxor_en = 1'b0;
 				Rsrl_en = 1'b0;
				Rsra_en = 1'b0;
				rs1 = instruction[19:15];
				rs2= instruction[24:20];
				rd = instruction[11:7];
				rd_en     = 1'b1; 
				wr_en  = 1'b1;
               end
      else if(func7==7'b0000000 && func3==3'b010)
		begin
				Radd_en  = 1'b0;
   				Rsub_en  = 1'b0;
                                Rand_en  = 1'b0;
				Ror_en   = 1'b0; 
   				Rsll_en  = 1'b0;
				Rslt_en  = 1'b1;
				Rsltu_en = 1'b0;
				Rxor_en = 1'b0;
 				Rsrl_en = 1'b0;
				Rsra_en = 1'b0;
				rs1 = instruction[19:15];
				rs2= instruction[24:20];
				rd = instruction[11:7];
				rd_en     = 1'b1; 
				wr_en  = 1'b1;
         end
   else if(func7==7'b0000000 && func3==3'b011)
		begin
				Radd_en  = 1'b0;
   				Rsub_en  = 1'b0;
                                Rand_en  = 1'b0;
				Ror_en   = 1'b0; 
   				Rsll_en  = 1'b0;
				Rslt_en  = 1'b0;
				Rsltu_en = 1'b1;
				Rxor_en = 1'b0;
 				Rsrl_en = 1'b0;
				Rsra_en = 1'b0;
				rs1 = instruction[19:15];
				rs2= instruction[24:20];
				rd = instruction[11:7];
				rd_en     = 1'b1; 
				wr_en  = 1'b1;
          end
    else if(func7==7'b0000000 && func3==3'b100)
		begin
				Radd_en  = 1'b0;
   				Rsub_en  = 1'b0;
                                Rand_en  = 1'b0;
				Ror_en   = 1'b0; 
   				Rsll_en  = 1'b0;
				Rslt_en  = 1'b0;
				Rsltu_en = 1'b0;
				Rxor_en = 1'b1;
 				Rsrl_en = 1'b0;
				Rsra_en = 1'b0;
				rs1 = instruction[19:15];
				rs2= instruction[24:20];
				rd = instruction[11:7];
				rd_en     = 1'b1; 
				wr_en  = 1'b1;
          end
    else if(func7==7'b0000000 && func3==3'b101)
		begin
				Radd_en  = 1'b0;
   				Rsub_en  = 1'b0;
                                Rand_en  = 1'b0;
				Ror_en   = 1'b0; 
   				Rsll_en  = 1'b0;
				Rslt_en  = 1'b0;
				Rsltu_en = 1'b0;
				Rxor_en = 1'b0;
 				Rsrl_en = 1'b1;
				Rsra_en = 1'b0;
				rs1 = instruction[19:15];
				rs2= instruction[24:20];
				rd = instruction[11:7];
				rd_en     = 1'b1; 
				wr_en  = 1'b1;
                 end
     else if(func7==7'b0100000 && func3==3'b101)
		begin
				Radd_en  = 1'b0;
   				Rsub_en  = 1'b0;
                                Rand_en  = 1'b0;
				Ror_en   = 1'b0; 
   				Rsll_en  = 1'b0;
				Rslt_en  = 1'b0;
				Rsltu_en = 1'b0;
				Rxor_en = 1'b0;
 				Rsrl_en = 1'b0;
				Rsra_en = 1'b1;
				rs1 = instruction[19:15];
				rs2= instruction[24:20];
				rd = instruction[11:7];
				rd_en     = 1'b1; 
				wr_en  = 1'b1;
              end
        else 
		begin
				Radd_en  = 1'b0;
   				Rsub_en  = 1'b0; 
  				Rand_en  = 1'b0;
				Ror_en   = 1'b0;
				Rsll_en  = 1'b0;
				Rslt_en  = 1'b0;
				Rsltu_en = 1'b0;
				Rxor_en = 1'b0;
 				Rsrl_en = 1'b0;
				Rsra_en = 1'b0; 
				rd_en    = 1'b0; 
				wr_en    =  1'b0;
         end

			default:
				begin
				
		
				Radd_en  = 1'b0;
				
   				Rsub_en  = 1'b0; 
   				Rand_en  = 1'b0;
				Ror_en   = 1'b0; 
  				Rsll_en  = 1'b0;
				Rslt_en  = 1'b0;
				Rsltu_en = 1'b0;
				Rxor_en = 1'b0;
 				Rsrl_en = 1'b0;
				Rsra_en = 1'b0;
				rd_en     = 1'b0; 
				wr_en =  1'b0;
				end
			endcase
		end
endmodule
