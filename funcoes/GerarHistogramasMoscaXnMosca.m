var1 = input('Variavel: ');
for var1=1:16
hold on;
%ax.Title.String=sprintf('%s x %s', varNames{1,var1}, varNames{1,var2});
histogram(table2array(somosca(:,var1)));
histogram(table2array(soNmosca(:,var1)));
ax = gca;
varName = somosca.Properties.VariableNames;
ax.Title.String=sprintf('Histograma %s: Mosca X Não Mosca', varName{1,var1});
legend('Mosca','NãoMosca');

% save=input('Salvar?(S/n)', 's');
%     if save == 'S'
        nome = varName{1,var1};
        saveas(gcf,sprintf('Histograma%s.jpg', nome));
%     end
close all;
end