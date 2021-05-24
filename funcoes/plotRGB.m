function plotRGB(i)

img = i;

R = img(:,:,1);
G = img(:,:,2);
B = img(:,:,3);

figure;
subplot(2,2,1);imshow(R);
title('Vermelho');
subplot(2,2,2);imshow(G);
title('Verde');
subplot(2,2,3);imshow(R);
title('Azul');
subplot(2,2,4);imshow(img);
title('Original');

end