function relaPlot(tabela)

var1 = input('Var1: ');
var2 = input('Var2: ');
varNames = tabela.Properties.VariableNames;


Y=table2array(tabela(:,end)).';
X = zeros(2,size(tabela,1));

X(1,:)=table2array(tabela(:,var1));
X(2,:)=table2array(tabela(:,var2));
plotpv(X,Y);

ax = gca;
    for i = allchild(ax)'
        switch i.Marker
            case '+'
                i.MarkerEdgeColor = 'b';
            case 'o'
                i.MarkerEdgeColor = 'r';
        end
    end


ax.Title.String=sprintf('%s x %s', varNames{1,var1}, varNames{1,var2});
ax.XLabel.String = varNames{1,var1};
ax.YLabel.String = varNames{1,var2};
legend('Mosca','NãoMosca');


save=input('Salvar?(S/n)', 's');
    if save == 'S'
        nome = input('Nome(.jpg): ', 's');
        saveas(gcf,sprintf('%s.jpg', nome));
    end
    
end
