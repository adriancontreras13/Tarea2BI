function [x]= hankel(data,l)
  n = length(data);
  m = n-l+1;
  x = zeros(m,l);
  for i=1:m
    x(i,:)=data(i:i+l-1);
  end
end