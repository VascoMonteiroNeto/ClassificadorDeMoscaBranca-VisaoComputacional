function plotHistograms(Img)

figure;
subplot(2,2,1); histogram(Img(:,:,1));
subplot(2,2,2); histogram(Img(:,:,2));
subplot(2,2,3); histogram(Img(:,:,3));


end