function [autocovar] = autocovarianza(data,lag)
   autocovar = 0;
   K = 100;
   N = rows(data);
   
   
   %media = mean(data);
   %factor = 1/(N-lag);
   suma=0;
   for i=1:N
     suma += data(i,1);
   end
    suma /=N;
     
   for t=1:(N-K)
     if t <= N && t+lag <= N
      autocovar += ((data(t,1)-suma)*(data(t+lag,1)-suma));
     end
   end
   %autocovar = factor*autocovar;
  
endfunction