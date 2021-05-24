function [allInfo] = flow2(allInfo, pasta)
        
    for w = 1:size(allInfo, 2)
        img = cell2mat(allInfo(1,w));
        i = cell2mat(allInfo(2,w));
        p = cell2mat(allInfo(3,w));
        semEtiqueta = cell2mat(allInfo(4,w));
        Box = cell2mat(allInfo(5,w));
        norm = cell2mat(allInfo(6,w));
        
        
        
        [croped, Box] = cropAmarelo(img);
%         allInfo(5,w) = {Box};
        [semEtiqueta] = tirarEtiqueta(croped);
%         allInfo(4,w) = {semEtiqueta}; 
%         norm = Normalizacao2(semEtiqueta);        
%         imwrite(norm, sprintf('%s/normalizada%sSemB.jpg', pasta, i));
%         allInfo(6,w) = {norm};
%         
         segDE =  distEuclidRGB(norm);
         imwrite(segDE, sprintf('%s/BW-DE/BWmetodo3-T50(DE)%s.jpg', pasta, i));
        
        stats = extractStats(segDE);
        save(sprintf('%s/regStats%s.mat',pasta,i), 'stats');
        
        imagens = extractfield(stats , 'Image');
        
        [montageIM, BoundBox, lin]= regMontage(stats);
        imwrite(montageIM,sprintf('%s/shapes/shapes%s.jpg', pasta, i)); 
        
        mosca = regAnalise(norm, BoundBox, Box, montageIM, lin);
        if size(mosca, 2) ~= size(imagens, 2)
            continue;
        end    
        [stats.('mosca')] = mosca{:};
        save(sprintf('%s/regStatsComMosca%s.mat',pasta,i), 'stats');
 

    close all;
    end
end