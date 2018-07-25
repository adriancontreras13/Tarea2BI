function [K] = kernel(X,sigma)
  K = [];
  %disp(sigma);
  for k=1:size(X,1)
    for j=1:size(X,1)
      expp = -(1/(2*sigma));
      normm = norm(X(k,:)-X(j,:))**2;
      K(k,j) = exp(expp*normm);   
    endfor
  endfor
endfunction