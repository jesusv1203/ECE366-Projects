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