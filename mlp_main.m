function [metricas] = mlp_main(topologias,iteraciones,X_Lf_train,Y_Lf_train,X_Hf_train,Y_Hf_train,X_Lf_test,Y_Lf_test,X_Hf_test,Y_Hf_test)
  mlp_save_parameters(X_Hf_train',Y_Hf_train',X_Hf_test',Y_Hf_test',topologias,iteraciones,"_hf");
  mlp_save_parameters(X_Lf_train',Y_Lf_train',X_Lf_test',Y_Lf_test',topologias,iteraciones,"_lf");
  metricas=mlp_additive_forecasting(X_Hf_test',Y_Hf_test',X_Lf_test',Y_Lf_test');
endfunction