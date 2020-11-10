function [A,B] = kron_div(C,n)
%kron_div Decomposes C in SU(n) X SU(m) in A and B such that kron(A,B) = C
%   With the assumption that A and B exist such that C = kron(A,B),
%   calculates matrices A and B for given C. 

m = size(C,1)/n; % compute complementary dimension
B = C(1:n,1:n); % take top-left corner as matrix B
% Turn B unitary, given that B*B' is a constant times the identity
DB = B*B';
modB = sqrt(DB(1,1));
B = B/modB;
B = B/exp(1i*angle(B(1,1)));

eps = 0.0001;
A = zeros(m);

for i = 1:n;
    if abs(B(i,1))>eps
        d = i;
        break
    end
end

%Use nonzero element B(d,1) to construct matrix A.

for i = 1:m;
    for j = 1:m;
        A(i,j) = C((i-1)*n+d,(j-1)*n+1)/B(d,1);
    end
end

%Make A unitary
DA = A*A';
modA = sqrt(DA(1,1));
A = A/modA;

end

