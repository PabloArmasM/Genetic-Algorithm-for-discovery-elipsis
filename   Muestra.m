function [] = Muestra (I, Pop, vectorSolucion, vectorMedia)
    a = binario_a_entero (Pop(1:5)) + 5;
    b = binario_a_entero (Pop(6:10)) + 5;
    x0 = binario_a_entero (Pop(11:16)) + 19;
    y0 = binario_a_entero (Pop(17:22)) + 19;
    theta = binario_a_entero (Pop(23:29));
    theta = theta*89/127; %Escalamos de 0 a 127 a 0 a 179
    theta = theta * pi/180;
    
    subplot(2,2,1);
    plot(vectorSolucion);
    title('Mejor solución');
    subplot(2,2,2);
    plot(vectorMedia);
    title('Solución media');
    subplot(2,2,3);
    imshow(I);
    title('Mejor elipse');
    hold on;
    for alpha=0.2:0.2:2*pi;
        x = round((a*cos(alpha)+x0)*cos(theta)+(b*sin(alpha)+y0)*sin(theta));
        y = round((a*cos(alpha)+x0)*sin(theta)+(b*sin(alpha)+y0)*cos(theta));
        scatter(y,x, 'X', 'r'); %Se le invierte la x y la y puesto que la X 
                                %son las filas para una matriz
                                %y las y son las columnas para la matriz,
                                %lo cual significa que, la y será la x de
                                %la gráfica y la altura la X
        disp(alpha)
    end
end