%Parametros
arreglo_hankel=[2,3];
arreglo_h=[1,2];
arreglo_lag=[1,2,3];
lag=30;
data= csvread("daily-minimum-temperatures-in-me.csv");
data = data(:,2);
%data=data(1:50);

train_size = 0.8;
%==============================================================================%
l=500;
H=1;
%autocovar = autocovarianza(data,l);
%autocorre = autocorrelacion(data,l);
%==============================================================================% 

%Grafico ACF  
%ACF(data,lag);
%==============================================================================%
top_global.L=-1;
top_global.h=-1;
top_global.mnsc=-999999999999999;
for ind_L=arreglo_hankel(1):arreglo_hankel(2)
  for ind_H=arreglo_h(1):arreglo_h(2)
    for ind_Lag=1:length(arreglo_lag)
      mnsc_lag_local=[];
      for i=1:ind_H
        H=i;
        lag=arreglo_lag(ind_Lag);
        l=ind_L;
        %Insertar procesamiento de data
        [X_Lf_train,Y_Lf_train,X_Hf_train,Y_Hf_train,X_Lf_test,Y_Lf_test,X_Hf_test,Y_Hf_test]=procesa_data(data,train_size,l,lag,H);
        fprintf("\n\nConfiguracion: \nH: %d \nlag: %d \nl: %d",H,lag,l);
        %Insertar ARR y ARX          
        mnsc=aar(X_Lf_train,Y_Lf_train,X_Hf_train,Y_Hf_train,X_Lf_test,Y_Lf_test,X_Hf_test,Y_Hf_test);
        mnsc_lag_local(end+1)=mnsc.mnsc;
        %Insertar MLP y MLPX
        
        %insertar SVM SVMX
      endfor
      if(mean(mnsc_lag_local)>mean(top_global.mnsc))
        top_global.mnsc=mean(mnsc_lag_local);
        top_global.L=l;
        top_global.h=H;
      endif
    endfor
  endfor
endfor

%csvwrite("X_Lf_train.csv",X_Lf_train);
%csvwrite("Y_Lf_train.csv",Y_Lf_train);
%csvwrite("X_Hf_train.csv",X_Hf_train);
%csvwrite("Y_Hf_train.csv",Y_Hf_train);

%csvwrite("X_Lf_test.csv",X_Lf_test);
%csvwrite("Y_Lf_test.csv",Y_Lf_test);
%csvwrite("X_Hf_test.csv",X_Hf_test);
%csvwrite("Y_Hf_test.csv",Y_Hf_test);



%%%%%%%%%%%%%%%%%%%%%%%%% AAR %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%training LF
%training_ar("Lf");
%Training HF
%training_ar("Hf");
%Testing
%testing_ar(X_Lf_test,Y_Lf_test);

%%MLP%%
%topologias = [40 20; 20 25; 33 24; 20 40; 30 20; 20 20; 20 30; 20 18; 20 19; 21 19];
topologias = [30 30;20 20];
iteraciones = 1000;
%Training con HF
%mlp_main(topologias,iteraciones);

%Training con LF
%mlp_main(X_LfHf_train,Y_LfHf_train,X_Hf_test,Y_Hf_test,topologias,iteraciones);

%%SVM%%
%[svm]=svm_func(X_Lf_train,Y_Lf_train,X_Lf_test, Y_Lf_test,train_size,tamano);

%[svm]=svm_func(X_Lf_train,Y_Lf_train,X_Lf_test, Y_Lf_test,train_size,tamano);

%training_ar(X_Lf_train,Y_Lf_train,"Coeficientes_Lf");
%Training HF
%training_ar(X_Hf_train,Y_Hf_train,"Coeficientes_Hf");
%Testing
%testing_ar(X_Lf_train,Y_Lf_train,X_Hf_train,Y_Hf_train);