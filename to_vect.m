function v = to_vect(M,basis)
%to_vect Takes a matrix and a subspace as input and outputs the coordinates
for k=1:size(basis,3)
    v(k) = trace(M'*basis(:,:,k))/trace(basis(:,:,k)'*basis(:,:,k));
end
end

