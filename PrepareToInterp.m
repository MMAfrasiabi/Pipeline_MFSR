function [X_sc, Y_sc, I_sc] = PrepareToInterp(nn, mm, r, dx_hat, dy_hat, LRs)
% This function generates grids to use in MFSL ComSR (curve-fit version) method
% Input(s):
%          nn:          number of samples in HR grid (x axis)
%          mm:          number of samples in HR grid (y axis)
%          r:           up-scale factor
%          dx_hat:      estimated shifts between LR images in x axis
%          dy_hat:      estimated shifts between LR images in y axis
%          LRs:         input LR images
% Output(s):
%          X_sc:        X grid
%          Y_sc:        Y grid
%          I_sc:        Image value grid

%%
nLR = length(dx_hat);
tx_hat = repmat(dx_hat,1,nn) + rectpulse((0:nn-1) , nLR);
ty_hat = repmat(dy_hat,1,mm) + rectpulse((0:mm-1) , nLR);

[Xq_hat, Yq_hat] = meshgrid(ty_hat, tx_hat);

%%
X_sc = [];
Y_sc = [];
I_sc = [];

J = zeros(nn * nLR , mm * nLR);

for k = 1:nLR
    J(k:nLR:end , k:nLR:end) = imresize(LRs(:,:,k), r);
end

for ii = 1:size(J, 2)
    k = mod(ii, nLR);
    if k == 0
        k = nLR;
    end
    X_sc = [X_sc Xq_hat(k:nLR:end, ii)];
    Y_sc = [Y_sc Yq_hat(k:nLR:end, ii)];
    I_sc = [I_sc      J(k:nLR:end, ii)];
    
end

end

