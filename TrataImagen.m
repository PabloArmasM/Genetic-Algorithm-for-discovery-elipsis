function [blackYWhite] = TrataImagen(imagen)
    blackYWhite = im2bw(imagen, 0.15);
end