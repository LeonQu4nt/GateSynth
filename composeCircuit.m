function str = composeCircuit(U,name,str)
%composeCircuit Writes the circuit of matrix U inside required file
%   
suGen;
global su2_l;
global su2_m;
global su2_h;
[A,B,K,F1,F2,H,M,N1,N2] = ModKhanejaGlaser(U);
%leftmost side of M circuit(CNOT+Rz)
CNOT = [1,0,0,0;0,1,0,0;0,0,0,1;0,0,1,0];
U_leftMA = kron(expm(1i*pi/4*Z),I)*CNOT;
%rightmost side of M circuit(CNOT + Rz + Ry + Rz)
U_rightMA = kron(expm(-1i*pi/4*Z),I)*CNOT;

A(:,:,2) = U_leftMA*A(:,:,2);
H = H/kron(U_leftMA,I);
A(:,:,3) = A(:,:,3)*U_rightMA;
H = kron(U_rightMA,I)\H;

formatSpecA = ['\n\ncircuit_A%u = QuantumCircuit(3)\n' ...
               'circuit_A%u.u3(%4.3f,%4.3f,%4.3f,2)\n' ...
               'circuit_A%u.u3(%4.3f,%4.3f,%4.3f,1)\n' ...
               'circuit_A%u.rz(pi/2,1)\n' ...
               'circuit_A%u.cx(1,2)\n' ...
               'circuit_A%u.rz(-2*(%4.3f)+pi/2,2)\n' ...
               'circuit_A%u.ry(pi/2-2*(%4.3f),1)\n' ...
               'circuit_A%u.cx(2,1)\n' ...
               'circuit_A%u.ry(2*(%4.3f)-pi/2,1)\n' ...
               'circuit_A%u.cx(1,2)\n' ...
               'circuit_A%u.rz(-pi/2,2)\n' ...
               'circuit_A%u.u3(%4.3f,%4.3f,%4.3f,2)\n' ...
               'circuit_A%u.u3(%4.3f,%4.3f,%4.3f,1)'];

position_index = [1,2,6,10,11,12,14,16,17,19,20,21,25];
x_all = [];
for k = 1:4
    x = [];
    for j = position_index
        x(j) = k;
    end
    [K0,K1,N0] = Cartan(A(:,:,k),su2_l,su2_m,su2_h);
    A01A02 = K1';
    A03A04 = K0*K1;
    [A01,A02] = kron_div(A01A02,2);
    [A03,A04] = kron_div(A03A04,2);
    [theta,phi,lambda] = squ(A01);
    x(3:5) = [theta,phi,lambda];
    [theta,phi,lambda] = squ(A02);
    x(7:9) = [theta,phi,lambda];
    anglesN0 = to_vect(logm(N0),su2_h);
    x(13) = anglesN0(3);
    x(15) = anglesN0(1);
    x(18) = anglesN0(2);
    [theta,phi,lambda] = squ(A03);
    x(22:24) = [theta,phi,lambda];
    [theta,phi,lambda] = squ(A04);
    x(26:28) = [theta,phi,lambda];
    x_all = [x_all,x'];
end
x_all(isnan(x_all)) = 0;
str = strcat(str,sprintf(formatSpecA,x_all));

formatSpecN = ['\n\ncircuit_N%u = QuantumCircuit(3)\n' ...
               'circuit_N%u.cx(2,0)\n' ...
               'circuit_N%u.rz(2*(%4.3f),0)\n' ...
               'circuit_N%u.cx(1,0)\n' ...
               'circuit_N%u.rz(2*(%4.3f),0)\n' ...
               'circuit_N%u.cx(2,0)\n' ...
               'circuit_N%u.rz(2*(%4.3f),0)\n' ...
               'circuit_N%u.cx(1,0)']
x_all = [];
N(:,1) = N1;
N(:,2) = N2;
position_index = [1,2,3,5,6,8,9,11];
for k = 1:2
    x = [];
    for j = position_index
        x(j) = k;
    end
    x(4) = N(2,k);
    x(7) = N(1,k);
    x(10) = N(3,k);
    x_all = [x_all,x'];
end
x_all(isnan(x_all)) = 0;
str = strcat(str,sprintf(formatSpecN,x_all));

formatSpecM = ['\n\ncircuit_M = QuantumCircuit(3)\n' ...
               'circuit_M.cx(2,0)\n' ...
               'circuit_M.ry(2*(%4.3f),2)\n' ...
               'circuit_M.cx(1,2)\n' ...
               'circuit_M.ry(-2*(%4.3f),2)\n' ...
               'circuit_M.cx(1,2)\n' ...
               'circuit_M.cx(2,0)\n' ...
               'circuit_M.rz(pi/2,0)\n' ...
               'circuit_M.cx(1,0)\n' ...
               'circuit_M.ry(-2*(%4.3f),0)\n' ...
               'circuit_M.cx(1,0)\n' ...
               'circuit_M.ry(-2*(%4.3f),0)\n' ...
               'circuit_M.rz(-pi/2,0)'];
x_all = [M(1),M(2),M(3),M(4)]';
x_all(isnan(x_all)) = 0;
str = strcat(str,sprintf(formatSpecM,x_all));

formatSpecB = ['\n\ncircuit_B%u = QuantumCircuit(3)\n' ...
               'circuit_B%u.rz(%4.3f,0)'];
x_all = [];
for k = [2,4]
    x = [];
    x(1) = k;
    x(2) = k;
    x(3) = angle(B(2,2,k));
    x_all = [x_all,x'];
end
x_all(isnan(x_all)) = 0;
str = strcat(str,sprintf(formatSpecB,x_all));
str = strcat(str,sprintf(['\n\n' name ' = circuit_A1+circuit_N1+circuit_B2+circuit_A2+circuit_M+circuit_A3+circuit_N2+circuit_B4+circuit_A4']));
end

