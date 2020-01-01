function B = adjoint_matrix(A)
% Calculate adjoint matrix of A

% add boundary
A_full = [
    0, A(end,:), 0;
    A(:,end), A, A(:,1);
    0, A(1,:), 0;
    ];

% define adjoint matrix
B = zeros(size(A));
for i = 1:size(A,2)
    for j = 1:size(A,2)
        B(i,j) = A_full(i+1,j) + A_full(i+1,j+2) + ...
                 A_full(i,j+1) + A_full(i+2,j+1);
    end
end
