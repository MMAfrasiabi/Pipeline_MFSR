function [out] = Method_SAF(dx, dy, LR, r, model)
% This function generates HR image by SAF Pipeline 
% Input(s):
%          dx:         shifts between images (x axis)
%          dy:         shifts between images (y axis)
%          LR:         input LR images
%          r:          up-scale factor
%          model:      model used in SRCNN method 
% Output(s):
%          out:        output HR image

%%
nn = r * size(LR,1);
mm = r * size(LR,2);

[X,Y] = meshgrid((0:mm-1), (0:nn-1)); 

for k = 1:size(LR, 3)
    im_b = imresize(LR(:,:,k), r, 'cubic');
    firstCrop = 0;
    [temp] = Method_SISR(im_b, r, model, firstCrop);
    TEMP_modified(:,:,k) = interp2(shave(X, [r r]) + dx(k), shave(Y, [r r]) + dy(k), temp, shave(X, [r r]), shave(Y, [r r]), 'spline');
end

out = mean(TEMP_modified, 3);

end

