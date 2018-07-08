%Parametros
lag=4;
%data = load("nuevo.txt");
data= csvread("daily-minimum-temperatures-in-me.csv");
data = data(:,2);
train_size = 0.6;
l=3;
H=6;
autocovar = autocovarianza(data,l);
autocorre = autocorrelacion(data,l);

%==============================================================================%
  more off;
  for i = 1:l
    autocorr(i) = autocorrelacion(data,i); 
  end
  
  [intervalo, N]= intervalo_de_confianza(autocorr)
  
  figure(1);
  h = stem(autocorr);
  hold on
  line ([0 N], [intervalo(1)  intervalo(1)], "linestyle", "--", "color", "r");
  line ([0 N], [intervalo(2)  intervalo(2)], "linestyle", "--", "color", "r");
  hold off
  xlabel('Lag');
  ylabel('Autocorrelacion');
  title("Autocorrelacion vs Lag");
  grid on
  print -dpng ACF 

%==============================================================================%
%Normalizacion de data
data = data/norm(data);

%Matriz de Hankel
h=hankel(data,l);

%Descomposicion de valores singulares
[C,r]=svalues(h);

%Altas frecuencias y Bajas frecuencias(XH Y XL)
[Hf,Lf]=frecuencias(C,r);
tamano = size(C{1},2);
%tamano = size(Hf,2);

%Entrenamiento y testing de altas y bajas frecuencias
[Lf_train,Hf_train,Lf_test,Hf_test]=train_test_split(Lf,Hf,train_size,tamano);

[X_Lf_train,Y_Lf_train] = train_split(Lf_train,lag,H);
[X_Hf_train,Y_Hf_train] = train_split(Hf_train,lag,H);

[X_LfHf_train,Y_LfHf_train] = concat(X_Lf_train,Y_Lf_train,X_Hf_train,Y_Hf_train);


[X_Lf_test, Y_Lf_test] = test_split(Lf_test,lag);
[X_Hf_test, Y_Hf_test] = test_split(Lf_test,lag);

[X_LfHf_test,Y_LfHf_test] = concat(X_Lf_test,Y_Lf_test,X_Hf_test,Y_Hf_test);


%%MLP%%
%topologias = [40 20; 20 25; 33 24; 20 40; 30 20; 20 20; 20 30; 20 18; 20 19; 21 19];
topologias = [5 5;2 2];
iteraciones = 100;
%Training con HF
mlp_main(X_Hf_train',Y_Hf_train',X_Hf_test', Y_Hf_test',topologias,iteraciones);
%Training con LF
%mlp_main(X_LfHf_train,Y_LfHf_train,X_Hf_test,Y_Hf_test,topologias,iteraciones);

%%SVM%%
%[svm]=svm_func(X_Lf_train,Y_Lf_train,X_Lf_test, Y_Lf_test,train_size,tamano);


%% AR %%
%Training AR
%Training LF
%training_ar(X_Lf_train,Y_Lf_train,"Coeficientes_Lf");
%Training HF
%training_ar(X_Hf_train,Y_Hf_train,"Coeficientes_Hf");
%Testing
%testing_ar(X_Lf_train,Y_Lf_train,X_Hf_train,Y_Hf_train);

