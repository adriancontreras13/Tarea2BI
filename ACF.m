function [] = ACF(data, l)
    for i = 1:l
    autocorr(i) = autocorrelacion(data,i);
  end
  
  alpha=0.05;
    N=length(autocorr);
    u=-tinv(alpha/2,N-1);
    x_bar=mean(autocorr);
    sigma=(std(autocorr));
    intervalo=[x_bar-u*sigma/sqrt(N),x_bar+u*sigma/sqrt(N)];
    disp(intervalo);
  
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