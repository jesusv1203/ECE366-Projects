`timescale 1ns/1ps

module four_bit_RCA_RCS_tb;

    reg [3:0] A, B;
    reg Cin;

    wire [3:0] S;
    wire Cout;
    
    four_bit_RCA_RCS uut (
        .A(A),
        .B(B),
        .Cin(Cin),
        .S(S),
        .Cout(Cout)
    );

    initial begin

        $dumpfile("dump.vcd");
        $dumpvars(0, four_bit_RCA_RCS_tb);

        A = 4'b0011;
        B = 4'b0100;
        Cin = 1'b0;
    	#10;
      
        A = 4'b0111;
        B = 4'b0011;
        Cin = 1'b1;
        #10;

		A = 4'b1101;    
        B = 4'b0010;    
        Cin = 1'b0;
        #10;
      
        A = 4'b0010;    
        B = 4'b1101;   
        Cin = 1'b1;
        #10;
      
        A = 4'b1111;   
        B = 4'b0001;    
        Cin = 1'b0;
        #10;

        $finish;

    end

endmodule
