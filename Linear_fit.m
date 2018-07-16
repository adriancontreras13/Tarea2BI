function [] = Linear_fit(x,y,titulo,id_grafico)
  
  %a = sum(y)*sum(x.*x) - sum(x)*sum(x.*y);
  %a = a/(length(x)*sum(x.*x) - sum(x)*sum(x));
  %b = length(x)*sum(x.*y) - sum(x)*sum(y);
  %b = b/(length(x)*sum(x.*x) - sum(x)*sum(x));
  m = length(x);
  X = [ones(m, 1) x];
  theta = ((pinv(X'*X))*X'*y);
  
  figure(id_grafico);
  plot(x,y,"g*");
  hold on
  plot(y,y, ':');
  plot(X(:,2), X*theta, '-');
  %plot(x,a+b*x, '-');
  labels = {"Data Points", "Best Linear Fit", "Y=X"};
  hold off
  xlabel('Valor Real');
  ylabel('Valor Obtenido');
  title(strcat("Grafico de Regresion lineal",titulo));
  grid on  
  endfunction