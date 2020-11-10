function u = map(v1)
%map Function whose 0s are mapped to solutions of the decomposition.
%   This function is a map from su(2^n) to itself. The elements are
%   provided by their coordinate vector. The zeros of this function lead to
%   solutions of the Cartan decomposition.

global basis_m;
global basis_l;

mat = 0;
for k = 1:size(basis_m,3)
    mat = mat + v1(k)*basis_m(:,:,k);
end

n = PolP(mat);

for j = 1:size(basis_m,3)
    u(j) = trace(n*basis_m(:,:,j));
end

u = real(u);

end

