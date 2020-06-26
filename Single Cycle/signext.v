
module signext(input   [15:0] a, input alusrc, input [3:0]instr,
               output reg [31:0] y);
              
  always @(*) begin
    if (alusrc == 1'b1 & instr == 4'b0101)
        y = {{16{1'b0}}, a};
   else 
        y = {{16{a[15]}}, a};
  end
endmodule