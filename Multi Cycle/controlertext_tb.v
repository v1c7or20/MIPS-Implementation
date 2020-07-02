module testbench();

  reg        clk;
  reg        reset;
  reg [5:0]  op, funct;
  reg        zero;
  wire       pcen, memwrite, irwrite, regwrite;
  wire       alusrca, iord, memtoreg, regdst;
  wire [1:0] alusrcb, pcsrc;
  wire [3:0] alucontrol;
  // instantiate device to be tested
  controller ctlr(clk, reset, op, funct, zero, pcen, memwrite, irwrite, regwrite, alusrca, iord, memtoreg, regdst, alusrcb, pcsrc, alucontrol);
  
  integer iter;

  // initialize test
  initial
    begin
      reset <= 1; # 10; reset <= 0;
      iter = 0;
    end

  
  reg [31:0] instrmem [0:17];

  initial
    begin
      $dumpfile("controller.vcd");
      $dumpvars;
      $readmemb("memfile.dat",instrmem);
    end

  // generate clock to sequence tests

  always begin
     #35 iter = iter+1;
  end
  
  always
    begin
      clk <= 1; # 5 clk = ~clk;
      {op, funct, zero } = instrmem[iter];
      $monitor("Clk:%h, reset:%h, op:%h, funct:%h, zero:%h, pcen:%h, memwrite:%h, irwrite:%h, regwrite:%h, alusrca:%h, iord:%h, memtoreg:%h, regdst:%h, alusrcb:%h, pcsrc:%h, aluop:%h, iter:%d", 
      clk, reset, op, funct, zero, pcen, memwrite, irwrite, regwrite, alusrca, iord, memtoreg, regdst, alusrcb, pcsrc, ctlr.aluop, iter); #5;
    end
endmodule
