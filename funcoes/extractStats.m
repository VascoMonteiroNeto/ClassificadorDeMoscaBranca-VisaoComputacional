function [stats0] = extractStats(BW)

    BW = im2bw(BW);
    CC = bwconncomp(BW); 
    stats = regionprops(CC,'Area','Eccentricity', 'Image','Perimeter'); 
    idx = find([stats.Area] > 50 & [stats.Area] < 1200 & [stats.Eccentricity] < 0.99); 
    BW2 = ismember(labelmatrix(CC),idx);  
    CC = bwconncomp(BW2);
    stats0 = regionprops(CC, 'Area', 'Centroid', 'BoundingBox', 'SubarrayIdx', 'MajorAxisLength', 'MinorAxisLength', 'Eccentricity', 'Orientation', 'ConvexHull', 'ConvexImage', 'ConvexArea', 'Image', 'FilledImage', 'FilledArea', 'EulerNumber', 'Extrema', 'EquivDiameter', 'Solidity', 'Extent', 'PixelIdxList', 'PixelList', 'Perimeter', 'PerimeterOld');
%     numObjects = CC.NumObjects;
%     areas = [stats0.Area];
%     eccentricities = [stats0.Eccentricity];
% 
%     idxOfSkittles = find(eccentricities);
%     statsDefects = stats0(idxOfSkittles);
% 
%     figure; imshow(BW2);
%     hold on;
%     for idx = 1 : length(idxOfSkittles)
%             h = rectangle('Position',statsDefects(idx).BoundingBox,'LineWidth',2);
%             set(h,'EdgeColor',[0 0 .70]);
% 
%             hold on;
%     end
% 
%     title(['Total: ', num2str(numObjects), ' moscas brancas']);
% 
%     hold off;
end