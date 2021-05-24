%     Tabela = varSelection(TabelaEscalar);
   Tabela = novaTEscalares;
    
    tabSize = size(Tabela, 1);
   
    idx=validaIdx(Tabela);   

    for i = 1:(size(Tabela, 2)-1)
            Tabela.(i) = normalize(Tabela.(i), 'range');
    end   
    
%     TabelaArray = (table2array(TabelaEscalar(:,1:end-1)).*Z.')./IDX.';
%     TabelaEscalar(:,1:end-1)=array2table(TabelaArray);
%     
    
%     Tabela = pcaTabela(Tabela);

    allX= table2array(Tabela(idx(1:tabSize),1:size(Tabela,2)-1)).';
    allY= table2array(Tabela(idx(1:tabSize),size(Tabela,2))).';
    
    for i = 1:length(allY)
        if allY(1,i)==1
            allY(2,i) = 0;
        else
            allY(2,i) = 1;
        end    
    end    

    net=minhaRedeConfigura(allX);    
  
    Ytre= [];
    YtreRes = [];
    Ytes = [];
    YtesRes = [];
    acuraciaTreino = [];
    acuraciaTeste =  [];
    matrConfTre = zeros(2,2);
    matrConfTes = zeros(2,2);
    
    for k = 1:10
        
    idTreino = setdiff(idx, idx(k,:)).';
    idTeste = idx(k,:);
    
    xTreino=allX(:,idTreino);
    yTreino=allY(:,idTreino);
    
    net = init(net);
    
    [net,tr,Y,E] = train(net,xTreino,yTreino);

    
        for i=1:size(Y,2)
            if Y(1,i)>=Y(2,i)
                yOut(i) = 1;
            else
                yOut(i) = 0;
            end    
        end
% 
     Yt = net(allX(:,idTeste));
     
     for i=1:size(Yt,2)
            if Yt(1,i)>=Yt(2,i)
                yOut2(i) = 1;
            else
                yOut2(i) = 0;
            end    
        end
     acuraciaTreino = [acuraciaTreino, length(find(allY(1,idTreino)==yOut))/length(xTreino)];
% 
%     Ytre=[Ytre, allY(1,tr.trainInd)];
%     YtreRes = [YtreRes, yOut(tr.trainInd)];
%     matrConfTre(1,1)=matrConfTre(1,1)+length(find(YtreRes==0 & Ytre==0));
%     matrConfTre(1,2)=matrConfTre(1,2)+length(find(YtreRes==1 & Ytre==0));
%     matrConfTre(2,1)=matrConfTre(2,1)+length(find(YtreRes==0 & Ytre==1));
%     matrConfTre(2,2)=matrConfTre(2,2)+length(find(YtreRes==1 & Ytre==1));
%     acuraciaTreino = [acuraciaTreino, length(find(YtreRes==Ytre))/length(YtreRes)];
% 
    Ytes=[Ytes, allY(1,tr.testInd)];
    YtesRes =[YtesRes, yOut(tr.testInd)];
    matrConfTes(1,1)=matrConfTes(1,1)+length(find(YtesRes==0 & Ytes==0));
    matrConfTes(1,2)=matrConfTes(1,2)+length(find(YtesRes==1 & Ytes==0));
    matrConfTes(2,1)=matrConfTes(2,1)+length(find(YtesRes==0 & Ytes==1));
    matrConfTes(2,2)=matrConfTes(2,2)+length(find(YtesRes==1 & Ytes==1));
    acuraciaTeste=[acuraciaTeste, length(find(allY(1,idTeste)==yOut2))/length(Yt)];

    
    end    
    
    acuraciaTre = mean(acuraciaTreino);
    acuraciaTes = mean(acuraciaTeste);
    acc = [acuraciaTre acuraciaTes];
    
    
    if ~(exist( 'Resultados', 'var'))
        Resultados = [];
    end    
    Resultados=[Resultados,{acuraciaTre,acuraciaTes, net.layers.transferFcn, net.trainParam.epochs, Tabela.Properties.VariableNames, net}];
    %planilhaResultados=reshape(Resultados,6, []).';    
    
% figure;
% %C3 = confusionmat(matrConfTre);
% confC3=confusionchart(floor(matrConfTre/10));
% confC3.Title = sprintf('Matriz Confusão: Treino/ Acurácia %f', acuraciaTre);
% 
% figure;
% C2 = confusionmat(matrConfTes);
% confC2=confusionchart(floor(matrConfTes/10));
% confC2.Title = sprintf('Matriz Confusão: Teste/ Acurácia %f', acuraciaTes);
