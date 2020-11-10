function [theta,phi,lambda] = squ(A)
%squ Provides angles neccesary in the implementation of single qubit
%unitaries
%   This function takes a single qubit unitary as input and outputs the
%   angles used by Qiskit to identify the gate. Further documentation about
%   their meaning can be found on the IBM Q Experience website.
alpha = angle(A(1,1));
A = A/exp(1i*alpha);
theta = 2*acos(A(1,1));
lambda = angle(-A(1,2)/sin(theta/2));
phi = angle(A(2,1)/sin(theta/2));
end

