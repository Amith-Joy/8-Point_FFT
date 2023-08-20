// Code your design here
module fft_8pt(xin_r0,
               xin_r1,
               xin_r2,
               xin_r3,
               xin_r4,
               xin_r5,
               xin_r6,
               xin_r7,
               xin_i0,
               xin_i1,
               xin_i2,
               xin_i3,
               xin_i4,
               xin_i5,
               xin_i6,
               xin_i7,
               clk,
               y0_r,
               y1_r,
               y2_r,
               y3_r,
               y4_r,
               y5_r,
               y6_r,
               y7_r,
               y0_i,
               y1_i,
               y2_i,
               y3_i,
               y4_i,
               y5_i,
               y6_i,
               y7_i,
               mode,
              reset);
  input clk,mode,reset;
  
  
  
  input signed [15:0] xin_r0,xin_r1,xin_r2,xin_r3,xin_r4,xin_r5,xin_r6,xin_r7,xin_i0,xin_i1,xin_i2,xin_i3,xin_i4,xin_i5,xin_i6,xin_i7;
  output reg signed [15:0] y0_r,y1_r,y2_r,y3_r,y4_r,y5_r,y6_r,y7_r,y0_i,y1_i,y2_i,y3_i,y4_i,y5_i,y6_i,y7_i;
  
  //twiddle factors(real and imaginary given separately)
  parameter signed [15:0] w0_r=16'h7FFF;
  parameter signed [15:0] w1_r=16'h5A82;
  parameter signed [15:0] w2_r=16'h0000;
  parameter signed [15:0] w3_r=16'hA57E;
  parameter signed [15:0] w0_i=16'h0000;
  parameter signed [15:0] w1_i=16'hA57E;
  parameter signed [15:0] w2_i=16'h8000;
  parameter signed [15:0] w3_i=16'hA57E;
  //reg or wire?
  
  reg signed [18:0] x0_rn,x1_rn,x2_rn,x3_rn,x4_rn,x5_rn,x6_rn,x7_rn,x0_in,x1_in,x2_in,x3_in,x4_in,x5_in,x6_in,x7_in;
  
  wire signed [15:0] x0_r,x1_r,x2_r,x3_r,x4_r,x5_r,x6_r,x7_r,x0_i,x1_i,x2_i,x3_i,x4_i,x5_i,x6_i,x7_i;
  wire signed [15:0] g0_r,g1_r,g2_r,g3_r,g4_r,g5_r,g6_r,g7_r,g0_i,g1_i,g2_i,g3_i,g4_i,g5_i,g6_i,g7_i;
  
  wire signed [15:0] h0_r,h1_r,h2_r,h3_r,h4_r,h5_r,h6_r,h7_r,h0_i,h1_i,h2_i,h3_i,h4_i,h5_i,h6_i,h7_i;
  //multiplier outputs as wires:
  wire signed[31:0] s1_14r,s1_14i,s1_26r,s1_26i,s1_15r,s1_15i,s1_37r,s1_37i,s2_02r,s2_02i,s2_13r,s2_13i,s2_46r,s2_46i,s2_75r,s2_75i,s3_04r,s3_04i,s3_15r,s3_15i,s3_26r,s3_26i,s3_37r,s3_37i;
  wire signed [15:0] y0_rf,y1_rf,y2_rf,y3_rf,y4_rf,y5_rf,y6_rf,y7_rf,y0_if,y1_if,y2_if,y3_if,y4_if,y5_if,y6_if,y7_if;

  
  always@(*)
    begin
      if (reset==1)
      begin
      x0_rn<=0;//4.15
          x1_rn<=0;
          x2_rn<=0;
          x3_rn<=0;
          x4_rn<=0;
          x5_rn<=0;
          x6_rn<=0;
          x7_rn<=0;
          x0_in<=0;
          x1_in<=0;
          x2_in<=0;
          x3_in<=0;
          x4_in<=0;
          x5_in<=0;
          x6_in<=0;
          x7_in<=0;
      end
      else
      begin
        if (mode==0)//fft
        begin
          x0_rn<={{3{xin_r0[15]}},xin_r0};//4.15
          x1_rn<={{3{xin_r1[15]}},xin_r1};
          x2_rn<={{3{xin_r2[15]}},xin_r2};
          x3_rn<={{3{xin_r3[15]}},xin_r3};
          x4_rn<={{3{xin_r4[15]}},xin_r4};
          x5_rn<={{3{xin_r5[15]}},xin_r5};
          x6_rn<={{3{xin_r6[15]}},xin_r6};
          x7_rn<={{3{xin_r7[15]}},xin_r7};
          x0_in<={{3{xin_i0[15]}},xin_i0};
          x1_in<={{3{xin_i1[15]}},xin_i1};
          x2_in<={{3{xin_i2[15]}},xin_i2};
          x3_in<={{3{xin_i3[15]}},xin_i3};
          x4_in<={{3{xin_i4[15]}},xin_i4};
          x5_in<={{3{xin_i5[15]}},xin_i5};
          x6_in<={{3{xin_i6[15]}},xin_i6};
          x7_in<={{3{xin_i7[15]}},xin_i7};
          
          y0_r<=h0_r+s3_04r[30:15];
           y0_i<=h0_i+s3_04i[30:15];
           y4_r<=h0_r-s3_04r[30:15];
           y4_i<=h0_i-s3_04i[30:15];

           y1_r<=h1_r+s3_15r[30:15];
           y1_i<=h1_i+s3_15i[30:15];
           y5_r<=h1_r-s3_15r[30:15];
           y5_i<=h1_i-s3_15i[30:15];

           y2_r<=h2_r+s3_26r[30:15];
           y2_i<=h2_i+s3_26i[30:15];
           y6_r<=h2_r-s3_26r[30:15];
           y6_i<=h2_i-s3_26i[30:15];

           y3_r<=h3_r+s3_37r[30:15];
           y3_i<=h3_i+s3_37i[30:15];
           y7_r<=h3_r-s3_37r[30:15];
           y7_i<=h3_i-s3_37i[30:15];

        end
  
  	    else//ifft
        begin
          x0_rn<={{3{xin_i0[15]}},xin_i0};
          x1_rn<={{3{xin_i1[15]}},xin_i1};
          x2_rn<={{3{xin_i2[15]}},xin_i2};
          x3_rn<={{3{xin_i3[15]}},xin_i3};
          x4_rn<={{3{xin_i4[15]}},xin_i4};
          x5_rn<={{3{xin_i5[15]}},xin_i5};
          x6_rn<={{3{xin_i6[15]}},xin_i6};
          x7_rn<={{3{xin_i7[15]}},xin_i7};
          x0_in<={{3{xin_r0[15]}},xin_r0};
          x1_in<={{3{xin_r1[15]}},xin_r1};
          x2_in<={{3{xin_r2[15]}},xin_r2};
          x3_in<={{3{xin_r3[15]}},xin_r3};
          x4_in<={{3{xin_r4[15]}},xin_r4};
          x5_in<={{3{xin_r5[15]}},xin_r5};
          x6_in<={{3{xin_r6[15]}},xin_r6};
          x7_in<={{3{xin_r7[15]}},xin_r7};
     
          y0_i<=y0_rf/8;
           y0_r<=y0_if/8;
           y4_i<=y4_rf/8;
           y4_r<=y4_if/8;

           y1_i<=y1_rf/8;
           y1_r<=y1_if/8;
           y5_i<=y5_rf/8;
           y5_r<=y5_if/8;

           y2_i<=y2_rf/8;
           y2_r<=y2_if/8;
           y6_i<=y6_rf/8;
           y6_r<=y6_if/8;

           y3_i<=y3_rf/8;
           y3_r<=y3_if/8;
           y7_i<=y7_rf/8;
           y7_r<=y5_if/8;

		
        end
      end
  end
  
  assign x0_r=x0_rn[18:3];//4.12
  assign x1_r=x1_rn[18:3];
  assign x2_r=x2_rn[18:3];
  assign x3_r=x3_rn[18:3];
  assign x4_r=x4_rn[18:3];
  assign x5_r=x5_rn[18:3];
  assign x6_r=x6_rn[18:3];
  assign x7_r=x7_rn[18:3];
  
  assign x0_i=x0_in[18:3];
  assign x1_i=x1_in[18:3];
  assign x2_i=x2_in[18:3];
  assign x3_i=x3_in[18:3];
  assign x4_i=x4_in[18:3];
  assign x5_i=x5_in[18:3];
  assign x6_i=x6_in[18:3];
  assign x7_i=x7_in[18:3];

  //stage 1
  assign s1_14r=x4_r*w0_r-x4_i*w0_i;//5.27
  assign s1_14i=x4_i*w0_r+x4_r*w0_i;
  assign s1_26r=x6_r*w0_r-x6_i*w0_i;
  assign s1_26i=x6_i*w0_r+x6_r*w0_i;
  assign s1_15r=x5_r*w0_r-x5_i*w0_i;
  assign s1_15i=x5_i*w0_r+x5_r*w0_i;
  assign s1_37r=x7_r*w0_r-x7_i*w0_i;
  assign s1_37i=x7_i*w0_r+x7_r*w0_i;
  
  assign s2_02r=g2_r*w0_r-g2_i*w0_i;
  assign s2_02i=g2_i*w0_r+g2_r*w0_i;
  assign s2_13r=g3_r*w2_r-g3_i*w2_i;
  assign s2_13i=g3_i*w2_r+g3_r*w2_i;
  assign s2_46r=g6_r*w0_r-g6_i*w0_i;
  assign s2_46i=g6_i*w0_r+g6_r*w0_i;
  assign s2_75r=g7_r*w2_r-g7_i*w2_i;
  assign s2_75i=g7_i*w2_r+g7_r*w2_i;
  
  assign s3_04r=h4_r*w0_r-h4_i*w0_i;
  assign s3_04i=h4_i*w0_r+h4_r*w0_i;
  assign s3_15r=h5_r*w1_r-h5_i*w1_i;
  assign s3_15i=h5_i*w1_r+h5_r*w1_i;
  assign s3_26r=h6_r*w2_r-h6_i*w2_i;
  assign s3_26i=h6_i*w2_r+h6_r*w2_i;
  assign s3_37r=h7_r*w3_r-h7_i*w3_i;
  assign s3_37i=h7_i*w3_r+h7_r*w3_i;
  
    assign g0_r=x0_r+s1_14r[30:15];//4.12
  assign g0_i=x0_i+s1_14i[30:15];
  assign g1_r=x0_r-s1_14r[30:15];
  assign g1_i=x0_i-s1_14i[30:15];

  assign g2_r=x2_r+s1_26r[30:15];
  assign g2_i=x2_i+s1_26i[30:15];
  assign g3_r=x2_r-s1_26r[30:15];
  assign g3_i=x2_i-s1_26i[30:15];
  
  assign g4_r=x1_r+s1_15r[30:15];
  assign g4_i=x1_i+s1_15i[30:15];
  assign g5_r=x1_r-s1_15r[30:15];
  assign g5_i=x1_i-s1_15i[30:15];
  
  assign g6_r=x3_r+s1_37r[30:15];
  assign g6_i=x3_i+s1_37i[30:15];
  assign g7_r=x3_r-s1_37r[30:15];
  assign g7_i=x3_i-s1_37i[30:15];
  //stage 2
  assign h0_r=g0_r+s2_02r[30:15];
  assign h0_i=g0_i+s2_02i[30:15];
  assign h2_r=g0_r-s2_02r[30:15];
  assign h2_i=g0_i-s2_02i[30:15];

  assign h1_r=g1_r+s2_13r[30:15];
  assign h1_i=g1_i+s2_13i[30:15];
  assign h3_r=g1_r-s2_13r[30:15];
  assign h3_i=g1_i-s2_13i[30:15];
  
  assign h4_r=g4_r+s2_46r[30:15];
  assign h4_i=g4_i+s2_46i[30:15];
  assign h6_r=g4_r-s2_46r[30:15];
  assign h6_i=g4_i-s2_46i[30:15];
  
  assign h5_r=g5_r+s2_75r[30:15];
  assign h5_i=g5_i+s2_75i[30:15];
  assign h7_r=g5_r-s2_75r[30:15];
  assign h7_i=g5_i-s2_75i[30:15];
  
  //stage3
  
  assign y0_rf=h0_r+s3_04r[30:15];
  assign y0_if=h0_i+s3_04i[30:15];
  assign y4_rf=h0_r-s3_04r[30:15];
  assign y4_if=h0_i-s3_04i[30:15];
  
  assign y1_rf=h1_r+s3_15r[30:15];
  assign y1_if=h1_i+s3_15i[30:15];
  assign y5_rf=h1_r-s3_15r[30:15];
  assign y5_if=h1_i-s3_15i[30:15];
  
  assign y2_rf=h2_r+s3_26r[30:15];
  assign y2_if=h2_i+s3_26i[30:15];
  assign y6_rf=h2_r-s3_26r[30:15];
  assign y6_if=h2_i-s3_26i[30:15];
  
  assign y3_rf=h3_r+s3_37r[30:15];
  assign y3_if=h3_i+s3_37i[30:15];
  assign y7_rf=h3_r-s3_37r[30:15];
  assign y7_if=h3_i-s3_37i[30:15];
  
endmodule

