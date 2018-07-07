function [XH,XL]= frecuencias(C,r)
  XL = C{1};
  tamano = size(C{1},2);
  XH = zeros(1,tamano);
  for i=2:r
    for j=1:tamano
      XH(j) = XH(j) + C{i}(j);    
    end
  end
end