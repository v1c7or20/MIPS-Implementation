module logical( A,  B, aluOp, Result);
input [31:0] A,B;
input [3:0] aluOp;
output reg [31:0] Result;
//Case para cada caso del ALU
always @(*)
    begin
        case(aluOp)
 	//And 
        4'b0100:
           Result = A & B;
	//Or
        4'b0101:
           Result = A | B;
	//Xor
        4'b0110:
           Result = A ^ B;
   //Nor
        4'b0111:
           Result = ~ (A | B);
        endcase

    end
endmodule
