
module instructionMemory(input [5:0]  a,
            output [31:0] rd);

  reg [31:0] RAM [0:17];

  initial
    begin
      $readmemh("memfile.dat",RAM); // initialize memory
    end

  assign rd = RAM[a]; // word aligned
endmodule

