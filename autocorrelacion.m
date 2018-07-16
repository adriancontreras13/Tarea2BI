function [autocorr] = autocorrelacion(data, lag)
  numerador=autocovarianza(data,lag);
  denominador=autocovarianza(data,0);
  autocorr=numerador/denominador;
  fprintf("Autocorrelacion ");
  disp(autocorr);
endfunction
