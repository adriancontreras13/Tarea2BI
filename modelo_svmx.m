function [modelo]= modelo_svmx(data,train_size,h,l,lag)
  stepGama=1;
  stepSigma=2;
  a=-2;
  b=4;
  baseGama=2;
  baseSigma=2;
  grid = inicializarGrid(stepGama,stepSigma,baseGama,baseSigma,a,b);
  %grid = [8 0.25; 9 0.25; 10 0.25];
  mejor_metrica.mnsc =-9999999;
  mejor_metrica.mae = -999999;
  mejor_metrica.rmse = -99999;
  mejor_metrica.r2 = -99999;
  mejor_metrica.lag = 0;
  mejor_metrica.h= 0;
  mejor_metrica.y_obtenido = [];
  mejor_metrica.y_esperado = [];
  graficoid =7;
  array_mnsc = [];
  celda = {};
  for ind_lag=1:length(lag)
    %local_msnc = [];
    for H=2:h
      fprintf("\n\n lag:%d ----h :%d ---- L: %d",lag(ind_lag),H,l);
      %Insertar procesamiento de data
      [X_Lf_train,Y_Lf_train,X_Hf_train,Y_Hf_train,X_Lf_test,Y_Lf_test,X_Hf_test,Y_Hf_test]=procesa_data2(data,train_size,l,lag(ind_lag),H);
      %Insertar ARR y ARX          
      mnsc=svm(a,b,stepGama,stepSigma,baseGama,baseSigma,X_Lf_train,Y_Lf_train,X_Hf_train,Y_Hf_train,X_Lf_test,Y_Lf_test,X_Hf_test,Y_Hf_test,grid);
      fprintf("\nMAE: %d -- RMSE: %d -- R2: %d -- mNSC: %d",mnsc.mae,mnsc.rmse,mnsc.r2,mnsc.mnsc);
      %celda{end+1}={lag(ind_lag) mnsc.mnsc};
    endfor
    %array_mnsc = [array_mnsc;local_msnc];
  endfor
  %disp(celda);
  %graficoid = grafico(array_mnsc,h,lag,l,graficoid,mejor_metrica,"VMX");
  %Grafico obtenido vs esperado
  %titulo=" (SVMX)";
  %graficoid= graficoid+10;
  %plotObvsEsp(mejor_metrica.y_esperado,mejor_metrica.y_obtenido,titulo,graficoid);
  %Grafico de Linear Fit
  %graficoid = graficoid+10;
  %Linear_fit(mejor_metrica.y_obtenido,mejor_metrica.y_esperado,titulo,graficoid);
end