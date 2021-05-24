function [BW] = distEuclidRGB(img)

rows = size(img, 1);
columns = size(img, 2);

BW = zeros(rows, columns);
mediaRGB = double([235 235 235]);

threshold = 60;

    for lin = 1 : rows
       for col = 1 : columns
            
            r = img(lin,col,1);
            g = img(lin,col,2);
            b = img(lin,col,3);
            rgb = double([r g b]);
           
            dist = norm(mediaRGB - rgb);

           if dist < threshold
               BW(lin, col) = 1;
           else
               BW(lin, col) = 0;
           end
       end
    end
%     BW = imfill(BW, 'holes');
end