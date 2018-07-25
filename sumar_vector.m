function [resultado]= sumar_vector(a,b,c)
  resultado = [];
  if(c==1)
    for i =1:length(a)
      cal = abs(a(i)+b(i));
      resultado = [resultado;cal];
    endfor
  endif
  if(c==2)
    for i =1:length(a)
      cal = abs(b(i)-a(i));
      resultado = [resultado;cal];
    endfor
  endif
end