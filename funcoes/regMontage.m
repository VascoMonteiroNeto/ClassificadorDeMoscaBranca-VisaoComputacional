function [montageIM, BoundBox, lin]=regMontage(stats)

imagens = extractfield(stats , 'Image');

BoundBox = extractfield(stats , 'BoundingBox');
BoundBox=reshape(BoundBox, 4,[])';
lin = floor(size(imagens, 2)/10);

if lin ~= 0
    if rem(lin,10) == 0
        h=montage(imagens, 'Size', [(lin) 10]);
    else
        lin=lin+1;
        h=montage(imagens, 'Size', [lin 10]);
    end
else
    h=montage(imagens, 'Size', [1 size(imagens, 2)]);
end

montageIM = h.CData;
        
end        