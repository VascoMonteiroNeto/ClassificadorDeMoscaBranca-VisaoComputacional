function [R,G,B] = colorScalarSelect(allImg)

R = [];
G = [];
B = [];

for i = 1:length(allImg)

I = allImg{6,i};

for j = 1:size(allImg{7,i},2)

BB = allImg{7,i}{3,j};

icrop = imcrop(I, BB);
illuminant = illumpca(icrop, 0.01);

R = [R , illuminant(1)];
G = [G, illuminant(2)];
B = [B, illuminant(3)];


end

end