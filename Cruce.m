function [popHijos]= Cruce (popPadres, popMax)
    popHijos = popPadres(1:2,:);
    sizePadre = size(popPadres,1);
    while size(popHijos,1) < popMax
        posPadre1 = round((sizePadre-1)*rand+1);
        padre1 = popPadres(posPadre1, :);
        posPadre2 = round((sizePadre-1)*rand+1);
        padre2 = popPadres(posPadre2, :);
        while padre1 == padre2
           padre2 = popPadres(round((sizePadre-1)*rand+1), :); 
        end
        lenPadre1 = length(padre1);
        lenPadre2 = length(padre2);
        aleatorioIzquierdo = round((lenPadre1/2)*rand+1);
        aleatorioDerecha = aleatorioIzquierdo + round((lenPadre1-1-aleatorioIzquierdo)*rand+1);
        hijo1 = [padre1(1:aleatorioIzquierdo) padre2(aleatorioIzquierdo+1:aleatorioDerecha) padre1(aleatorioDerecha+1:lenPadre1)];
        hijo2 = [padre2(1:aleatorioIzquierdo) padre1(aleatorioIzquierdo+1:aleatorioDerecha) padre2(aleatorioDerecha+1:lenPadre2)];
        popHijos = [popHijos; hijo1; hijo2];
    end
end