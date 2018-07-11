function [parameters] = mlp_additive_forecasting(x_test_hf,y_test_hf,x_test_lf,y_test_lf)
  load("mejorPesoMLP_hf.txt");
  W_hf=bestWTrainGlobal;
  load("mejorTopologiaMLP_hf.txt");
  topologia_hf=topologia;
  y_hf=mlp_test_fp(x_test_hf,W_hf);
  load("mejorPesoMLP_lf.txt");
  W_lf=bestWTrainGlobal;
  load("mejorTopologiaMLP_lf.txt");
  topologia_lf=topologia;
  y_lf=mlp_test_fp(x_test_lf,W_lf);
  y_additive=y_hf+y_lf;
endfunction