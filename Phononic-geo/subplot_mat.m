function subplot_mat(A_, img_size,plot_patch, export, fname)
h = imshow(A_*50,[0,0,1;1,1,1]);
if plot_patch
    hold on;
    add_patch(img_size, 3, h);
end

if export
    axis equal
    box off
    axis off
    grid off
    
    imwrite(A_, [fname, '.png'])
    %     print(gcf, fname, '-dpng','-r300','-noui')
end
end