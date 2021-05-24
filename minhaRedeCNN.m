Tabela=normaImageSize(novaT);

idx=validaIdx(Tabela);   

for i = size(Tabela,1)
  Tabela.Image{i,1}=im2double(Tabela.Image{i,1});      
end

Tabela.mosca=categorical(Tabela.mosca);

layers = [
    imageInputLayer([26 30 3])
   
%     convolution2dLayer(2,8,'Padding','same')
%     batchNormalizationLayer
%     reluLayer
% %     
%     convolution2dLayer(2,8,'Padding','same')
%     batchNormalizationLayer
%     reluLayer
% %     
%     convolution2dLayer(2,8,'Padding','same')
%     batchNormalizationLayer
%     reluLayer
%     
%     convolution2dLayer(2,8,'Padding','same')
%     batchNormalizationLayer
%     reluLayer
% %     
    convolution2dLayer(2,8,'Padding','same')
    batchNormalizationLayer
    reluLayer
    
    maxPooling2dLayer(2,'Stride',2)
    
    convolution2dLayer(2,16,'Padding','same')
    batchNormalizationLayer
    reluLayer
% % %     
    maxPooling2dLayer(2,'Stride',2)
    
    convolution2dLayer(2,32,'Padding','same')
    batchNormalizationLayer
    reluLayer
% % %     
    maxPooling2dLayer(2,'Stride',2)
    
    convolution2dLayer(2,32,'Padding','same')
    batchNormalizationLayer
    reluLayer
% % %     
    maxPooling2dLayer(2,'Stride',2)
    
    convolution2dLayer(2,32,'Padding','same')
    batchNormalizationLayer
    reluLayer
% %     
%     maxPooling2dLayer(2,'Stride',2)
    
%     convolution2dLayer(2,32,'Padding','same')
%     batchNormalizationLayer
%     reluLayer
% %     
%     maxPooling2dLayer(2,'Stride',2)
    
%     convolution2dLayer(2,32,'Padding','same')
%     batchNormalizationLayer
%     reluLayer
% %     
%     convolution2dLayer(2,32,'Padding','same')
%     batchNormalizationLayer
%     reluLayer
% %     
%     convolution2dLayer(2,32,'Padding','same')
%     batchNormalizationLayer
%     reluLayer
% %     
%     convolution2dLayer(2,32,'Padding','same')
%     batchNormalizationLayer
%     reluLayer
% %     
%     convolution2dLayer(2,32,'Padding','same')
%     batchNormalizationLayer
%     reluLayer
    
    fullyConnectedLayer(2)
    softmaxLayer
    classificationLayer];


options = trainingOptions('adam', ...
    'InitialLearnRate',0.01, ...
    'MaxEpochs',10, ...
    'Shuffle','every-epoch', ...
    'ValidationFrequency',30, ...
    'Verbose',false, ...
    'Plots','none');
%     'Plots','training-progress');

accuracy=[];

for i = 1:10

idTreino = setdiff(idx, idx(i,:)).';
idTeste = idx(i,:);

% digitDatasetPath = fullfile(matlabroot,'toolbox','nnet','nndemos', ...
%     'nndatasets','DigitDataset');
% imds = imageDatastore(digitDatasetPath, ...
%     'IncludeSubfolders',true,'LabelSource','foldernames');
% 
% numTrainFiles = 750;
% [imdsTrain,imdsValidation] = splitEachLabel(imds,numTrainFiles,'randomize');

imgTreino=Tabela(idTreino,:);
imgTeste=Tabela(idTeste,:);


net = trainNetwork(imgTreino,layers,options);
YPred = classify(net,imgTeste);
accuracy = [accuracy, sum(YPred == imgTeste.mosca)/numel(imgTeste.mosca)];

end

if ~(exist( 'results', 'var'))
        results = [];
end    
acc=mean(accuracy);
results= [results, {acc, layers, options, net}];
load handel
sound(y,Fs)
%% 
% planilhaResultados=reshape(results,4, []).';