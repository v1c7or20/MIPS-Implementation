
module datapath(input          clk, reset,
                input          pcen, irwrite, regwrite,
                input          alusrca, iord, memtoreg, regdst,
                input   [1:0]  alusrcb, pcsrc, 
                input   [2:0]  alucontrol,
                output  [5:0]  op, funct,
                output         zero,
                output  [31:0] adr, writedata, 
                input   [31:0] readdata);

  // Below are the internal signals of the datapath module.

  wire [4:0]  writereg;
  wire [31:0] pcnext, pc;_
  wire [31:0] instr, data, srca, srcb;
  wire [31:0] a;
  wire [31:0] aluresult, aluout;
  wire [31:0] signimm;   // the sign-extended immediate
  wire [31:0] signimmsh;	// the sign-extended immediate shifted left by 2
  wire [31:0] wd3, rd1, rd2;

  // op and funct fields to controller
  assign op = instr[31:26];
  assign funct = instr[5:0];

  
  // Your datapath hardware goes below.  Instantiate each of the submodules
  // that you need.  Remember that alu's, mux's and various other 
  // versions of parameterizable modules are available in mipsparts.sv
  // from Lab 9. You'll likely want to include this verilog file in your
  // simulation.

  // We've included parameterizable 3:1 and 4:1 muxes below for your use.

  // Remember to give your instantiated modules applicable names
  // such as pcreg (PC register), wdmux (Write Data Mux), etc.
  // so it's easier to understand.

  // ADD CODE HERE

  // datapath
  
endmodule

