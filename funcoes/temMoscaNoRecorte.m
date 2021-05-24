
mosca = all{7,1}(24,:);
mosca=cell2mat(mosca);
idx=find(mosca==1);

BB = cell2mat(all{7,1}(3,idx));
BB=reshape(BB,4,[]).'