function [dadosCNN]=recortaImagemParaCNN(allImg)

cropSize=127;
dataSet=[];
imgNum=1;

for i=1:size(allImg,2)

x=1;
y=1;
    
img = allImg{4,i};

% imshow(img);

limX=size(img,2);
limY=size(img,1);

mosca = allImg{7,i}(24,:);
mosca=cell2mat(mosca);
idx=find(mosca==1);

BBmosca = cell2mat(allImg{7,i}(3,idx));
BBmosca = reshape(BBmosca,4,[]).';

        
flag=0;
while flag==0
    
    stretchX=0;  
    stretchY=0;
    
    moscaNoRecorte=find((BBmosca(:,1)>x & BBmosca(:,1)<(x+cropSize)) & (BBmosca(:,2)>y & BBmosca(:,2)<(y+cropSize)));
    
     if ~isempty(moscaNoRecorte)
          bb=BBmosca(moscaNoRecorte,:);
          
          if (max(bb(:,1))+bb(:,4))>(x+cropSize)
              stretchX=max(bb(:,1))+bb(find(max(bb(:,1))),4)-(x+cropSize);
          end    
          if (max(bb(:,2))+bb(:,4))>(y+cropSize)
              stretchY=max(bb(:,2))+bb(find(max(bb(:,2))),4) -(y+cropSize);
          end
              
          bb(:,1)= bb(:,1)-x+1;
          bb(:,2)= bb(:,2)-y+1; 
     end

    croped=imcrop(img,[x,y,(cropSize+stretchX),(cropSize+stretchY)]);
    cropedSize=size(croped);
    %
    if ((cropedSize(1))>(cropSize+1)) || ((cropedSize(2))>(cropSize+1))
        croped=imresize(croped, [(cropSize+1) (cropSize+1)]);
        bb(:,1)= ((cropSize+1)/cropedSize(2))*bb(:,1);
        bb(:,3)= ((cropSize+1)/cropedSize(2))*bb(:,3);
        bb(:,2)= ((cropSize+1)/cropedSize(1))*bb(:,2);   
        bb(:,4)= ((cropSize+1)/cropedSize(1))*bb(:,4);
    else
       
        if ((cropedSize(1))<=(cropSize)) || ((cropedSize(2))<=(cropSize))
            corModal=mode(croped,[1 2]);
            fundo=uint8(repmat(corModal,cropSize,cropSize));
            fundo(1:cropedSize(1), 1:cropedSize(2), :)=croped;
            croped = fundo;
        end    
    end
    
%     if ~isempty(moscaNoRecorte)
%    
%         croped = insertObjectAnnotation(croped,'rectangle',bb,'mosca',...
%         'TextBoxOpacity',0.9,'FontSize',18);
% %         imshow(croped);
%     end
    
    x=x+cropSize;
    if x>limX 
        y=y+cropSize;
        if y>limY    
            if ~isempty(moscaNoRecorte)
                imwrite(croped,sprintf('imgsCNN/img%s.jpg', num2str(imgNum)));
                for q=1:size(bb,1)
                    Box=bb(q,:);
                    Image = fullfile('imgsCNN', sprintf('img%s.jpg', num2str(imgNum)));
                    dataSet=[dataSet, {Image}, {Box}];
                end    
                imgNum=imgNum+1;
            end    
            flag=1;
        else
            x=1;
        end
    end
%     imwrite(croped,'imgsCNN',sprintf('%s.jpg', t)))

%     temMoscaNoRecorte()

    if ~isempty(moscaNoRecorte)
        imwrite(croped,sprintf('imgsCNN/img%s.jpg', num2str(imgNum)));
        for q=1:size(bb,1)
            Box=bb(q,:);
            Image = fullfile('imgsCNN', sprintf('img%s.jpg', num2str(imgNum)));
            dataSet=[dataSet, {Image}, {Box}];
        end    
        imgNum=imgNum+1;
    end    
    
    disp(imgNum);
    
end

end

dataSet=reshape(dataSet,2,[]).';
dadosCNN=table(dataSet(:,1), dataSet(:,2), 'VariableNames',{'Imagem','BoundingBox'});
end