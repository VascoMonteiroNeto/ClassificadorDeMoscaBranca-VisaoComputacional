function [recortesImg] = getImagensDoBB(allImg)

ff=0;
recortesImg = [];

for i = 1:length(allImg)

img = allImg{4,i}; %4 é imagem sem normalizar
    
% img = allImg{6,i}; %6 é imagem normalizada

for j = 1:size(allImg{7,i},2)

%     oriAngle=360-allImg{7,i}{8,j};
%     extremos=allImg{7, i}{16, j};
    BB = allImg{7,i}{3,j};

%     for k=1:size(extremos,1)
%         xy=extremos(k,:);
%         extremos(k,:)=recalculaCoordenada(xy, oriAngle, img);
%     end

    % Ordem do extrema:[top-left top-right right-top right-bottom bottom-right bottom-left left-bottom left-top]
    
%     esquerda=min(extremos(:,1));
%     direita=max(extremos(:,1));
%     acima=min(extremos(:,2));
%     abaixo=max(extremos(:,2));
% 
%     BB(1)=acima;
%     BB(2)=esquerda;
%     BB(3)=abaixo-acima;
%     BB(4)=direita-esquerda;

%     ITemp = imrotate(img, oriAngle);
%     icrop = imcrop(ITemp, BB);

    icrop = imcrop(img, BB);

    recortesImg = [recortesImg , {icrop}];
    
    disp(ff);
    ff=ff+1;
end

end