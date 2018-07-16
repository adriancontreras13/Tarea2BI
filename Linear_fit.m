function [] = Linear_fit(x,y,titulo,id_grafico)

  m = length(x);
  X = [ones(m, 1) x];
  theta = ((pinv(X'*X))*X'*y);
  
  figure(id_grafico);
  plot(x,y,"g*");
  hold on
  plot(y,y, ':');
  plot(X(:,2), X*theta, '-');
  labels = {"Data Points", "Best Linear Fit", "Y=X"};
  hold off
  xlabel('Valor Real');
  ylabel('Valor Obtenido');
  title(strcat("Grafico de Regresion lineal",titulo));
  grid on  
  endfunction