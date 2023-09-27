%% Running different SR methods

addpath([pwd '\third_party\LKOFlow']);

if (ch == 1)
    [dx_hat, dy_hat] = GenShiftGrid(r, LRs);
end

%% modify flags
if Flag_SISR
    Flag_Bicubic = 1;
end

%%
if Flag_Bicubic 
    fprintf('Bicubic \n')
    Im_Bicubic(:,:,ch) = imresize(LRs(:,:,1), r, 'cubic');
end

%%
if Flag_SISR 
    fprintf('SISR \n')
    Im_SISR(:,:,ch) = fSRCNN_artifacts(Im_Bicubic(:,:,ch) , r , model);
end

%%
if (Flag_AF2S2 && r == 4)
    
    dx_hat_Now = dx_hat / 2;
    dy_hat_Now = dy_hat / 2;
    
    fprintf('AF2S2 Pipeline\n')
    [Im_M2S2(:,:,ch)] = Method_AF2S2(dx_hat_Now, dy_hat_Now, LRs);
end

%%
if Flag_SAF
    fprintf('SAF Pipeline\n')
    [Im_SFML(:,:,ch)] = Method_SAF(dx_hat, dy_hat, LRs, r, model);
end

%%
if (Flag_OptPipeline_CurveFit)
    fprintf('Optimal Pipeline (Curve-Fit Version) \n')
    [Im_CurveFit(:,:,ch)] = Method_CurveFit(r, dx_hat, dy_hat, LRs);
    firstCrop = 1;
    [Im_MFSL_CurveFit(:,:,ch)] = Method_SISR(Im_CurveFit(:,:,ch), r, model, firstCrop);
end

%%
if (Flag_OptPipeline_ShiftAndAdd)
    fprintf('Optimal Pipeline (Shift-And-Add Version) \n')
    flagParams = 1;   
    [Im_MFSR(:,:,ch)] = Method_MFSR(dx_hat, dy_hat, LRs, r);
    [Im_MFSL_ShiftAndAdd(:,:,ch)] = fSRCNN_artifacts(Im_MFSR(:,:,ch) , r , model);
end


