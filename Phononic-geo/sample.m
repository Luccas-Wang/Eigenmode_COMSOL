clc
clear
close all
cd /Users/luke/OneDrive/Documents/Phononic-geo
% cd  C:\Users\wangq\OneDrive\Documents\Phononic\

initial_dir;
img_size = 500;
p=0.5;
fig_dir = 'fig/';

num_smp = 5;

% refinement = [4, 5, 6,7, 8, 9,10];

refinement = [50,100];

% wb = waitbar(0, 'Starting...   ');
for case_ = 1:numel(refinement)
    x_n = refinement(case_); y_n = refinement(case_);
    o_dir = [original_dir, num2str(x_n),'/'];
    f_dir = [final_dir, num2str(x_n),'/'];
    dirs = {o_dir, f_dir};
    make_dir(dirs)
    
    % latin hypercubic sampling
    X_scaled = generate_sample_lhs(num_smp, x_n,y_n,0.4);
    vr_original = zeros(num_smp,1); vr_final = zeros(num_smp);
    data = zeros(num_smp,x_n*y_n*4);
    
    wb = waitbar(0, 'Starting...   ');
    % modify the matrix / add prior experience
    [vr_original, vr_final, data] = run_loop(vr_original, vr_final, ...
        data,X_scaled, img_size, x_n, y_n, o_dir, f_dir, wb);
%     [vr_original, vr_final, data] = run_loop(vr_original, vr_final, ...
%     data,X_scaled, x_n, y_n);
    
    vr = [vr_original,vr_final];
    save(sprintf([data_dir,'vr_%s.mat'],num2str(case_)),'vr')
    save(sprintf([data_dir,'data_%s.mat'],num2str(case_)),'data')
    waitbar( i/numel(refinement),wb, sprintf('Computing...   %3.1f %%',i/numel(refinement)*100));
    close(wb)
end
% close(wb)
% figure
% h=imshow(kron(B,ones(50,50)),colormap(parula(5)))
% colorbar
% title('adjoint matrix')


% figure
% h=imshow(kron(A,ones(50,50))*50,colormap(jet))
% title('modified matrix')

% black is inclusion
% white is soil