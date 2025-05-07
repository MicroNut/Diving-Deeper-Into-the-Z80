//  A testbench for alu_slice_Slice Logic_tb
`timescale 1us/1ns

module alu_slice_Slice Logic_tb;
    reg op1;
    reg op2;
    reg S;
    reg R;
    reg cy_in;
    reg V;
    wire cy_out;
    wire result;

  alu_slice alu_slice0 (
    .op1(op1),
    .op2(op2),
    .S(S),
    .R(R),
    .cy_in(cy_in),
    .V(V),
    .cy_out(cy_out),
    .result(result)
  );

    reg [7:0] patterns[0:17];
    integer i;

    initial begin
      patterns[0] = 8'b0_0_0_0_0_0_0_0;
      patterns[1] = 8'b0_0_0_0_0_1_1_0;
      patterns[2] = 8'b0_0_0_0_1_1_0_1;
      patterns[3] = 8'b0_0_0_1_0_0_1_0;
      patterns[4] = 8'b0_0_0_1_0_1_0_1;
      patterns[5] = 8'b0_0_0_1_1_1_1_1;
      patterns[6] = 8'b0_0_1_0_0_0_0_0;
      patterns[7] = 8'b0_0_1_0_0_1_1_0;
      patterns[8] = 8'b0_0_1_0_1_0_1_0;
      patterns[9] = 8'b0_0_1_0_1_1_0_0;
      patterns[10] = 8'b1_0_0_1_0_0_0_1;
      patterns[11] = 8'b1_0_0_1_0_1_0_1;
      patterns[12] = 8'b1_0_0_1_1_0_0_1;
      patterns[13] = 8'b1_0_0_1_1_1_1_1;
      patterns[14] = 8'b1_1_1_0_0_0_0_0;
      patterns[15] = 8'b1_1_1_0_0_1_1_0;
      patterns[16] = 8'b1_1_1_0_1_0_1_0;
      patterns[17] = 8'b1_1_1_0_1_1_1_0;

      for (i = 0; i < 18; i = i + 1)
      begin
        S = patterns[i][7];
        V = patterns[i][6];
        R = patterns[i][5];
        cy_in = patterns[i][4];
        op2 = patterns[i][3];
        op1 = patterns[i][2];
        #10;
        if (patterns[i][1] !== 1'hx)
        begin
          if (result !== patterns[i][1])
          begin
            $display("%d:result: (assertion error). Expected %h, found %h", i, patterns[i][1], result);
            $finish;
          end
        end
        if (patterns[i][0] !== 1'hx)
        begin
          if (cy_out !== patterns[i][0])
          begin
            $display("%d:cy_out: (assertion error). Expected %h, found %h", i, patterns[i][0], cy_out);
            $finish;
          end
        end
      end

      $display("All tests passed.");
    end
    endmodule
