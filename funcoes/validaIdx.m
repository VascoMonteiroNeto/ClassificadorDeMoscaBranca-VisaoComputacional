function [idx] = validaIdx(Tabela)

idx=randperm(size(Tabela,1));
if rem( length(idx) , 10 )~=0
    idx=idx(1,1:end-rem( length(idx) , 10 ));
end    
idx = reshape(idx, 10,[]);

numMosca=length(find(table2array(Tabela(idx,end))==1));
minimoMosca=floor(numMosca/10);

for l=1:9
	numMoscaLinha=length(find(table2array(Tabela(idx(1,:),end))==1));
	if numMoscaLinha<minimoMosca
		idx=randperm(size(Tabela,1));
    	idx = reshape(idx, 10,[]);
		l=1;
	end
end

end