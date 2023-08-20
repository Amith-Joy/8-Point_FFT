// Code your testbench here
// or browse Examples
// Code your testbench here
// or browse Examples
// Code your testbench here
// or browse Examples
module tb;
  reg clk,reset,mode;
  reg signed [15:0] xin_r0,xin_r1,xin_r2,xin_r3,xin_r4,xin_r5,xin_r6,xin_r7,xin_i0,xin_i1,xin_i2,xin_i3,xin_i4,xin_i5,xin_i6,xin_i7;
  //wire [15:0] y0mag,y1mag,y2mag,y3mag,y4mag,y5mag,y6mag,y7mag;
  wire signed [15:0] y0_r,y1_r,y2_r,y3_r,y4_r,y5_r,y6_r,y7_r,y0_i,y1_i,y2_i,y3_i,y4_i,y5_i,y6_i,y7_i;
  integer write_data,write_data1,write_data_mag,i,j;
  reg signed [15:0] inputs1[0:63];
  reg signed [15:0] inputs2[0:63];
  
  localparam SF=2.0**(-12);
  
  fft_8pt fft_8pt(.xin_r0(xin_r0),.xin_r1(xin_r1),.xin_r2(xin_r2),.xin_r3(xin_r3),.xin_r4(xin_r4),.xin_r5(xin_r5),.xin_r6(xin_r6),.xin_r7(xin_r7),.xin_i0(xin_i0),.xin_i1(xin_i1),.xin_i2(xin_i2),.xin_i3(xin_i3),.xin_i4(xin_i4),.xin_i5(xin_i5),.xin_i6(xin_i6),.xin_i7(xin_i7),.clk(clk),.reset(reset),.mode(mode),.y0_r(y0_r),.y1_r(y1_r),.y2_r(y2_r),.y3_r(y3_r),.y4_r(y4_r),.y5_r(y5_r),.y6_r(y6_r),.y7_r(y7_r),.y0_i(y0_i),.y1_i(y1_i),.y2_i(y2_i),.y3_i(y3_i),.y4_i(y4_i),.y5_i(y5_i),.y6_i(y6_i),.y7_i(y7_i));
  
  always #5clk=~clk;
  
  always@(negedge clk)
    begin
      $fwrite(write_data,$itor(y0_r*SF));
      $fwrite(write_data,"\n");
      $fwrite(write_data,$itor(y1_r*SF));
      $fwrite(write_data,"\n");
      $fwrite(write_data,$itor(y2_r*SF));
      $fwrite(write_data,"\n");
      $fwrite(write_data,$itor(y3_r*SF));
      $fwrite(write_data,"\n");
      $fwrite(write_data,$itor(y4_r*SF));
      $fwrite(write_data,"\n");
      $fwrite(write_data,$itor(y5_r*SF));
      $fwrite(write_data,"\n");
      $fwrite(write_data,$itor(y6_r*SF));
      $fwrite(write_data,"\n");
      $fwrite(write_data,$itor(y7_r*SF));
      $fwrite(write_data,"\n");
      $fwrite(write_data1,$itor(y0_i*SF));
      $fwrite(write_data1,"\n");
      $fwrite(write_data1,$itor(y1_i*SF));
      $fwrite(write_data1,"\n");
      $fwrite(write_data1,$itor(y2_i*SF));
      $fwrite(write_data1,"\n");
      $fwrite(write_data1,$itor(y3_i*SF));
      $fwrite(write_data1,"\n");
      $fwrite(write_data1,$itor(y4_i*SF));
      $fwrite(write_data1,"\n");
      $fwrite(write_data1,$itor(y5_i*SF));
      $fwrite(write_data1,"\n");
      $fwrite(write_data1,$itor(y6_i*SF));
      $fwrite(write_data1,"\n");
      $fwrite(write_data1,$itor(y7_i*SF));
      $fwrite(write_data1,"\n");
      /*
      $fwrite(write_data_mag,$sqrt($itor(y0_r*SF*y0_r*SF)+$itor(y0_i*SF*y0_i*SF)));
      $fwrite(write_data_mag,"\n");
      $fwrite(write_data_mag,$sqrt($itor(y1_r*SF*y1_r*SF)+$itor(y1_i*SF*y1_i*SF)));
      $fwrite(write_data_mag,"\n");
      $fwrite(write_data_mag,$sqrt($itor(y2_r*SF*y2_r*SF)+$itor(y2_i*SF*y2_i*SF)));
      $fwrite(write_data_mag,"\n");
      $fwrite(write_data_mag,$sqrt($itor(y3_r*SF*y3_r*SF)+$itor(y3_i*SF*y3_i*SF)));
      $fwrite(write_data_mag,"\n");
      $fwrite(write_data_mag,$sqrt($itor(y4_r*SF*y4_r*SF)+$itor(y4_i*SF*y4_i*SF)));
      $fwrite(write_data_mag,"\n");
      $fwrite(write_data_mag,$sqrt($itor(y5_r*SF*y5_r*SF)+$itor(y5_i*SF*y5_i*SF)));
      $fwrite(write_data_mag,"\n");
      $fwrite(write_data_mag,$sqrt($itor(y6_r*SF*y6_r*SF)+$itor(y6_i*SF*y6_i*SF)));
      $fwrite(write_data_mag,"\n");
      $fwrite(write_data_mag,$sqrt($itor(y7_r*SF*y7_r*SF)+$itor(y7_i*SF*y7_i*SF)));
      $fwrite(write_data_mag,"\n");
      */
      $fwrite(write_data_mag,$sqrt($itor(y0_r*SF)*$itor(y0_r*SF)+$itor(y0_i*SF)*$itor(y0_i*SF)));
      $fwrite(write_data_mag,"\n");
      $fwrite(write_data_mag,$sqrt($itor(y1_r*SF)*$itor(y1_r*SF)+$itor(y1_i*SF)*$itor(y1_i*SF)));
      $fwrite(write_data_mag,"\n");
      $fwrite(write_data_mag,$sqrt($itor(y2_r*SF)*$itor(y2_r*SF)+$itor(y2_i*SF)*$itor(y2_i*SF)));
      $fwrite(write_data_mag,"\n");
      $fwrite(write_data_mag,$sqrt($itor(y3_r*SF)*$itor(y3_r*SF)+$itor(y3_i*SF)*$itor(y3_i*SF)));
      $fwrite(write_data_mag,"\n");
      $fwrite(write_data_mag,$sqrt($itor(y4_r*SF)*$itor(y4_r*SF)+$itor(y4_i*SF)*$itor(y4_i*SF)));
      $fwrite(write_data_mag,"\n");
      $fwrite(write_data_mag,$sqrt($itor(y5_r*SF)*$itor(y5_r*SF)+$itor(y5_i*SF)*$itor(y5_i*SF)));
      $fwrite(write_data_mag,"\n");
      $fwrite(write_data_mag,$sqrt($itor(y6_r*SF)*$itor(y6_r*SF)+$itor(y6_i*SF)*$itor(y6_i*SF)));
      $fwrite(write_data_mag,"\n");
      $fwrite(write_data_mag,$sqrt($itor(y7_r*SF)*$itor(y7_r*SF)+$itor(y7_i*SF)*$itor(y7_i*SF)));
      $fwrite(write_data_mag,"\n");
    end
  
  initial
    begin
      $dumpfile("dump.vcd");
      $dumpvars(0);
    end
  
  initial 
    begin
      $readmemh("inputs1.txt",inputs1);
      $readmemh("inputs2.txt",inputs2);
      drive_reset();
      write_data=$fopen("output_tracker_real.txt","w");
      write_data1=$fopen("output_tracker_imag.txt","w");
      write_data_mag=$fopen("output_tracker_mag.txt","w");
      mode=0;
      for(i=0;i<=64;i=i+8)
        begin
          drive_input(i);
        end
      #50
      $fclose(write_data);
      $fclose(write_data_mag);
      $finish;
    end

  task drive_reset();
    $display("Driving the reset");
    clk = 1'b0;
    @(negedge clk)
    reset = 0;
    @(negedge clk)
    reset = 1;
    @(negedge clk)
    reset = 0;
  endtask
  
task drive_input(input integer i);
    
  @(negedge clk)
    //operands_val=1;
    xin_r0<=inputs1[i];
    xin_r1<=inputs1[i+1];
    xin_r2<=inputs1[i+2];
    xin_r3<=inputs1[i+3];
    xin_r4<=inputs1[i+4];
    xin_r5<=inputs1[i+5];
    xin_r6<=inputs1[i+6];
    xin_r7<=inputs1[i+7];
  xin_i0<=inputs2[i];
  xin_i1<=inputs2[i+1];
  xin_i2<=inputs2[i+2];
  xin_i3<=inputs2[i+3];
  xin_i4<=inputs2[i+4];
  xin_i5<=inputs2[i+5];
  xin_i6<=inputs2[i+6];
  xin_i7<=inputs2[i+7];
    //@(negedge clk)
    //operands_val=0;
  endtask
endmodule

