function A = refine_matrix(A, loops, img_size)
if nargin<3
    img_size = 1000;
elseif nargin<2
    loops =3;
end
for loop = 1:loops
    %     B = adjoint_matrix(A);
    %     C = adjoint_matrix(B);

    B = adjoint_matrix(A);
    for i = 1:size(A,2)
        for j = 1:size(A,2)
            if A(i,j)== 1
                if B(i,j) <= 1
                    A(i,j) = 0;
                end
            end
        end
    end
    
%     B = adjoint_matrix(A);
    for i = 1:size(A,2)
        for j = 1:size(A,2)
%             B = adjoint_matrix(A);
            if A(i,j)== 0
                if B(i,j) >= 3
                    A(i,j) = 1;
                end
            end
        end
    end
    
    C = adjoint_matrix(B);
    for i = 2:size(A,2)-1
        for j = 2:size(A,2)-1
            %             C = adjoint_matrix(B);
            %             if A(i,j)== 0
            %                 if C(i,j) >= 7
            %                     A(i,j) = 1;
            %                 end
            %             end
            if A(i,j)== 1
                if  C(i,j) <= 6
                    A(i,j) = 0;
                end
            end
        end
    end
%     plot_mat(A, img_size, 1)
%     title(['modified matrix at loop=',num2str(loop)])
end
