function T=normaImageSize2(T)

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

xMax=max(x);
yMax=max(y);


for i=1:size(T, 1)
   
    im=T.Image{i, 1};
    imgSize=size(T.Image{i, 1});
    
    cor1=im(1,1,:);
    cor2=im(1,imgSize(2),:);
    cor3=im(imgSize(1),1,:);
    cor4=im(imgSize(1),imgSize(2),:);
    corMedia=mean([cor1,cor2,cor3,cor4]);
    
    fundo=uint8(repmat(corMedia,xMax,yMax));
%     fundo(1:imgSize(1), 1:imgSize(2), :)=im;
    
    if imgSize(1)>xMax || imgSize(2)>yMax
        if imgSize(1)>xMax && imgSize(2)>yMax            
            T.Image{i, 1}=imresize(T.Image{i, 1}, [xMax yMax]);
        else
            if imgSize(1)>xMax
                T.Image{i, 1}=imresize(T.Image{i, 1}, [xMax imgSize(2)]);
                fundo(1:xMax, 1:imgSize(2), :)=T.Image{i, 1};
                T.Image{i, 1}=fundo;
            else
                T.Image{i, 1}=imresize(T.Image{i, 1}, [imgSize(1) yMax]);
                fundo(1:imgSize(1), 1:yMax, :)=T.Image{i, 1};
                T.Image{i, 1}=fundo;
            end
        end    
    else
        fundo(1:imgSize(1), 1:imgSize(2), :)=im;
        T.Image{i, 1}=fundo;
    end    
end  

end