function [out] = Method_MFSR(dx, dy, LRs, r)
% This function generates HR image by MFSR method
% Input(s):
%          dx:         shifts between images (x axis)
%          dy:         shifts between images (y axis)
%          LRs:        input LR images
%          r:          up-scale factor
% Output(s):
%          out:       output HR image

%% prepare
nn = size(LRs, 1) * r; % better than size(HR, 1) when r1*r2
mm = size(LRs, 2) * r;
[X,Y] = meshgrid((0:mm-1), (0:nn-1));

%% correct shifts
for k = 1:size(LRs, 3)
    temp = imresize(LRs(:,:,k), r, 'cubic');
    V_modified(:,:,k) = interp2(X + dx(k), Y + dy(k), temp, X, Y, 'spline');
end

%% average
out = mean(V_modified, 3);

end

