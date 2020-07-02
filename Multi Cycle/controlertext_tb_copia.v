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
 
  always
    begin
      
      $monitor("Clk: %h, reset: %h, op: %h, funct: %h, zero: %h, pcen: %h, memwrite: %h, irwrite: %h, regwrite: %h, alusrca: %h, iord: %h, memtoreg: %h, regdst: %h, alusrcb: %h, pcsrc: %h, alucontrol %h", 
      clk, reset, op, funct, zero, pcen, memwrite, irwrite, regwrite, alusrca, iord, memtoreg, regdst, alusrcb, pcsrc, alucontrol);
      # 5 clk = ~clk;
    end

  // initialize test
  initial
    begin
      $dumpfile("prueba.vcd");
      $dumpvars;
      clk <= 1; 
      reset <= 1; # 5; reset <= 0;
       #10; op = 6'b000000; funct = 6'b100000; zero = 0;
       #10;

      $stop;
    end

  // generate clock to sequence tests

endmodule
