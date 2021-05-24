function [tabScalar] = varSelection(tabScalar)

    VarInput=input('Variaveis:\n(1)Area;\n(2)MajorAxisLength;\n(3)MinorAxisLength;\n(4)Eccentricity;\n(5)ConvexArea;\n(6)FilledArea;\n(7)EulerNumber;\n(8)Solidity;\n(9)Extent;\n(10)Perimeter;\n(11)Circularity\n\n');
        
    names=tabScalar.Properties.VariableNames;
    
    if size(VarInput) ~=0
      
        for i = 1:size(VarInput, 2)
            [Tab.(names{1,VarInput(i)})] = tabScalar.(VarInput(i));
        end
        [Tab.('mosca')] = tabScalar.('mosca');
        tabScalar = struct2table(Tab);
    end

end