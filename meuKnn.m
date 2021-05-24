function acuracia =  knn(tabScalar)

    VarInput=input('Variaveis:\n(1)Area;\n(2)MajorAxisLength;\n(3)MinorAxisLength;\n(4)Eccentricity;\n(5)ConvexArea;\n(6)FilledArea;\n(7)EulerNumber;\n(8)Solidity;\n(9)Extent;\n(10)Perimeter;\n(11)Circularity\n\n');
    
    %tabScalar=Tab;{'Area','MajorAxisLength','Eccentricity','ConvexArea','EulerNumber','Extent'}
    
    names=tabScalar.Properties.VariableNames;
    
    if size(VarInput) ~=0
      
        for i = 1:size(VarInput, 2)
            [Tab.(names{1,VarInput(i)})] = tabScalar.(VarInput(i));
        end
        [Tab.('mosca')] = tabScalar.('mosca');
        tabScalar = struct2table(Tab);
    end
    
    %Normalização dos dados [0 1]
    for i = 1:(size(tabScalar, 2)-1)
        tabScalar.(i) = normalize(tabScalar.(i), 'range');
    end    
 
    Modelo = fitcknn(tabScalar, 'mosca');
    acuracia={};
    
    for k = 1:2:31
        Modelo.NumNeighbors = k;
        CVModelKNN = crossval(Modelo);
        loss=kfoldLoss(CVModelKNN);
        acc=1-loss;
        acuracia = [acuracia, {k,acc, CVModelKNN}];
    end
    
    acuracia = reshape(acuracia,3, []).';
   % loss ={[M.PredictorNames],min(cell2mat(loss(:,2)))};

%%

% vetLoss={};
% for p = 1:8
% 
% C = nchoosek(Tab.Properties.VariableNames(1:11), p);
% 
%     for i = 1:size(C,1)
%         tabScalar = removevars(Tab,C(i,:));
% 
%         %Normalização dos dados [0 1]
%         for j = 1:(size(tabScalar, 2)-1)
%             tabScalar.(j) = normalize(tabScalar.(j), 'range');
%         end    
% 
%         M = fitcknn(tabScalar, 'mosca');
%         loss={};
% 
%         for k = 1:2:15
%             M.NumNeighbors = k;
%             CVModelKNN = crossval(M);
%             loss = [loss, {k,kfoldLoss(CVModelKNN)}];
%         end
% 
% 
%         loss = reshape(loss,2, []).';
%         if min(cell2mat(loss(:,2))) < 0.1
%             vetLoss =[vetLoss,{[M.PredictorNames],min(cell2mat(loss(:,2)))}];
%         else
%             continue;
%         end    
%     end
% 
% 
% 
% end

end