function [AAR]= aar(X_Lf_train,Y_Lf_train,X_Hf_train,Y_Hf_train)
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
  disp(x);
  x = x(l+1:n,:);
  x =fliplr(x);
  Xar=x(:,1:l);
  Yar=x(:,l+1);
  a=pinv(Xar)*Yar;
end