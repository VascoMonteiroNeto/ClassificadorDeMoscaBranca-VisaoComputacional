function T=normaImageSize(T)

x=[];
y=[];

idxMosca=find(T.mosca==1);
TMosca=T(idxMosca,:);

for i=1:size(TMosca, 1)
    img = TMosca.Image{i, 1};
    s0=size(img);
    x=[x,s0(1)];
    y=[y,s0(2)];
end    

xMean=mean(x);
yMean=mean(y);


for i=1:size(T, 1)
    T.Image{i, 1}=imresize(T.Image{i, 1}, [floor(xMean) floor(yMean)]);
end  

end
