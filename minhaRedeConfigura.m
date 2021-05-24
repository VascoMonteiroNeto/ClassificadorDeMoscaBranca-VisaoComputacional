function [minhaNet] = minhaRedeConfigura(allX)
    
    numLayers = input('Num camadas escondidas(1,2): ');
    
    numVars = size(allX,1);

    numNeurons = 6;
    numNeurons2 = floor(numNeurons/2);
    
    %Cria rede de acordo com o número de camadas
    
    if numLayers == 1
        minhaNet = feedforwardnet([numNeurons]); %1 camada
%        minhaNet = patternnet([numNeurons+2]); %1 camada
    else
        minhaNet = feedforwardnet([numNeurons+2, numNeurons2+2]);
    end    

    %Set funções de ativação
    
    funcAtivacao={'tansig', 'logsig', 'softmax'};
    
    if numLayers==1        
        IdxCamada1=input('\nFunção de ativação 1:\ntansig(1)\nlogsig(2)\nsoftmax(3)\n');
        IdxCamadaOutput=input('Output:\ntansig(1)\nlogsig(2)\nsoftmax(3)\n');
        
        minhaNet.layers{1}.transferFcn = funcAtivacao{IdxCamada1};
        minhaNet.layers{2}.transferFcn = funcAtivacao{IdxCamadaOutput};
        
    else
        IdxCamada1=input('\nFunção de ativação 1:\ntansig(1)\nlogsig(2)\nsoftmax(3)\n');
        IdxCamada2=input('\nFunção de ativação 2:\ntansig(1)\nlogsig(2)\nsoftmax(3)\n');
        IdxCamadaOutput=input('\nOutput: \n tansig(1)\nlogsig(2)\nsoftmax(3)\n');
        
        minhaNet.layers{1}.transferFcn = funcAtivacao{IdxCamada1};
        minhaNet.layers{2}.transferFcn = funcAtivacao{IdxCamada2};
        minhaNet.layers{3}.transferFcn = funcAtivacao{IdxCamadaOutput};
        
    end    
    
   
    %Set Epochs
    epo = input('Epochs: ');
    minhaNet.trainParam.epochs = 2000;

    minhaNet.trainParam.max_fail = 500; 
    
    %Set tr,te,val ratio
    
    %ratios=input('Treino/Teste/Val ratio: [%treino %teste %val]\n');
    ratios = [0.9 0 0.1];
    minhaNet.divideParam.trainRatio = double(ratios(1)); % training set [%]
    minhaNet.divideParam.valRatio   = double(ratios(3)); % validation set [%]
    minhaNet.divideParam.testRatio  = double(ratios(2)); % test set [%]
end