module alu( A,  B, aluOp, Result, Zero);
input [31:0] A,B;
input [3:0] aluOp;
output reg Zero;
output reg [31:0] Result;
//Case para cada caso del ALU

wire [31:0]result_logic, result_arithmetic;

arithmetic AritmeticalPart( A,  B, aluOp, result_arithmetic);
logical LogicalPart( A,  B, aluOp, result_logic);
always @(*)
    begin
        
        case (aluOp[2])
            1'b1: Result = result_logic; 
            1'b0: Result = result_arithmetic; 
        endcase
    if (Result == 32'b0)
	Zero = 1'b1;
    else
	Zero = 1'b0;
    end

endmodule
