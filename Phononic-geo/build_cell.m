function A = build_cell(smp, x_n, y_n, add_prior, pr)
if nargin<5
    pr = 0.2;
    if nargin<4
        add_prior = 0;
    end
end

smp = reshape(smp,[x_n,y_n]);

if add_prior == 1
    %     method 1
    smp(round((1-pr)*x_n):x_n,1:round(pr*y_n)) = 0;
    %     method 2
%     smp(round((1-pr)*x_n):x_n,1:round(pr*y_n)) =...
%         smp(round((1-pr)*x_n):x_n,1:round(pr*y_n)) - 1;
%     smp(smp==-1) = 1;
end

smp_lt = flip(smp,2);
smp_lb = flip(smp_lt);
smp_rb = flip(smp);

A = [smp_lt, smp; smp_lb, smp_rb];
end