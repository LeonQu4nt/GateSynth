function y = f_vm(K_vect)
%UNTITLED9 Summary of this function goes here
%   Detailed explanation goes here
global m;
global v;
global basis_l;
global basis_m;

K_gen = 0;
for k = 1:size(basis_l,3)
    K_gen = K_gen + K_vect(k)*basis_l(:,:,k);
end

K1 = expm(K_gen);
m_rot = K1'*m*K1;
y = real(to_vect(v,basis_m)*to_vect(m_rot,basis_m)');

end