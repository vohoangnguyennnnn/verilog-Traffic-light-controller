`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/17/2026 07:26:20 PM
// Design Name: 
// Module Name: traffic_light
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


module traffic_light #(
    parameter integer RED_TIME = 15,   // thời gian state tồn tại
    parameter integer YELLOW_TIME = 4,
    parameter integer GREEN_TIME = 11
    )(
    input wire clk,
    input wire rst,
    output reg red,
    output reg yellow,
    output reg green
    );
    
    localparam[1:0] STATE_RED = 2'd0;
    localparam[1:0] STATE_YELLOW = 2'd1;
    localparam[1:0] STATE_GREEN = 2'd2;
    
    reg[1:0] state, next_state;
    reg[15:0] cnt, next_cnt;
    
    //Combinational logic
    always @(*) begin
    //defaults
    next_state = state;
    next_cnt = cnt;
    red = 1'b0;
    yellow = 1'b0;
    green = 1'b0;
    
    case (state)
        STATE_RED: begin    // Red light
            red = 1'b1;
            if (cnt == RED_TIME - 1) begin
                next_state = STATE_YELLOW;
                next_cnt = 16'd0;
            end else next_cnt = cnt + 1;
        end
        
        STATE_YELLOW: begin  // Yellow light
            yellow = 1'b1;
            if (cnt == YELLOW_TIME - 1) begin
                next_state = STATE_GREEN;
                next_cnt = 16'd0;
            end else next_cnt = cnt + 1;
        end
        
        STATE_GREEN: begin  // Green light
            green = 1'b1;
            if (cnt == GREEN_TIME - 1) begin
                next_state = STATE_RED;
                next_cnt = 16'd0;
            end else next_cnt = cnt + 1;
        end 
        
        default: begin
            red = 1'b1;
            next_state = STATE_RED;
            next_cnt = 16'd0;
        end
     endcase
   end
   
   //Sequential logic
   always @(posedge clk) begin
        if (rst) begin
            state <= STATE_RED;
            cnt <= 16'd0;
        end else begin
            state <= next_state;
            cnt <= next_cnt;
        end
    end
endmodule
