function [PopResidual] = Seleccion (Pop, Criba)
    criba = round((size(Pop,1)*Criba)/100);
    PopResidual = Pop (1:criba, :);
end