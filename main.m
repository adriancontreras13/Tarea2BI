%Parametros
%Rango de las L de hankel
arreglo_hankel=[2,4,6,8,10,15,20,30,40,50];
%Rango de las h del Horizonte
arreglo_h=[20];
%Arreglo de lags
arreglo_lag=[2,4,6,8,10,15,20,25,30,35,40,45,50,60,64,70,80];
%Datasets
%data= csvread("mean-daily-temperature-fisher-ri.csv");
data= csvread("daily-minimum-temperatures-in-me.csv");
data = data(:,2);
train_size = 0.8;
%==============================================================================%
l=500;
H=1;
lag = 80;
%autocovar = autocovarianza(data,l);
%autocorre = autocorrelacion(data,l);
%==============================================================================% 
%mejores_parametros(data,train_size,arreglo_lag,arreglo_hankel,arreglo_h);
%==============================================================================%
%Grafico ACF  
ACF(data,lag);
%==============================================================================%
h=20;
lag = [62 64 66];
l = 2;
%modelo_arr(data,train_size,h,l,lag);

%modelo_arx(data,train_size,h,l,lag);

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

%SVM%
%mejor_svm(data,train_size,lag,H,l);


%training_ar(X_Lf_train,Y_Lf_train,"Coeficientes_Lf");
%Training HF
%training_ar(X_Hf_train,Y_Hf_train,"Coeficientes_Hf");
%Testing
%testing_ar(X_Lf_train,Y_Lf_train,X_Hf_train,Y_Hf_train);