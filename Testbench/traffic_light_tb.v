`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/17/2026 07:26:39 PM
// Design Name: 
// Module Name: traffic_light_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module traffic_light_tb;
    reg clk;
    reg rst;
    wire red;
    wire yellow;
    wire green;
    
    traffic_light #(
        .RED_TIME(15),
        .YELLOW_TIME(4),
        .GREEN_TIME(11)
    ) dut (
        .clk(clk),.rst(rst),.red(red),.yellow(yellow),.green(green)
        );
        
    // Clock generation
    initial clk = 0;
    always #5 clk = ~clk;    //  10ns period
    
    task reset(input integer cycles);
    integer i;
    begin
      rst = 1'b1;
      for (i = 0; i < cycles; i = i + 1) @(posedge clk);
      rst = 1'b0;
      @(posedge clk);
    end
  endtask

  // basic checks
  always @(posedge clk) begin
    if (!rst) begin
      if ((red + yellow + green) != 1) begin
        $display("[%0t] ERROR: invalid lights RYG=%0b%0b%0b", $time, red, yellow, green);
        $stop;
      end
    end
  end

  // stimulus
  initial begin
    rst = 1'b0;

    // reset 
    reset(2);

    // stimulate
    repeat (20) @(posedge clk);

    // reset 
    reset(2);
    repeat (120) @(posedge clk);

    $display("[%0t] PASS (basic checks)", $time);
    $finish;
  end      
endmodule
