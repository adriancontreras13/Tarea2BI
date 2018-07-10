function [ar]= training_ar(name)
  if (name=="LF"):
    X=csvread("X_Lf_train.csv");    
    Y=csvread("Y_Lf_train.csv");
  if (name=="HF"):
    X=csvread("X_Hf_train.csv");    
    Y=csvread("Y_Hf_train.csv");
  endif
  coeficiente=ctrcut("Coeficientes_",name,".csv");
  a=pinv(X)*Y;
  csvwrite(coeficiente,a);
  %save filename a;
end