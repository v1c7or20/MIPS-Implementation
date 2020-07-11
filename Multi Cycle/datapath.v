
module datapath(input          clk, reset,
                input          pcen, irwrite, regwrite,
                input          alusrca, iord, memtoreg, regdst,
                input   [1:0]  alusrcb, pcsrc, 
                input   [3:0]  alucontrol,
                output  [5:0]  op, funct,
                output         zero,
                output  [31:0] adr, writedata, 
                input   [31:0] readdata);

  // Below are the internal signals of the datapath module.

  wire [4:0]  writereg;
  wire [31:0] pcnext, pc;
  wire [31:0] instr, data, srca, srcb;
  wire [31:0] a,b;
  wire [31:0] aluresult, aluout;
  wire [31:0] signimm;   // the sign-extended immediate
  wire [31:0] signimmsh;	// the sign-extended immediate shifted left by 2
  wire [31:0] wd3, rd1, rd2,w3;
  wire [31:0] slmux;

  // op and funct fields to controller
  assign op = instr[31:26];
  assign funct = instr[5:0];

  flopenr #(32) flop1(clk, reset, pcen, pcnext, pc);
  
  mux2 #(32)  pcbrmux(pc, aluout, iord, adr);
    
  flopenr #(32) flop2(clk, reset, irwrite, readdata, instr);
  
  flopr #(32) flopr(clk, reset, readdata, data);
  
  mux2 #(5)  regdestmux(instr[20:16], instr[15:11], regdst, writereg);
  
  mux2 #(32)  mentregmux(aluout, data, memtoreg, w3);
  
  regfile     rf(clk, regwrite, instr[25:21], instr[20:16], writereg, w3, rd1, rd2);
    
  signext     se(instr[15:0], signimm);
  
  flopr #(32) flopra(clk, reset, rd1, a);
  
  flopr #(32) floprb(clk, reset, rd2, b);
  
  assign writedata = b;

  mux2 #(32)  regdestmux2(pc, a, alusrca,srca);

  sl2 s1(signimm, signimmsh);

  mux4 #(32) m4(b, 32'd4, signimm, signimmsh, alusrcb, srcb);

  alu alu1(srca, srcb, alucontrol, aluresult, zero );

  flopr #(32) floprb2(clk, reset, aluresult, aluout);

  sl2 sl22({6'b000000,instr[25:0]}, slmux);

  mux3 #(32) muxend(aluresult, aluout, {pc[31:28], slmux[27:0]}, pcsrc, pcnext);
  
  //parece que ya esta
  
endmodule

