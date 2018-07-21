function [modelo]= modelo_mlpx(data,train_size,h,l,lag)
  topologias = [30 30];
  iteraciones = 100;
  
  mejor_metrica.mnsc =-9999999;
  mejor_metrica.mae = -999999;
  mejor_metrica.rmse = -99999;
  mejor_metrica.r2 = -99999;
  mejor_metrica.lag = 0;
  mejor_metrica.h= 0;
  mejor_metrica.y_obtenido = [];
  mejor_metrica.y_esperado = [];
  graficoid =5;
  array_mnsc = [];
  for ind_lag=1:length(lag)
    local_msnc = [];
    for H=1:h
      disp(H);
      %Insertar procesamiento de data
      disp(h);
      [X_Lf_train,Y_Lf_train,X_Hf_train,Y_Hf_train,X_Lf_test,Y_Lf_test,X_Hf_test,Y_Hf_test]=procesa_data2(data,train_size,l,lag(ind_lag),H);
      %Insertar ARR y ARX          
      mnsc=mlp_main(topologias,iteraciones,X_Lf_train,Y_Lf_train,X_Hf_train,Y_Hf_train,X_Lf_test,Y_Lf_test,X_Hf_test,Y_Hf_test);
      local_msnc(end+1)=mnsc.mnsc;
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

  graficoid = grafico(array_mnsc,h,lag,l,graficoid,mejor_metrica,"MLPX");
  %Grafico obtenido vs esperado
  titulo=" (MLPX)";
  graficoid= graficoid+10;
  plotObvsEsp(mejor_metrica.y_esperado,mejor_metrica.y_obtenido,titulo,graficoid);
  %Grafico de Linear Fit
  graficoid = graficoid+10;
  Linear_fit(mejor_metrica.y_obtenido,mejor_metrica.y_esperado,titulo,graficoid);  
end