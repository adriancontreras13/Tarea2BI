function [metricas]=calculo_metricas(y_additive,y_additive_test) 
  e=y_additive_test-y_additive;
  metricas.mse=mean(e.^2);
  metricas.rmse=sqrt(metricas.mse);
  metricas.mae=mean(abs(e));
  metricas.mape=mean(abs(e/y_additive_test));
  metricas.r2=1-(sum(e.^2)/sum((y_additive_test-mean(y_additive_test)).^2));
  metricas.mnsc=1-((sum(abs(e)))/(sum(abs(y_additive_test-mean(y_additive_test)))));
endfunction