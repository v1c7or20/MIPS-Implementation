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
  controller ctlr(clk, reset, op, funct, zero, pcen, memwrite, 
  irwrite, regwrite, alusrca, iord, memtoreg, regdst, alusrcb, 
  pcsrc, alucontrol);

  always
    begin
      $monitor("Clk: h, reset: h, op: %h, funct: %h, zero: %h, pcen: %h, memwrite: %h, irwrite: %h, regwrite: %h, alusrca: %h, iord: %h, memtoreg: %h, regdst: %h, alusrcb: %h, pcsrc: %h, alucontrol %h", 
      clk, reset, op, funct, zero, pcen, memwrite, irwrite, regwrite, 
      alusrca, iord, memtoreg, regdst, alusrcb, pcsrc, alucontrol);
      # 5 clk = ~clk;
    end
  // initialize test
  initial
    begin
      $dumpfile("controller.vcd");
      $dumpvars;
      clk <= 1; 
      reset <= 1; # 5; reset <= 0;
       #5;  {op, funct, zero} = 13'b0000001000000;  //add
       #30; {op, funct, zero} = 13'b0000001000100;  //sub
       #40; {op, funct, zero} = 13'b0000001001000;  //and
       #40; {op, funct, zero} = 13'b0000001001010;  //or
       #40; {op, funct, zero} = 13'b0000001010100;  //slt
       #40; {op, funct, zero} = 13'b100011xxxxxx0;  //lw
       #50; {op, funct, zero} = 13'b101011xxxxxx0;  //sw
       #40; {op, funct, zero} = 13'b000100xxxxxx0;  //beq
       #30; {op, funct, zero} = 13'b001000xxxxxx0;  //addi
       #40; {op, funct, zero} = 13'b000010xxxxxx0;  //j
       #30; {op, funct, zero} = 13'b0000001000001;
       #40; {op, funct, zero} = 13'b0000001000101;
       #40; {op, funct, zero} = 13'b0000001001001;
       #40; {op, funct, zero} = 13'b0000001001011;
       #40; {op, funct, zero} = 13'b0000001010101;
       #40; {op, funct, zero} = 13'b100011xxxxxx1;
       #50; {op, funct, zero} = 13'b101011xxxxxx1;
       #40; {op, funct, zero} = 13'b000100xxxxxx1;
       #30; {op, funct, zero} = 13'b001000xxxxxx1;
       #40; {op, funct, zero} = 13'b000010xxxxxx1;
       #35;
      $stop;
    end
endmodule