function [autocovar] = autocovarianza(data,l)
   N = rows(data);
   media = mean(data);
   factor = 1/(N-l);
   sum=0;
   for t=1:(N-l)
     sum=sum+((data(t)-media)*(data(t+l)-media));
   end
   autocovar = factor*sum;
   fprintf("Autocovarianza:");
   disp(autocovar);
  
endfunction