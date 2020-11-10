% Create the relevant spaces

global su2;
global su2_m;
global su2_l;
global su2_h;
global su3_m;
global su3_l;
global su3_l0;
global su3_l1;
global su3_h;
global su3_f;
global X;
global Y;
global Z;
global I;

X = [0,1;1,0];
Y = [0,-1i;1i,0];
Z = [1,0;0,-1];
I = eye(2);
su2(:,:,1) = 1i*kron(X,X);
su2(:,:,2) = 1i*kron(Y,Y);
su2(:,:,3) = 1i*kron(Z,Z);
su2(:,:,4) = 1i*kron(X,Y);
su2(:,:,5) = 1i*kron(Y,Z);
su2(:,:,6) = 1i*kron(Z,X);
su2(:,:,7) = 1i*kron(X,Z);
su2(:,:,8) = 1i*kron(Y,X);
su2(:,:,9) = 1i*kron(Z,Y);
su2(:,:,10) = 1i*kron(X,I);
su2(:,:,11) = 1i*kron(Y,I);
su2(:,:,12) = 1i*kron(Z,I);
su2(:,:,13) = 1i*kron(I,X);
su2(:,:,14) = 1i*kron(I,Y);
su2(:,:,15) = 1i*kron(I,Z);

su2_m(:,:,1) = 1i*kron(X,X);
su2_m(:,:,2) = 1i*kron(Y,Y);
su2_m(:,:,3) = 1i*kron(Z,Z);
su2_m(:,:,4) = 1i*kron(X,Y);
su2_m(:,:,5) = 1i*kron(Y,Z);
su2_m(:,:,6) = 1i*kron(Z,X);
su2_m(:,:,7) = 1i*kron(X,Z);
su2_m(:,:,8) = 1i*kron(Y,X);
su2_m(:,:,9) = 1i*kron(Z,Y);

su2_l(:,:,1) = 1i*kron(X,I);
su2_l(:,:,2) = 1i*kron(Y,I);
su2_l(:,:,3) = 1i*kron(Z,I);
su2_l(:,:,4) = 1i*kron(I,X);
su2_l(:,:,5) = 1i*kron(I,Y);
su2_l(:,:,6) = 1i*kron(I,Z);

su2_h(:,:,1) = 1i*kron(X,X);
su2_h(:,:,2) = 1i*kron(Y,Y);
su2_h(:,:,3) = 1i*kron(Z,Z);

su3_h(:,:,1) = 1i*kron(X,kron(X,X));
su3_h(:,:,2) = 1i*kron(Y,kron(Y,X));
su3_h(:,:,3) = 1i*kron(Z,kron(Z,X));
su3_h(:,:,4) = 1i*kron(I,kron(I,X));

su3_f(:,:,1) = 1i*kron(Z,kron(Z,Z));
su3_f(:,:,2) = 1i*kron(Z,kron(I,Z));
su3_f(:,:,3) = 1i*kron(I,kron(Z,Z));

su3_m(:,:,1) = 1i*kron(I,kron(I,X));
su3_m(:,:,17) = 1i*kron(I,kron(I,Y));

for j = 1:15
    su3_m(:,:,j+1) = kron(su2(:,:,j),X);
    su3_m(:,:,j+17) = kron(su2(:,:,j),Y);
    su3_l0(:,:,j) = kron(su2(:,:,j),I);
    su3_l1(:,:,j) = kron(su2(:,:,j),Z);
    su3_l(:,:,1) = 1i*kron(kron(I,I),Z);
    su3_l(:,:,j+1) = kron(su2(:,:,j),Z);
    su3_l(:,:,j+16) = kron(su2(:,:, j),I);
end