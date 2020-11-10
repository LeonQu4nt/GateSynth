function k_l = PolQ(m)
%PolQ Auxiliary function used in the Cartan decomposition
%   
global g;
global basis_l;
global g_m;
global g_l;

k = logm(expm(g_m+g_l)*expm(-m));
k_l = 0;
for j = 1:size(basis_l,3)
    k_l = k_l+real(trace(k'*basis_l(:,:,j)))/trace(basis_l(:,:,j)'*basis_l(:,:,j))*basis_l(:,:,j);
end

end