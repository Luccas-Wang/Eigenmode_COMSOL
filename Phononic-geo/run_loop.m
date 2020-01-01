% function [vr_original, vr_final, data] = run_loop(vr_original, vr_final, ...
%     data,X_scaled, x_n, y_n)
function [vr_original, vr_final, data] = run_loop(vr_original, vr_final, ...
    data,X_scaled, img_size, x_n, y_n, o_dir, f_dir, wb)
num_smp = size(X_scaled,1);
for i = 1 : num_smp
    waitbar( i/num_smp,wb, sprintf('Computing...   %3.1f %%',i/num_smp*100));
    A = build_cell(X_scaled(i,:), x_n, y_n,1,0.4);
    vr_original(i) = sum(sum(A))/numel(A);
    
    plot_mat(A, img_size,...
        'plot_patch', 'true','export', 'true',...
        'fname', [o_dir, num2str(i)], ...
        'hide','false')
    
    % fprintf('original soil volume ratio is %3.1f %%\n', sum(sum(A))/numel(A)*100)
    
    A = refine_matrix(A,2);
    vr_final(i) = sum(sum(A))/numel(A);
    data(i,:) = reshape(A,1,[]);
    
    plot_mat(A, img_size,...
        'plot_patch', 'true','export', 'true',...
        'fname', [f_dir,num2str(i)], ...
        'hide','false')
    
    % plot_mats(A, img_size,...
    %     'plot_patch', 'true','export', 'true', 'fname',[fig_dir,'final matrix array'], ...
    %     'hide','false')
    % fprintf('final soil volume ratio is %3.1f %%\n', sum(sum(A))/numel(A)*100)
    
end
end