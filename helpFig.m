clc
border_x = ceil(max(abs(dx_hat)));
border_y = ceil(max(abs(dy_hat)));

%%
if (Flag_Bicubic)
    figure, imshow(uint8(Im_Bicubic))
    titleText = ['Bicubic, Scale:' num2str(r) ', LRs: ' num2str(numOfFrames)];
    title(titleText)
end

%%
if (Flag_SISR)
    figure, imshow(uint8(Im_SISR))
    titleText = ['SISR, Scale:' num2str(r) ', LRs: ' num2str(numOfFrames)];
    title(titleText)
end

%%
if (Flag_AF2S2 && r == 4)
    figure, imshow(uint8(shave(Im_M2S2, [border_y border_x])))
    titleText = ['AF2S2 Pipeline, Scale:' num2str(r) ', LRs: ' num2str(numOfFrames)];
    title(titleText)
end

%%
if Flag_SAF
    figure, imshow(uint8(shave(Im_SFML, [border_y, border_x])))
    titleText = ['SAF Pipeline, Scale:' num2str(r) ', LRs: ' num2str(numOfFrames)];
    title(titleText)
end

%%
if (Flag_OptPipeline_CurveFit)
    figure, imshow(uint8(Im_MFSL_CurveFit))
    titleText = ['Optimal Pipeline (CurveFit), Scale:' num2str(r) ', LRs: ' num2str(numOfFrames)];
    title(titleText)
end

%%
if (Flag_OptPipeline_ShiftAndAdd)
    figure, imshow(uint8(shave(Im_MFSL_ShiftAndAdd, [border_y border_x])))
    titleText = ['Optimal Pipeline (Shift-and-Add), Scale:' num2str(r) ', LRs: ' num2str(numOfFrames)];
    title(titleText)
end
