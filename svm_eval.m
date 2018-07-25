function [y] = svm_eval(gg,ss,X_train,Y_train,X_test,Y_test)
    g= gg;
    s= ss;
    [alpha beta] = svm_train(X_train,Y_train,s,g);
    [y]=svm_test(alpha, beta,X_train,X_test,s);
    metricas=calculo_metricas(y',Y_test);
    fprintf("\n\n gamma:%d ----sigma :%d ---- mnsec: %d",g,s,metricas.mnsc);
end