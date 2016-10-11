
%% Exercise 1 - (eigenvalues)

% Random square matrix A
A = rand(10);

% V = eigenvectors, D = eigenvalues of A
[V, D] = eig(A);
D = diag(D);

% B is the dot product of A and its first eigenvector
B = A * V(:,1);
B = B'

% C is the product of  the first eigenvector and its eigenvalue
C = D(1) * V(:,1);
C = C'

% A*v_i = lambda*v_i


