function [A B]= svm_train(X, Y, sigma, gama)
  n=size(X,1);
  K=kernel(X,sigma);
  E=eye(n)/gama;
  H = K + E;
  mu= inv(H)*ones(n,1);
  V=inv(H)*Y;
  S=ones(1,n)*mu;
  B=(mu'*Y)/S;
  A=V - mu*B;
end