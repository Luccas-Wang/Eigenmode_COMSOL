function plot_mat(A, img_size, varargin)
ip = inputParser;
ip.addParameter('plot_patch', 'false');
ip.addParameter('export', 'false');
ip.addParameter('hide', 'false');
ip.addParameter('fname', 'matrix');
ip.parse(varargin{:});

plot_patch=ip.Results.plot_patch;
export=ip.Results.export;
hide=ip.Results.hide;
fname=ip.Results.fname;

% if nargin<6
%     hide = 'false';
%     if nargin<5
%         fname = 'matrix';
%         if nargin<4
%             export = 'false';
%             if nargin<3
%                 plot_patch = 'false';
%             end
%         end
%     end
% end

A_ = kron(A,ones(round(img_size/size(A,1)),...
    round(img_size/size(A,2))));

if hide
    h_fig = figure('Visible', 'off');
    subplot_mat(A_, img_size,plot_patch, export, fname)
    close(h_fig);
else
    h_fig = figure('Visible', 'on');
    subplot_mat(A_, img_size,plot_patch, export, fname)
    %     close(h_fig);
end

end