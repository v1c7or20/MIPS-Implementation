module aludec(input  [5:0] funct,
              input  [1:0] aluop,
              output reg [3:0] alucontrol);

  always @ (*) begin
    case(aluop)
      2'b00: alucontrol <= 4'b0000;  // add
      2'b01: alucontrol <= 4'b0010;  // sub
      default: case(funct)          // RTYPE
          6'b100000: alucontrol <= 4'b0000; // ADD
          6'b100010: alucontrol <= 4'b0010; // SUB
          6'b100100: alucontrol <= 4'b0100; // AND
          6'b100101: alucontrol <= 4'b0101; // OR
          6'b100110: alucontrol <= 4'b0110; // XOR
          6'b100111: alucontrol <= 4'b0111; // NOR
          6'b101010: alucontrol <= 4'b1010; // SLT
          default:   alucontrol <= 4'bxxxx; // ???
        endcase
    endcase
  end
endmodule