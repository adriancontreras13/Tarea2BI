function [y] = svm_func(a,b,stepGama,stepSigma,baseGama,baseSigma,X_train,Y_train,X_test,Y_test)
  [grid] = inicializarGrid(stepGama, stepSigma, baseSigma, baseGama ,a, b);
  Besterr= 999999999999;
  for j=1:length(grid)
    g= grid(j,1);
    s= grid(j,2);
    [alpha beta] = svm_train(X_train,Y_train,s,g);
    [y]=svm_test(alpha, beta,X_train,X_test,s);
  endfor
end