function [] = ACF(data,lag)
    autocorr = [];
    for i = 1:lag
      autocorr = [autocorr autocorrelacion(data,i)];
    end
y=1; 
 
    alpha=0.005;
    N=length(autocorr);
    
    u=-tinv(alpha/2,N-1);
    x_bar=mean(autocorr);
    sigma=(std(autocorr));
    intervalo=[-(x_bar-u*sigma/sqrt(N)),x_bar-u*sigma/sqrt(N)];
    
  
  figure(1);
  stem(autocorr,'fill','b');
  hold on
  line ([0 N], [intervalo(1) intervalo(1)], "linestyle", "--", "color", "r");
  line ([0 N], [intervalo(2) intervalo(2)], "linestyle", "--", "color", "r");
  hold off
  set(gca, 'XLim', [1.0 lag]);
  xlabel('LAG');
  ylabel('Autocorrelacion');
  title("Autocorrelacion vs LAG");
  grid on
  print -djpg ACF.jpg
endfunction