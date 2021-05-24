function Tabela = pcaTabela(tab)

    numVar=input('Tamanho/Número de váriáveis da nova tabela:');

    if size(numVar)~=0
    
        tabPca=pca(table2array(tab(:,1:10)));    
        %[wcoeff,score,latent,tsquared,explained] = pca(table2array(tab(:,1:10)));
        novaTabelaPCA=table2array(tab(:,1:10))*tabPca(:,1:numVar); %NovaTab com X variáveis tabPca(:,1:X)
        novaTabelaPCA(:,end+1)=table2array(tab(:,11));
        Tabela = array2table(novaTabelaPCA);
       
    else
        Tabela=tab;
    end    
    
end