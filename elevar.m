function [resultado]= elevar(a,c)
  resultado = [];
  if(c==1)
    for i =1:length(a)
      cal = a(i).^2;
      resultado = [resultado;cal];
    endfor
  endif
  if(c==2)
    for i =1:length(a)
      cal = abs(a(i));
      resultado = [resultado;cal];
    endfor
  endif
end