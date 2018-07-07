function [y]= svm_test(alpha, beta, trainx, testing, s)
  for i=1:rows(testing)
    y(end+1,1) =sign( alpha'  * kernel(trainx,testing(i,:),s) + beta);
  end
end