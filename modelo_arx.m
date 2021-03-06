function [modelo]= modelo_arx(data,train_size,h,l,lag)
  mejor_metrica.mnsc =-9999999;
  mejor_metrica.mae = -999999;
  mejor_metrica.rmse = -99999;
  mejor_metrica.r2 = -99999;
  mejor_metrica.lag = 0;
  mejor_metrica.h= 0;
  mejor_metrica.y_obtenido = [];
  mejor_metrica.y_esperado = [];
  graficoid =3;
  lags_eval=[];
  %lag.valor=99999;
  %lag.metrica=-999999;
  array_mnsc = [];
  for ind_lag=1:length(lag)
    local_msnc = [];
    for H=1:h
      %Insertar procesamiento de data
      [X_Lf_train,Y_Lf_train,X_Hf_train,Y_Hf_train,X_Lf_test,Y_Lf_test,X_Hf_test,Y_Hf_test]=procesa_data2(data,train_size,l,lag(ind_lag),H);
      %Insertar ARR y ARX          
      mnsc=aar(X_Lf_train,Y_Lf_train,X_Hf_train,Y_Hf_train,X_Lf_test,Y_Lf_test,X_Hf_test,Y_Hf_test);
      local_msnc(end+1)=mnsc.mnsc;
      lag.valor=ind_lag;
      lag.metrica= mnsc.mnsc;
      lags_eval(end+1)=mnsc.mnsc;
      if(mnsc.mnsc >mejor_metrica.mnsc)
        mejor_metrica.mnsc = mnsc.mnsc;
        mejor_metrica.mae = mnsc.mae;
        mejor_metrica.rmse = mnsc.rmse;
        mejor_metrica.r2 = mnsc.r2;
        mejor_metrica.lag = lag(ind_lag);
        mejor_metrica.h=H;
        mejor_metrica.y_obtenido = mnsc.y_obtenido;
        mejor_metrica.y_esperado = mnsc.y_esperado;
      endif
    endfor
    array_mnsc = [array_mnsc;local_msnc];
  endfor
  arreglo_ordenado=[];
  arreglo_ordenado= sort(lags_eval);
  for i=(length(arreglo_ordenado)-10):length(arreglo_ordenado)
    fprintf("\n Lag %s : %s",num2str(arreglo_ordenado(i)),num2str(arreglo_ordenado(i)));
  endfor
  

  graficoid = grafico(array_mnsc,h,lag,l,graficoid,mejor_metrica,"AARX");
  %Grafico obtenido vs esperado
  titulo=" (ARX)";
  graficoid= graficoid+10;
  plotObvsEsp(mejor_metrica.y_esperado,mejor_metrica.y_obtenido,titulo,graficoid);
  %Grafico Linear Fit
  graficoid = graficoid+10;
  Linear_fit(mejor_metrica.y_obtenido,mejor_metrica.y_esperado,titulo,graficoid);
end