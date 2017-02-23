function [popMutada]= Mutacion (Pop)
    for i=1:size(Pop,1)
       if(rand <= 0.002)
          aMutar = round((size(Pop,2)-1)*rand+1);
          if(Pop(i, aMutar) == 1)
             Pop(i,aMutar) = 0;
          else
              Pop(i,aMutar) = 1;
          end
       end
    end
    popMutada = Pop;
end
