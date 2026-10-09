

module CLA_tb;

  reg [31:0] A, B;
    reg Cin;

  wire [31:0] S;
    wire Cout;
    
    CLA DUT (
        .A(A),
        .B(B),
        .Cin(Cin),
        .S(S),
        .Cout(Cout)
    );

    initial begin

        $dumpfile("dump.vcd");
        $dumpvars(0, CLA_tb);

        A = 32'h00000003;
        B = 32'h00000004;
        Cin = 1'b0;
    	#10;
      
        A = 32'h00000007;
        B = 32'h00000003;
        Cin = 1'b1;
        #10;

		A = 32'hFFFFFFFD;
        B = 32'h00000002;   
        Cin = 1'b0;
        #10;
      
         A = 32'h0000FFFF;
        B = 32'h00000001;
        Cin = 1'b1;
        #10;
      
         A = 32'hFFFFFFFF;
        B = 32'h00000001;   
        Cin = 1'b0;
        #10;

        $finish;

    end

endmodule