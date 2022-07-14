// Code your design here
timescale 1ns/1ps
module traffic_light(
  input clock,reset,
  output reg [2:0]L1,
  output reg [2:0]LS;
  output reg [2:0]LT,
  output reg [2:0]L2;
);
  parameter S1=0, S2=1, S3=2, S4=3, S5=4, S6=5;
  reg [3:0]count;
  reg [2:0] ps;
  parameter P7=7,P5=5,P2=2,P3=3;
  
  always@(posedge clock or posedge reset )
    begin
      if(reset == 1)
        begin 
          ps<=S1;
          count<=0;
        end
      else
        
        case(ps);
          S1: if(count<P7)
            begin 
              ps<=S1;
              count<=count+1;
            end
          else
            begin