module testbench();

  reg        clk;
  reg        reset;
  reg       [5:0]op, funct;
  reg       zero;
  wire      pcen, memwrite, irwrite, regwrite;
  wire      alusrca, iord, memtoreg, regdst;
  wire [1:0] alusrcb, pcsrc;
  wire [3:0] alucontrol;
  // instantiate device to be tested
  controler ctlr(clk, reset, op, funct, zero, pcen, memwrite,
  irwrite, regwrite, alusrca, iord, memtoreg, regdst, alusrcb, pcsrc);
  
  // initialize test
  initial
    begin
      reset <= 1; # 22; reset <= 0;
    end

// generate vector

  // generate clock to sequence tests
  always
    begin
      clk <= 1; # 5 clk = ~clk;
      $monitor("Clk: %h, reset: %h, op: %h, funct: %h, zero: %h, pcen: %h,
       memwrite: %h, irwrite: %h, regwrite: %h, alusra: %h, iord: %h, memtoreg: %h,
        regdst: %h, alusrcb: %h, pcsrc: %h"
      clk, reset, op, funct, zero, pcen, memwrite,
  irwrite, regwrite, alusrca, iord, memtoreg, regdst, alusrcb, pcsrc); #5;
    end
  // check that 7 gets written to address 84

