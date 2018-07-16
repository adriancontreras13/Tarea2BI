function [graficoid]= grafico(array_mnsc,h,lag,l,graficoid,mejor_metrica,modelo)
  figure(graficoid);
  texto = strcat('Lag: ',num2str(mejor_metrica.lag),' MAE: ',num2str(mejor_metrica.mae),' RMSE: ',num2str(mejor_metrica.rmse),' R2: ',num2str(mejor_metrica.r2),' mNSE: ',num2str(mejor_metrica.mnsc));
  titulo = strcat(' mNSC v/s horizontes con hankel L = ',int2str(l));
  hold on
  leyendas=[];
  for i=1:length(lag)
    n = lag(i);
    n = num2str(n);
    leyenda = strcat('Lag = ',n);
    leyendas = [leyendas; leyenda];
    plot(array_mnsc(i,:),'-.*');
  endfor
  
  legend(leyendas);
  xlabel('Horizonte(dias)');
  ylabel('mNSC');
  text(4.5,-0.075,texto);
  title(strcat(modelo,titulo));
  hold off
  
end