function [img] = desenhaBoundingBoxes(img, posicao, box)
       
    if ~exist('box','var')
        
        for i = 1: size(posicao,1)
       
            img = insertShape(img,'rectangle',posicao(i,:),'LineWidth',4, 'Color', 'red');
   
        end
    
    else    
        
        for i = 1: size(posicao,1)
            posicao(i,1) = posicao(i,1)-box(1);
            posicao(i,2) = posicao(i,2)-box(2);

            img = insertShape(img,'rectangle',posicao(i,:),'LineWidth',4, 'Color', 'red');
        end
    end
end