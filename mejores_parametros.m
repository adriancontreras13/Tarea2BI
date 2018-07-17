function [mejores] = mejores_parametros(data,train_size,arreglo_lag,arreglo_hankel,arreglo_h)
  top_global.L=-1;
  top_global.h=-1;
  top_global.lag = -1;
  top_global.mnsc=-999999999999999;
  for ind_L=1:length(arreglo_hankel)
    for ind_H=1:length(arreglo_h)
      for ind_Lag=1:length(arreglo_lag)
        mnsc_lag_local=[];
        for i=1:arreglo_h(ind_H)
          H=i;
          l=ind_L;
          %Insertar procesamiento de data
          [X_Lf_train,Y_Lf_train,X_Hf_train,Y_Hf_train,X_Lf_test,Y_Lf_test,X_Hf_test,Y_Hf_test]=procesa_data(data,train_size,arreglo_hankel(ind_L),arreglo_lag(ind_Lag),H);
          %Insertar ARR y ARX          
          mnsc=aar(X_Lf_train,Y_Lf_train,X_Hf_train,Y_Hf_train,X_Lf_test,Y_Lf_test,X_Hf_test,Y_Hf_test);
          mnsc_lag_local(end+1)=mnsc.mnsc;
          %Insertar MLP y MLPX
          
          %insertar SVM SVMX
        endfor
        if(mean(mnsc_lag_local)>mean(top_global.mnsc))
          top_global.mnsc=mean(mnsc_lag_local);
          top_global.L=arreglo_hankel(ind_L);
          top_global.h=H;
          top_global.lag = arreglo_lag(ind_Lag);
          save top_global.txt top_global;
        endif
      endfor
    endfor
  endfor
endfunction