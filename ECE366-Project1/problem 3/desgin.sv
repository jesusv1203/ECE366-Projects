module PPA(A, B, Cin, S, Cout);

input [15:0] A, B;
input Cin;
output [15:0] S;
output Cout;

wire [15:0] P, G;

wire [15:0] P1, G1;
wire [15:0] P2, G2;
wire [15:0] P3, G3;
wire [15:0] P4, G4;

wire [15:0] C;

assign P = A | B;
assign G = A & B;

genvar i;

generate
    for (i = 0; i < 16; i = i + 1) begin
        if (i == 0) begin
            assign P1[i] = P[i] & 1'b0;
            assign G1[i] = G[i] | (P[i] & Cin);
        end
        else if (i % 2 == 0) begin
            assign P1[i] = P[i] & P[i-1];
            assign G1[i] = G[i] | (P[i] & G[i-1]);
        end
        else begin
            assign P1[i] = P[i];
            assign G1[i] = G[i];
        end
    end
endgenerate

generate
    for (i = 0; i < 16; i = i + 1) begin
        if ((i % 4 == 1 || i % 4 == 2) && i >= 1) begin
            assign P2[i] = P1[i] & P1[(i/4)*4];
            assign G2[i] = G1[i] |
                         (P1[i] & G1[(i/4)*4]);
        end
        else begin
            assign P2[i] = P1[i];
            assign G2[i] = G1[i];
        end
    end
endgenerate

generate
    for (i = 0; i < 16; i = i + 1) begin
        if (i % 8 >= 3 && i % 8 <= 6) begin
            assign P3[i] = P2[i] & P2[(i/8)*8+2];
            assign G3[i] = G2[i] |
                         (P2[i] & G2[(i/8)*8+2]);
        end
        else begin
            assign P3[i] = P2[i];
            assign G3[i] = G2[i];
        end
    end
endgenerate

generate
    for (i = 0; i < 16; i = i + 1) begin
        if (i >= 7 && i <= 14) begin
            assign P4[i] = P3[i] & P3[6];
            assign G4[i] = G3[i] |
                         (P3[i] & G3[6]);
        end
        else begin
            assign P4[i] = P3[i];
            assign G4[i] = G3[i];
        end
    end
endgenerate

assign C[0] = Cin;

generate
    for (i = 1; i < 16; i = i + 1) begin
        assign C[i] = G4[i-1];
    end
endgenerate

assign S = A ^ B ^ C;

assign Cout = G[15] | (P[15] & C[15]);

endmodule
