%Parametros
%Rango de las L de hankel
arreglo_hankel=[2,4,6,8,10,15,20,30,40,50];
%Rango de las h del Horizonte
arreglo_h=[20];
%Arreglo de lags
lag=[20,21,22,23,24,25,26,27,28,29,30];
%Datasets
data= csvread("dataeval.csv");
%data= csvread("daily-minimum-temperatures-in-me.csv");
%data = data(:,1);
train_size = 0.7;
%==============================================================================%
%mejores_parametros(data,train_size,lag,arreglo_hankel,arreglo_h);
%==============================================================================%
h=30;
l = 8;
more off;
%==============================================================================%
%Grafico ACF  
%ACF(data,40);
%==============================================================================%

%modelo_arr(data,train_size,h,l,lag);

%modelo_arx(data,train_size,h,l,lag);

%modelo_mlp(data,train_size,h,l,lag);

%modelo_mlpx(data,train_size,h,l,lag);

%modelo_svm(data,train_size,h,l,lag);

modelo_svmx(data,train_size,h,l,lag);

%%%%%%%%%%%%%%%%%%%%%%%%%