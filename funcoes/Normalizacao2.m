function [normImg] = Normalizacao2(img)

stretch = stretchlim(img);

modaR = double(mode(img(:,:,1),'all'));
modaG = double(mode(img(:,:,2),'all'));
modaB = double(mode(img(:,:,3),'all'));

stdR = std2(img(:,:,1));
stdG = std2(img(:,:,2));
stdB = std2(img(:,:,3));

if modaB > 15
    stretch(1,3) = (modaB/255)+stdB/255;
else
    stretch(1,3) = (modaB/255)+2*stdB/255;
    if stretch(1,3) > stretch(2,3)
        stretch(2,3) = stretch(2,3) + stdB/255;
    end
end
 normImg = imadjust(img, stretch);

end