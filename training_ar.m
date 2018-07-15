function [a]= training_ar(X,Y)
  a=pinv(X)*Y;
  %save filename a;
end