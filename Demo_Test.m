%% Sample script for testing SR methods
% by: Mohammad Mahdi Afrasiabi
% email: m.m.afrasiabi@ut.ac.ir

%%
clc
clear
close all 

%% set parameters
r = 4; % up-scale factor

%% load dataset
load('RealDataset_Alpaca.mat')
% load('RealDataset_Book.mat')

%% set Methods for run
Flag_Bicubic                  = true;
Flag_SISR                     = true;
Flag_SAF                      = true;
Flag_AF2S2                    = true;
Flag_OptPipeline_ShiftAndAdd  = true;
Flag_OptPipeline_CurveFit     = true;

%% SRCNN Model
addpath([pwd '\third_party']);

switch r
    case 2
        model = 'third_party\model\9-5-5(ImageNet)\x2.mat';
    case 3
        model = 'third_party\model\9-5-5(ImageNet)\x3.mat';
    case 4
        model = 'third_party\model\9-5-5(ImageNet)\x4.mat';
end

%% run
if size(LR_all, 4) > 1
    numOfChannels = 3;
    numOfFrames = size(LR_all, 4);
else
    numOfChannels = 1;
    numOfFrames = size(LR_all, 3);
end

for ch = 1 : numOfChannels
    LRs(1:size(LR_all,1) , 1:size(LR_all,2) , 1:size(LR_all,4)) = LR_all(:,:,ch,:);
    helpFunc;
end 

helpFig;


