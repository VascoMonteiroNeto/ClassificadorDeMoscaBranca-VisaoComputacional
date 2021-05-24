function [Im] = segmentAjustCor(img)

R = img(:,:,1);
G = img(:,:,2);
B = img(:,:,3);

levelR = 0.83;
levelG = 0.81;
levelB = 0.85;

R = im2bw(R, levelR);
G = im2bw(G, levelG);
B = im2bw(B, levelB);
Im = (R&G&B);
Im=imfill(Im, 'holes');
% CC = bwconncomp(Im);
% stats = regionprops(CC,'Area','Eccentricity'); 
% idx = find([stats.Area] > 10 & [stats.Area] < 300  & [stats.Eccentricity] < 0.8 ); 
% Im = ismember(labelmatrix(CC),idx);
%figure;
%subplot(2,2,1); imshow(R);
%subplot(2,2,2); imshow(G);
%subplot(2,2,3); imshow(B);
%subplot(2,2,4); imshow(Im);

%imshow(R);
%histogram(Im);
end