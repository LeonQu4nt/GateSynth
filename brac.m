function z = brac(x,y)
%brac Computes the commutator of x and y.
%   Given two compatible arrays x and y, computes their commutator under regular matrix multiplication [x,y].
z = x*y-y*x;
end

