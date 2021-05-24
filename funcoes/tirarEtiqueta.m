function [semEtiqueta, modaRGB] = tirarEtiqueta(i)

img = i;
modaR = mode(img(:,:,1),'all');
modaG = mode(img(:,:,2),'all');
modaB = mode(img(:,:,3),'all');
modaRGB = double([modaR modaG modaB]);

branco = double([255 255 255]);
preto = double([0 0 0]);

threshold = 150;
bin = zeros(size(img,1), size(img,2));

for i = 1:size(img,1)
    for j = 1:size(img,2)

            r = img(i,j,1);
            g = img(i,j,2);
            b = img(i,j,3);
            rgb = double([r g b]);
            
            D = norm(branco - rgb);
            G = norm(preto - rgb);
            if D > threshold
                bin(i,j) = 0;
            else
                bin(i,j) = 1;
            end
            
%             if G < 150
%                 img(i,j,1) = modaR;
%                 img(i,j,2) = modaG;
%                 img(i,j,3) = modaB;
%             end
    end
end
       
    bin = imfill(bin,'holes');
    CC = bwconncomp(bin);
    y = regionprops(CC, 'Area', 'PixelList');
    
    z = find([y.Area] ==  max([y.Area]), 1);
    pixelsEtiqueta = y(z).PixelList;
    
    horizontal=pixelsEtiqueta(:,1);
    vertical=pixelsEtiqueta(:,2);
    for i =1 : size(horizontal)
        img (vertical(i),horizontal(i),:) = modaRGB;
    end    
    

    
semEtiqueta = img;


end