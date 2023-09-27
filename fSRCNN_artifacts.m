function im_h = fSRCNN_artifacts(im, up_scale, model)
% This function generates HR image by SRCNN method
% Input(s):
%          im:         input LR image
%          up_scale:   up-scale factor
%          model:      model used in SRCNN method 
% Output(s):
%          im_h:       output HR image

%%
im = modcrop(im, up_scale);
im = im/255.0;
im_h = SRCNN(model, im);
im_h = shave((im_h * 255), [up_scale, up_scale]);

end