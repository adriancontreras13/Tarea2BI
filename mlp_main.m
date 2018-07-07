function [multilayer_perceptron] = mlp_main(x_train,y_train,x_test,y_test,topologias,iteraciones)
  mlp_save_parameters(x_train,y_train,x_test,y_test,topologias,iteraciones);
  %w = load("mejorPeso.txt");
  %disp(w);
  %mlpt = mlp_test(x_test,y_test,w);
endfunction