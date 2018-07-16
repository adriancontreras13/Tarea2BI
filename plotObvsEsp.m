function [titulo]=plotObvsEsp(y_esperado,y_obtenido,titulo,id_grafico) 
  %Grafico obtenido vs esperado
  figure(id_grafico)
  plot (y_esperado,"-b");
  hold on
  plot (y_obtenido,"-r");
  legend('Valor esperado','Valor obtenido');
  hold off
  grid on
  title(strcat("Grafico Datos normalizados vs Tiempo ",titulo));
  xlabel ("Tiempo (Dias)");
  ylabel ("Valores Normalizados");
endfunction