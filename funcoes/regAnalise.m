function [mosca] = regAnalise(img, posicao, box, montageIM, lin)

Y = size(montageIM, 1);
y = size(montageIM, 1)/lin;
X = size(montageIM, 2);
x = size(montageIM, 2)/10;

posicaoShapes =  [1, 1, x, y];

flag=0;
k=1;
    for i = 1 : lin
        if flag == 1
            break;
        end

        for j =1: 10

            %posicao =  [(1+X-x*(5-(rem(i,5)+1))), (1+Y-y*(lin-(rem(i, lin)+1))), x, y];
            shapes = insertShape(montageIM, 'rectangle',posicaoShapes,'LineWidth',4, 'Color', 'green');

            posicao(i,1) = posicao(i,1)-box(1);
            posicao(i,2) = posicao(i,2)-box(2);
            
            im = insertObjectAnnotation(img,'rectangle',posicao(k,:),'É Mosca?','LineWidth',1, 'Color', 'green', 'TextColor','black','TextBoxOpacity',0.2,'FontSize',70);

%             posicao(k,1:2) = -4*posicao(k,1:2);
%             posicao(k,3:4) = -4*posicao(k,3:4);

            figure(1);
            imshow(shapes);
            figure(2);
            imshow(im);
            %             set(gcf, 'Position', get(0,'Screensize'));

            %             subplot(1,2,1);
            %             imshow(shapes);
            %             figure;
            %             subplot(1,2,2);
            %             imshow(img);

            in = input("Mosca: ") ;

            if in == 9
                flag=1;
                mosca={};
                close all;
                break;
            end

            while (in ~= 0) && (in ~= 1)
                in = input("Mosca: ") ;
            end
            mosca(k) = {in};
            if k >= size(posicao)
                break;
            end
            posicaoShapes(1) = posicaoShapes(1) +  x;

            k = k+1;

            close(figure(1));
            close(figure(2));
%             if k == size(posicao)
%                 break;
%             end

        end
        posicaoShapes(2) =posicaoShapes(2) + y;
        posicaoShapes(1) = 1;
        

    end
end