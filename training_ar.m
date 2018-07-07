function [ar]= training_ar(X,Y,name)
  name = strcat(name,".csv");
  a=pinv(X)*Y;
  csvwrite(name,a);
  %save filename a;
end