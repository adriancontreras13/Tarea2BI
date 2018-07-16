function [] = Linear_fit(x,y,titulo)
  
  a = sum(y)*sum(x.*x) - sum(x)*sum(x.*y);
  a = a/(length(x)*sum(x.*x) - sum(x)*sum(x));
  b = length(x)*sum(x.*y) - sum(x)*sum(y);
  b = b/(length(x)*sum(x.*x) - sum(x)*sum(x));
  
  figure(2);
  plot(x,y,"g*");
  hold on
  plot(y,y, ':');
  plot(x,a+b*x, '-');
  labels = {"Data Points", "Best Linear Fit", "Y=X"};
  hold off
  xlabel('Valor Real');
  ylabel('Valor Obtenido');
  title("Regresion lineal");
  grid on  
  endfunction