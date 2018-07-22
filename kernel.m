function [K] = kernel(X,Y,sigma)
  for i = 1:rows(X)
    for j = 1:rows(Y)
      if(columns(Y)==1)          
        if (columns(X)==1)
          K(i,j)=exp((-1/(2*sigma))*((norm(X(i)-Y(j))).^2));
        else
          K(i,j)=exp((-1/(2*sigma))*((norm(X(i,:)-Y(j))).^2));
        endif 
      else
        if (columns(X)==1)
          K(i,j)=exp((-1/(2*sigma))*((norm(X(i)-Y(j,:))).^2));
        else
          K(i,j)=exp((-1/(2*sigma))*((norm(X(i,:)-Y(j,:))).^2));
        endif
      endif
    endfor
  endfor
endfunction