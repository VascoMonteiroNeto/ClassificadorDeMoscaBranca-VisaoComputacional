function [bin, BoundingBox] = cropAmarelo(img)

modaR = mode(img(:,:,1),'all');
modaG = mode(img(:,:,2),'all');
modaB = mode(img(:,:,3),'all');
modaRGB = double([modaR modaG modaB]);

threshold = 125;
bin = zeros(size(img,1), size(img,2));

    for i = 1:size(img,1)
        for j = 1:size(img,2)

            r = img(i,j,1);
            g = img(i,j,2);
            b = img(i,j,3);
            rgb = double([r g b]);
            
            D = norm(rgb - modaRGB);
            
            if D > threshold
                
                
                bin(i,j) = 0;
            else
                
                bin(i,j) = 1;
            end
        end
    end
    CC = bwconncomp(bin);
    y= regionprops(CC, 'Area', 'BoundingBox');
    z=find([y.Area] ==  max([y.Area]), 1);
   
    BoundingBox = y(z).BoundingBox;
    
    bin = imcrop(img,BoundingBox);
end