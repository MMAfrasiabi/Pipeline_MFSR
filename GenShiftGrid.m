function [dx_hat, dy_hat] = GenShiftGrid(r, LR)

% This function estimates shifts between LR images
% Input(s):
%          Flag_RealReg: determines ideal/practical registration
%          dx:           initial estimation of x axis shifts
%          dy:           initial estimation of y axis shifts
%          r:            up-scale factor
%          LR:           all input LR images
% Output(s):
%          dx_hat:       estimation of x axis shifts
%          dy_hat:       estimation of y axis shifts

%%
RegisterEst = r * RegisterImageSeq(LR);
dx_hat = RegisterEst(:,1).';
dy_hat = RegisterEst(:,2).';

end

