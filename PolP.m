function y = PolP(m)
%PolP Auxiliary function used in the Cartan decomposition
%   
global g
global g_m
global g_l
global basis_m

k = PolQ(m);
y = logm(expm(g_l+g_m)/(expm(k)*expm(m)));

end