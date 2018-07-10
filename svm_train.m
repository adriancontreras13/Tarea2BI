function [A B]= svm_train(X, Y, sigma, gama)
  n=length(X);
  K=kernel(X,Y,sigma);
  E=eye(n);
  %E=eye(n,n)/gama;
  H = K + E;
  mu= inv(H)*ones(n,1);
  V=inv(H)*Y;
  S=ones(1,n)*mu;
  B=(mu'*Y)/S;
  A=V - mu*B;
end