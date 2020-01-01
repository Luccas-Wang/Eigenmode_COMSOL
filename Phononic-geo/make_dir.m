function make_dir(dirs)
for idir = 1 : numel(dirs)    
    if ~isfolder(dirs{idir})
        mkdir(dirs{idir})
    end
end
end