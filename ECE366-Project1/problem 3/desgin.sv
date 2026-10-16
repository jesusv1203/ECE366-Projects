// helper function 
// Represents each black square 

module combine_PG(P_new, G_new, P_old, G_old, Pout, Gout
);

  input P_new, G_new;
  input P_old, G_old;

  output Pout, Gout;

  wire temp;

    // Pout = P_new * P_old
  and (Pout, P_new, P_old);

    // Gout = G_new + P_new*G_old
  and (temp, P_new, G_old);
  or  (Gout, G_new, temp);

endmodule



module PPA(A, B, Cin, S, Cout);

  input [15:0] A, B;
  input Cin;

  output [15:0] S;
  output Cout;


    // represents all white blocks
    

  wire [15:0] P;
  wire [15:0] G;


  or  (P[0],  A[0],  B[0]);
  or  (P[1],  A[1],  B[1]);
  or  (P[2],  A[2],  B[2]);
  or  (P[3],  A[3],  B[3]);
  or  (P[4],  A[4],  B[4]);
  or  (P[5],  A[5],  B[5]);
  or  (P[6],  A[6],  B[6]);
  or  (P[7],  A[7],  B[7]);
  or  (P[8],  A[8],  B[8]);
  or  (P[9],  A[9],  B[9]);
  or  (P[10], A[10], B[10]);
  or  (P[11], A[11], B[11]);
  or  (P[12], A[12], B[12]);
  or  (P[13], A[13], B[13]);
  or  (P[14], A[14], B[14]);
  or  (P[15], A[15], B[15]);


  and (G[0],  A[0],  B[0]);
  and (G[1],  A[1],  B[1]);
  and (G[2],  A[2],  B[2]);
  and (G[3],  A[3],  B[3]);
  and (G[4],  A[4],  B[4]);
  and (G[5],  A[5],  B[5]);
  and (G[6],  A[6],  B[6]);
  and (G[7],  A[7],  B[7]);
  and (G[8],  A[8],  B[8]);
  and (G[9],  A[9],  B[9]);
  and (G[10], A[10], B[10]);
  and (G[11], A[11], B[11]);
  and (G[12], A[12], B[12]);
  and (G[13], A[13], B[13]);
  and (G[14], A[14], B[14]);
  and (G[15], A[15], B[15]);


    // negative white block 
    
  
  wire Pm1;
  wire Gm1;

  assign Pm1 = 1'b0;
  assign Gm1 = Cin;



    // PREFIX LEVEL 1

    

  wire P14_13, G14_13;
  wire P12_11, G12_11;
  wire P10_9,  G10_9;
  wire P8_7,   G8_7;
  wire P6_5,   G6_5;
  wire P4_3,   G4_3;
  wire P2_1,   G2_1;
  wire P0_m1,  G0_m1;


  combine_PG L1_0(P[14], G[14], P[13], G[13], P14_13, G14_13);

  combine_PG L1_1(P[12], G[12], P[11], G[11], P12_11, G12_11);

  combine_PG L1_2(P[10], G[10], P[9], G[9], P10_9, G10_9);

  combine_PG L1_3(P[8], G[8], P[7], G[7], P8_7, G8_7);

  combine_PG L1_4(P[6], G[6], P[5], G[5], P6_5, G6_5);

  combine_PG L1_5(P[4], G[4], P[3], G[3], P4_3, G4_3);

  combine_PG L1_6( P[2], G[2], P[1], G[1], P2_1, G2_1);

  combine_PG L1_7(P[0], G[0], Pm1, Gm1, P0_m1, G0_m1);
    
    // PREFIX LEVEL 2
  
  wire P14_11, G14_11;
  wire P13_11, G13_11;
  wire P10_7, G10_7;
  wire P9_7,  G9_7;
  wire P6_3, G6_3;
  wire P5_3, G5_3;
  wire P2_m1, G2_m1;
  wire P1_m1, G1_m1;


  combine_PG L2_0(P14_13, G14_13, P12_11, G12_11, P14_11, G14_11);

  combine_PG L2_1(P[13], G[13], P12_11, G12_11, P13_11, G13_11);

  combine_PG L2_2(P10_9, G10_9, P8_7, G8_7, P10_7, G10_7);

  combine_PG L2_3(P[9], G[9], P8_7, G8_7, P9_7, G9_7);

  combine_PG L2_4(P6_5, G6_5, P4_3, G4_3, P6_3, G6_3);

  combine_PG L2_5(P[5], G[5], P4_3, G4_3, P5_3, G5_3);

  combine_PG L2_6(P2_1, G2_1, P0_m1, G0_m1, P2_m1, G2_m1);

  combine_PG L2_7(P[1], G[1], P0_m1, G0_m1, P1_m1, G1_m1);

    // PREFIX LEVEL 3
    
  
  wire P14_7, G14_7;
  wire P13_7, G13_7;
  wire P12_7, G12_7;
  wire P11_7, G11_7;
  wire P6_m1, G6_m1;
  wire P5_m1, G5_m1;
  wire P4_m1, G4_m1;
  wire P3_m1, G3_m1;
  

  combine_PG L3_0(P14_11, G14_11, P10_7, G10_7, P14_7, G14_7);

  combine_PG L3_1(P13_11, G13_11, P10_7, G10_7, P13_7, G13_7);

  combine_PG L3_2(P12_11, G12_11, P10_7, G10_7, P12_7, G12_7);

  combine_PG L3_3(P[11], G[11], P10_7, G10_7, P11_7, G11_7);
  
  combine_PG L3_4(P6_3, G6_3, P2_m1, G2_m1, P6_m1, G6_m1);

  combine_PG L3_5(P5_3, G5_3, P2_m1, G2_m1, P5_m1, G5_m1);

  combine_PG L3_6(P4_3, G4_3, P2_m1, G2_m1, P4_m1, G4_m1);

  combine_PG L3_7(P[3], G[3], P2_m1, G2_m1, P3_m1, G3_m1);

    // PREFIX LEVEL 4
    
  wire P14_m1, G14_m1;
  wire P13_m1, G13_m1;
  wire P12_m1, G12_m1;
  wire P11_m1, G11_m1;
  wire P10_m1, G10_m1;
  wire P9_m1,  G9_m1;
  wire P8_m1,  G8_m1;
  wire P7_m1,  G7_m1;


  combine_PG L4_0(P14_7, G14_7, P6_m1, G6_m1, P14_m1, G14_m1);

  combine_PG L4_1(P13_7, G13_7, P6_m1, G6_m1, P13_m1, G13_m1);

  combine_PG L4_2(P12_7, G12_7, P6_m1, G6_m1, P12_m1, G12_m1);

  combine_PG L4_3(P11_7, G11_7, P6_m1, G6_m1, P11_m1, G11_m1);

  combine_PG L4_4(P10_7, G10_7, P6_m1, G6_m1, P10_m1, G10_m1);

  combine_PG L4_5(P9_7, G9_7, P6_m1, G6_m1, P9_m1, G9_m1);

  combine_PG L4_6(P8_7, G8_7, P6_m1, G6_m1, P8_m1, G8_m1);

  combine_PG L4_7(P[7], G[7], P6_m1, G6_m1, P7_m1, G7_m1);

   // curved blocks 
  // Si = G(i-1:-1) XOR (Ai XOR Bi)
   
    wire [15:0] AxorB;

    xor (AxorB[0],  A[0],  B[0]);
    xor (AxorB[1],  A[1],  B[1]);
    xor (AxorB[2],  A[2],  B[2]);
    xor (AxorB[3],  A[3],  B[3]);
    xor (AxorB[4],  A[4],  B[4]);
    xor (AxorB[5],  A[5],  B[5]);
    xor (AxorB[6],  A[6],  B[6]);
    xor (AxorB[7],  A[7],  B[7]);
    xor (AxorB[8],  A[8],  B[8]);
    xor (AxorB[9],  A[9],  B[9]);
    xor (AxorB[10], A[10], B[10]);
    xor (AxorB[11], A[11], B[11]);
    xor (AxorB[12], A[12], B[12]);
    xor (AxorB[13], A[13], B[13]);
    xor (AxorB[14], A[14], B[14]);
    xor (AxorB[15], A[15], B[15]);


    // S0 uses G(-1) = Cin
    xor (S[0], AxorB[0], Cin);

    // S1 uses G(0:-1)
    xor (S[1], AxorB[1], G0_m1);

    // S2 uses G(1:-1)
    xor (S[2], AxorB[2], G1_m1);

    // S3 uses G(2:-1)
    xor (S[3], AxorB[3], G2_m1);

    // S4 uses G(3:-1)
    xor (S[4], AxorB[4], G3_m1);

    // S5 uses G(4:-1)
    xor (S[5], AxorB[5], G4_m1);

    // S6 uses G(5:-1)
    xor (S[6], AxorB[6], G5_m1);

    // S7 uses G(6:-1)
    xor (S[7], AxorB[7], G6_m1);

    // S8 uses G(7:-1)
    xor (S[8], AxorB[8], G7_m1);

    // S9 uses G(8:-1)
    xor (S[9], AxorB[9], G8_m1);

    // S10 uses G(9:-1)
    xor (S[10], AxorB[10], G9_m1);

    // S11 uses G(10:-1)
    xor (S[11], AxorB[11], G10_m1);

    // S12 uses G(11:-1)
    xor (S[12], AxorB[12], G11_m1);

    // S13 uses G(12:-1)
    xor (S[13], AxorB[13], G12_m1);

    // S14 uses G(13:-1)
    xor (S[14], AxorB[14], G13_m1);

    // S15 uses G(14:-1)
    xor (S[15], AxorB[15], G14_m1);


    // FINAL CARRY-OUT
    
    wire cout_temp;

    and (cout_temp, P[15], G14_m1);
    or  (Cout, G[15], cout_temp);

endmodule