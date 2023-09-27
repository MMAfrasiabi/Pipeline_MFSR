function [out] = Method_AF2S2(dx, dy, LRs)
% This function generates HR image by AF2S2 (r = 4)
% Input(s):
%          dx:         shifts between images (x axis)
%          dy:         shifts between images (y axis)
%          LRs:        input LR images
% Output(s):
%          out:        output HR image

%%
r1 = 2;
r2 = 2;
model = 'third_party\model\9-5-5(ImageNet)\x2.mat';
[out1] = Method_MFSR(dx, dy, LRs, r1);
temp = imresize(out1, r2, 'cubic');
firstCrop = 0;
[out] = Method_SISR(temp, r2, model, firstCrop);

end

