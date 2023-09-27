function [Vq] = Method_CurveFit(r, dx_hat, dy_hat, LRs)
% This function generates HR image by MFSL ComSR (curve-fit version) method
% Input(s):
%          r:           up-scale factor
%          dx_hat:      estimated shifts between LR images in x axis
%          dy_hat:      estimated shifts between LR images in y axis
%          LRs:         input LR images
% Output(s):
%          Vq:          output HR image

%%
nn = r * size(LRs,1);
mm = r * size(LRs,2);
[X,Y] = meshgrid((0:mm-1), (0:nn-1));

%%    
[X_sc, Y_sc, I_sc] = PrepareToInterp(nn, mm, r, dx_hat, dy_hat, LRs);
fitobject = fit([X_sc(:), Y_sc(:)], I_sc(:), 'cubicinterp');
vq_fit = fitobject(X(:), Y(:));
Vq = reshape(vq_fit, nn, mm);


end

