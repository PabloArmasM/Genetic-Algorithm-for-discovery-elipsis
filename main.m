function [] = main (rutaFoto, tamPoblacion, umbral, poblacionResidual, generaciones)
    i = 0;
    solucion = 0;
    vectorSolucion = [];
    vectorMedia = [];
    imagenTratada = imread(rutaFoto);
    imagenTratada = TrataImagen(imagenTratada);
    popInicializada = Inicializa_poblacion(tamPoblacion);
    resultadoFitness = fitness(popInicializada,imagenTratada);
    PopOrdenado = OrdenamientoShell(popInicializada, resultadoFitness);
    while solucion < umbral && i < generaciones
        popResidual = Seleccion(PopOrdenado, poblacionResidual);
        nuevaGeneracion = Cruce(popResidual, tamPoblacion);
        nuevaGeneracionMutada = Mutacion(nuevaGeneracion);
        resultadoFitness = fitness(nuevaGeneracionMutada,imagenTratada);
        [PopOrdenado, fitnessOrdenado] = OrdenamientoShell(nuevaGeneracionMutada,resultadoFitness);
        solucion = fitnessOrdenado(1)
        vectorSolucion = [vectorSolucion; solucion];
        media = mean(fitnessOrdenado);
        vectorMedia = [vectorMedia; media];
        i = i+1;
    end
    Muestra(imagenTratada, PopOrdenado(1,:), vectorSolucion, vectorMedia);
end