function [A,B,K,F1,F2,H,M,N1,N2] = ModKhanejaGlaser(U)
%ModKhanejaGlaser Decomposes arbitrary 3 qubit unitary
%   This function uses the Modified Khaneja Glaser protocol to decompose a
%   matrix U in SU(8). The decomposed form reads: U = K1*F1*K2*H*K3*F2*K4.
%   It also provides gates A,B and angles N1,N2,M for the construction of
%   the associated circuit. The circuit numbering is reversed compared to
%   the product decomposition (eg. N1 is used to build F2, A1+B1 construct
%   K4).

%Build subspaces
suGen;

%Compute first order decomposition
[K0,K1,H] = Cartan(U,su3_l,su3_m,su3_h);
h = logm(H);

%Compute second order decompositions
[Ka1,Kb1,F1] = Cartan(K0*K1,su3_l0,su3_l1,su3_f);
K(:,:,1) = Ka1*Kb1;
K(:,:,2) = Kb1';
f1 = logm(F1);

[Ka2,Kb2,F2] = Cartan(K1',su3_l0,su3_l1,su3_f);
K(:,:,3) = Ka2*Kb2;
K(:,:,4) = Kb2';
f2 = logm(F2);

%Compute A,B matrices and angles describing N1,N2,M 3-qubit gates
%Indices are in reversed order in circuit notation
for i = 1:4
    [A0,B0] = kron_div(K(:,:,5-i),2);
    A(:,:,i) = round(A0,4);
    B(:,:,i) = round(B0,4);
    M(i) = round(trace(h'*su3_h(:,:,i))/trace(su3_h(:,:,i)'*su3_h(:,:,i)),6);
end

for i =1:3
    N2(i) = round(trace(f1*su3_f(:,:,i))/trace(su3_f(:,:,i)'*su3_f(:,:,i)),6);
    N1(i) = round(trace(f2*su3_f(:,:,i))/trace(su3_f(:,:,i)'*su3_f(:,:,i)),6);
end

end

