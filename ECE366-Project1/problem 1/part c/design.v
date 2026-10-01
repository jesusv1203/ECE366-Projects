 module one_bit_full_adder(A, B, Cin, S, Cout);

   input A, B, Cin;
   output S, Cout;
   wire temp1, temp2, temp3, temp4;
   
   xor xor1(temp1, A , B);
   xor xor2(S,  temp1, Cin);
   
   and and1(temp2, A, Cin);
   and and2(temp3, B, Cin);
   and and3(temp4, A, B);
   
   or or_out(Cout, temp2, temp3, temp4);
   
 endmodule

module four_bit_RCA_RCS(A, B, Cin, S, Cout);
 
  input [3:0] A, B;
  input Cin;
  output [3:0] S;
  output Cout;
  
  wire c1, c2, c3;
  
  one_bit_full_adder fa0(A[0], B[0], Cin, S[0], c1);
  one_bit_full_adder fa1(A[1], B[1], c1, S[1], c2);
  one_bit_full_adder fa2(A[2], B[2], c2, S[2], c3);
  one_bit_full_adder fa3(A[3], B[3], c3, S[3], Cout);
  
  
  
  
   
endmodule