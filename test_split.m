function [Xar]= test_split(XL_train,lag)
  l = lag-1;
  n = length(XL_train);
  m = n-l;
  x = zeros(n,l+1);
  for i=1:l+1
    j=i;
    k=1;
    for p=j:n    
      x(p,i)=XL_train(k);
      k=k+1;    
    endfor
  endfor
  x = x(l+1:n,:);
  x =fliplr(x);
  Xar=x;
  
end