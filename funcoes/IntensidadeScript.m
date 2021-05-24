function [IntPix] = IntensidadeScript(img)

rows = size(img, 1);
columns = size(img, 2);

R = uint32(img(:,:,1));
G = uint32(img(:,:,2));
B = uint32(img(:,:,3));

IntPix = uint32(zeros(rows, columns));

for lin = 1 : rows
   for col = 1 : columns
           
       IntPix(lin,col) = R(lin, col).^2 + G(lin, col).^2 + B(lin, col).^2 ;
           
   end
end

end