

module PPA_tb;

  reg [15:0] A, B;
  reg Cin;

  wire [15:0] S;
  wire Cout;
    
  PPA DUT (.A(A), .B(B), .Cin(Cin), .S(S), .Cout(Cout));

    initial begin

        $dumpfile("dump.vcd");
        $dumpvars(1, PPA_tb);


        A = 16'h0003;
        B = 16'h0004;
        Cin = 1'b0;
        #10;



        A = 16'h0007;
        B = 16'h0003;
        Cin = 1'b1;
        #10;



        A = 16'hFFFD;
        B = 16'h0002;
        Cin = 1'b0;
        #10;
        
        A = 16'h0FFF;
        B = 16'h0001;
        Cin = 1'b0;
        #10;

        A = 16'hFFFF;
        B = 16'h0001;
        Cin = 1'b0;
        #10;


        $finish;

    end

endmodule