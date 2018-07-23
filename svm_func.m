function [y] = svm_func(a,b,stepGama,stepSigma,baseGama,baseSigma,X_train,Y_train,X_test,Y_test,grid)
  %[grid] = inicializarGrid(stepGama, stepSigma, baseSigma, baseGama ,a, b);
  Besterr= 999999999999;
  for j=1:length(grid)
    g= grid(j,1);
    s= grid(j,2);
    [alpha beta] = svm_train(X_train,Y_train,s,g);
    [y]=svm_test(alpha, beta,X_train,X_test,s);
    metricas=calculo_metricas(y,Y_test);
    fprintf("\n gama: %d -- sigma: %d -- mNSC: %d",g,s,metricas.mnsc);
  endfor
end