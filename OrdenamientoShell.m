function [popOrd, fitOrd]= OrdenamientoShell (pop, fit)
    N = length(fit);
    incremento = round(N/2);
    while incremento > 0
       for i = incremento+1 : N
          temporal = fit(i);
          temporalPop = pop(i,:);
          j = i;
          while (j >= incremento+1) && (fit(j-incremento) > temporal)
              fit(j) = fit(j-incremento);
              pop(j,:) = pop(j-incremento,:);
              j = j-incremento;
          end
          fit(j) = temporal;
          pop(j,:) = temporalPop;
       end
       if incremento == 2
           incremento = 1;
       else
           incremento = round(incremento/2.2);
       end
    end
    popOrd = pop(size(pop,1):-1:1, :);
    fitOrd = fit(length(fit):-1:1);
end