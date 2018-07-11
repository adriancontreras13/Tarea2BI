function [AAR]= aar(X_Lf_train,Y_Lf_train,X_Hf_train,Y_Hf_train,X_Lf_test,Y_Lf_test,X_Hf_test,Y_Hf_test)
  a_lf = training_ar(X_Lf_train,Y_Lf_train);
  a_hf = training_ar(X_Hf_train,Y_Hf_train);
  y_lf = test_ar(X_Lf_test,a_lf);
  y_hf = test_ar(X_Hf_test,a_hf);
  y_aditive = y_lf + y_hf;
  y_aditive_test = Y_Hf_test + Y_Lf_test;
  [metricas] = calculo_metricas(y_aditive,y_aditive_test);
end