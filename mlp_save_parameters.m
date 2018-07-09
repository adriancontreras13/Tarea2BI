function [parameters] = mlp_save_parameters(x_train,y_train,x_test,y_test,topologias,iteraciones,frecuencia)
  mlp.MaxIter=iteraciones;
  mlp.mu=1e-3;
  run = 10;
  bestMse = 99999;
  bestArrayMse = [];
  bestWTrain = [];
  bestGlobalMse = 99999;
  bestGlobalArrayTrainMse = [];
  bestParameters = [];
  ArrayMseTopologias = [];
  indexBestTopologia =0 ;
  bestWTrainGlobal = [];
  numTopo =(length(topologias));
  for i = 1:numTopo
    mlp.HLayer = [topologias(i,1) topologias(i,2)];
    %mlp.HLayer = [topologias(1,1) topologias(1,2)];
    for j = 1:run
      mlp.W=mlp_inic_w(size(x_train,1),size(y_train,1),mlp.HLayer);
      mlp=mlp_train(x_train,y_train,mlp);
      if mlp.mse(end) < bestMse
        bestMse = mlp.mse(end);
        bestArrayMse = mlp.mse;
        bestWTrain = mlp.W;  
      endif
    endfor
    mlpt = mlp_test(x_test,y_test,bestWTrain);
    if mlpt.mse < bestGlobalMse
      bestGlobalMse = mlpt.mse;
      bestGlobalArrayTrainMse = bestArrayMse;
      bestParameters = mlpt;
      bestWTrainGlobal = bestWTrain;
      nombre=strcat("mejorPesoMLP",frecuencia,".txt");
      save(nombre,"bestWTrainGlobal");
    %  csvwrite("mejorPesoMLP.csv",bestWtrain);
      indexBestTopologia = i;
      topologia = [topologias(indexBestTopologia,1) topologias(indexBestTopologia,2)];
      nombre=strcat("mejorTopologiaMLP",frecuencia,".txt");
      save(nombre,"topologia");
    %  csvwrite("mejorTopologiaMLP.csv",topologia);
    endif
    bestMse = 99999;
    bestArrayMse = [];
    bestWtrain = [];
  endfor
endfunction