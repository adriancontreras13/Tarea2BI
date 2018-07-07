function [svm] = svm_func(X_train,Y_Train,X_test, Y_test,train_size,n)
  %Se divide la data de training y la de testing  
	stepGama=1;
	stepSigma=3;
	a=-1;
	b=5;
	baseGama=[10 ];
	baseSigma=[10 ]; 
	%
 %%Aqui comienza el reciclaje descarado de la tarea 1
	%
  for i=a:stepSigma : b
     for j = a: stepGama : b
      grid(end+1,:)=[(baseGama(1))^j (baseSigma(1))^(i)]; 
     endfor
  endfor
  Besterr= 200;
  for j=1:length(grid)
    g= grid(j,1);
    s= grid(j,2);
    %se inicializan los valores de alpha y beta
    [alpha beta] = svm_train(X_train, Y_Train, s, g);
    [y]=svm_test(alpha, beta, X_train, X_test, s);
    Err=mean((Y_test-y).^2);
    Errors(end+1) = Err;
    if (Err<Besterr)
      bestAlpha = alpha;
      bestbeta = beta;
      bestsigma = s;
      bestgamma = g;
      Besterr=Err;
      besty=y;
    endif 
  endfor

endfunction
