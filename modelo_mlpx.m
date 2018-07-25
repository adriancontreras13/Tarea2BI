function [modelo]= modelo_mlpx(data,train_size,h,l,lag)
  topologias = [30 30 30; 10 10 10; 40 40 40; 20 10 15; 30 20 15];
  iteraciones = 3000;
  
  
  graficoid =5;
  array_mnsc = [];
  for ind_lag=1:length(lag)
    for H=1:h
      [X_Lf_train,Y_Lf_train,X_Hf_train,Y_Hf_train,X_Lf_test,Y_Lf_test,X_Hf_test,Y_Hf_test]=procesa_data2(data,train_size,l,lag(ind_lag),H);
      %Insertar ARR y ARX
      fprintf("\n\nLag: %d --- h:%d -- Topologia:",lag(ind_lag),H);      
      mnsc=mlp_main(topologias,iteraciones,X_Lf_train,Y_Lf_train,X_Hf_train,Y_Hf_train,X_Lf_test,Y_Lf_test,X_Hf_test,Y_Hf_test);
      
    endfor
  endfor
  disp(mnsc);

  %graficoid = grafico(array_mnsc,h,lag,l,graficoid,mejor_metrica,"MLPX");
  %Grafico obtenido vs esperado
  %titulo=" (MLPX)";
  %graficoid= graficoid+10;
  %plotObvsEsp(mejor_metrica.y_esperado,mejor_metrica.y_obtenido,titulo,graficoid);
  %Grafico de Linear Fit
  %graficoid = graficoid+10;
  %Linear_fit(mejor_metrica.y_obtenido,mejor_metrica.y_esperado,titulo,graficoid);  
end