function [out] = Method_SISR(In, r, model, firstCrop)
% This function generates HR image by SRCNN method
% Input(s):
%          In:         input LR image
%          r:          up-scale factor
%          model:      model used in SRCNN method 
%          firstCrop:  flag that determines initial cropping of image
% Output(s):
%          out:        output HR image

%%
if firstCrop
    In = shave(In, [1 1]);
end

out = fSRCNN_artifacts(In , r , model);

end
