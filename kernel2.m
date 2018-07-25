function [k] = kernel2(x_train,x_test,sigma)
  %[grid] = inicializarGrid(stepGama, stepSigma, baseSigma, baseGama ,a, b);
  k =[];
  for i = 1:size(x_train,1)
    for j = 1:size(x_test,1)
      k(i,j) = exp(-(1/(2*sigma))*norm(x_train(i,:)-x_test(j,:))**2);
    endfor
  endfor
end