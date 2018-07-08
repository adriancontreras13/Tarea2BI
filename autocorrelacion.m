function [autocorr] = autocorrelacion(data, l)
  numerador=autocovarianza(data,l);
  denominador=autocovarianza(data,0);
  autocorr=numerador/denominador;
endfunction
