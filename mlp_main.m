function [multilayer_perceptron] = mlp_main(topologias,iteraciones)
  %Entradas y salidas de alta frecuencia
  x_train_hf= csvread("X_Hf_train.csv");
  y_train_hf=csvread("Y_Hf_train.csv");
  x_test_hf=csvread("X_Hf_test.csv");
  y_test_hf=csvread("Y_Hf_test.csv");
  
  %Entradas y salidas de baja frecuencia
  x_train_lf=csvread("X_Lf_train.csv");
  y_train_lf=csvread("Y_Lf_train.csv");
  x_test_lf=csvread("X_Lf_test.csv");
  y_test_lf=csvread("Y_Lf_test.csv");
  
  %Ingresar lectura de entradas concatenadas

  mlp_save_parameters(x_train_hf',y_train_hf',x_test_hf',y_test_hf',topologias,iteraciones,"_hf");
  mlp_save_parameters(x_train_lf',y_train_lf',x_test_lf',y_test_lf',topologias,iteraciones,"_lf");
  mlp_additive_forecasting(x_test_hf',y_test_hf',x_test_lf',y_test_lf');
  %w = load("mejorPeso.txt");
  %disp(w);
  %mlpt = mlp_test(x_test,y_test,w);
endfunction