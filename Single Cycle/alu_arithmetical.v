module arithmetic( A,  B, aluOp, Result);
input [31:0] A,B;
input [3:0] aluOp;
output reg [31:0] Result;
//Case para cada caso del ALU
always @(*)
    begin
        case(aluOp)
 	// Add
        4'b0000:
           Result = A + B ; 
 	// Sub	
        4'b0010:
           Result = A - B ;
	//Slt
        4'b1010:
           Result = (A<B)?32'd1:32'd0;
          default: Result = A + B ; 
        endcase
    end
endmodule
