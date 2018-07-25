function [y] = svm_func(a,b,stepGama,stepSigma,baseGama,baseSigma,X_train,Y_train,X_test,Y_test,grid)
  %[grid] = inicializarGrid(stepGama, stepSigma, baseSigma, baseGama ,a, b);
  Besterr.mnsc = -999999;
  Besterr.s = 0;
  Besterr.g = 0;
  g = 16;
  s = 4;
  %for j=1:length(grid)
    %g= grid(j,1);
    %s= grid(j,2);
    [alpha beta] = svm_train(X_train,Y_train,s,g);
    [y]=svm_test(alpha, beta,X_train,X_test,s);
    metricas=calculo_metricas(y',Y_test);
    if metricas.mnsc > Besterr.mnsc
       Besterr.mnsc = metricas.mnsc;
       Besterr.s = s;
       Besterr.g = g;
    endif
    fprintf("\n\n gamma:%d ----sigma :%d ---- mnsec: %d",g,s,metricas.mnsc);
  %endfor
end