function [] = ACF(data, l)
  for i = 1:l
    autocorr(i) = autocorrelacion(data,i);
  end
  [intervalo, N] = intervalo_de_confianza(autocorr);
  
  figure(1);
  h = stem(autocorr);
  hold on
  line ([0 N], [intervalo(1) intervalo(1)], "linestyle", "--", "color", "r");
  line ([0 N], [intervalo(2) intervalo(2)], "linestyle", "--", "color", "r");
  hold off
  xlabel('LAG');
  ylabel('Autocorrelacion');
  title("LAG vs Autocorrelacion");
  grid on
endfunction