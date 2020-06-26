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

  // generate clock to sequence tests
  always
    begin
      clk <= 1; # 5 clk = ~clk;
      $monitor("Clk: %h, reset: %h, pc: %h, instr: %h, writedata: %h, memwrite: %h, readdata: %h, dataadr: %h"
      ,clk, reset, dut.pc, dut.instr, writedata, memwrite, dut.readdata, dataadr); #5;
    end
  // check that 7 gets written to address 84
  always@(negedge clk)
    begin
      if(memwrite) begin
        if(dataadr === 84 & writedata === 7) begin
          $display();
          $display("Simulation succeeded");
          $stop;
        end else if (dataadr !== 80) begin
          $display("Simulation failed");
          $stop;
        end
      end
    end
endmodule
