function [imag] = toBlackWhite(IntPix)

rows = size(IntPix, 1);
columns = size(IntPix, 2);

for lin = 1 : rows
   for col = 1 : columns
       if IntPix(lin,col) < 150000
           IntPix(lin,col) = 0;
       else
           IntPix(lin,col) = 1 ;
       end
   end
end

imag = mat2gray(IntPix);
imag = imfill(imag, 'holes');
% CC = bwconncomp(imag);
% stats = regionprops(CC,'Area','Eccentricity'); 
% % idx = find([stats.Area] > 10 & [stats.Area] < 300  & [stats.Eccentricity] < 0.8 ); 
% imag = ismember(labelmatrix(CC),idx);

end