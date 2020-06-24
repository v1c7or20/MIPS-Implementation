module testbench();

  reg        clk;
  reg        reset;

  wire [31:0] writedata, dataadr;
  wire        memwrite;

  // instantiate device to be tested
  top dut(clk, reset, writedata, dataadr, memwrite);
  
  // initialize test
  initial
    begin
      reset <= 1; # 22; reset <= 0;
    end

  // generate clock to sequence tests
  always
    begin
      clk <= 1; # 5 clk = ~clk;
      $monitor("Clk: %h, reset: %h, pc: %h, instr: %h, writedata: %h, memwrite: %h, readdata: %h"
      ,clk, reset, dut.pc, dut.instr, writedata, memwrite, dut.readdata); #5;
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



