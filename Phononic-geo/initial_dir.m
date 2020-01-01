fig_dir = 'fig/';
data_dir = 'export/';
original_dir = [fig_dir,'original/'];
final_dir = [fig_dir,'final/'];
dirs = {fig_dir, data_dir, original_dir, final_dir};

make_dir(dirs)

%
% hwait=waitbar(0,'>>>>>>>>');