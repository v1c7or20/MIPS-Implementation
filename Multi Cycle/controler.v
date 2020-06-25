module controller(input         clk, reset,
                  input   [5:0] op, funct,
                  input         zero,
                  output        pcen, memwrite, irwrite, regwrite,
                  output        alusrca, iord, memtoreg, regdst,
                  output  [1:0] alusrcb, pcsrc,
                  output  [2:0] alucontrol);

  wire [1:0] aluop;
  wire       branch, pcwrite;

  // Main Decoder and ALU Decoder subunits.
  maindec md(clk, reset, op,
             pcwrite, memwrite, irwrite, regwrite,
             alusrca, branch, iord, memtoreg, regdst, 
             alusrcb, pcsrc, aluop);
  aludec  ad(funct, aluop, alucontrol);

  // ADD CODE HERE
  // Add combinational logic (i.e. an assign statement) 
  // to produce the PCEn signal (pcen) from the branch, 
  // zero, and pcwrite signals
 
endmodule
