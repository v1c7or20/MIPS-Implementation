module controller(input         clk, reset,
                  input   [5:0] op, funct,
                  input         zero,
                  output        pcen, memwrite, irwrite, regwrite,
                  output        alusrca, iord, memtoreg, regdst,
                  output  [1:0] alusrcb, pcsrc,
                  output  [3:0] alucontrol);

  wire [1:0] aluop;
  wire       branch, pcwrite;
  // Main Decoder and ALU Decoder subunits.
  maindec md(clk, reset, op,
             pcwrite, memwrite, irwrite, regwrite,
             alusrca, branch, iord, memtoreg, regdst, 
             alusrcb, pcsrc, aluop);
  aludec  ad(funct, aluop, alucontrol);

  assign pcen = (zero & branch) || pcwrite;
  
 
endmodule
