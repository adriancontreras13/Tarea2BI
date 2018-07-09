function [y]= svm_test(alpha, beta, trainx, testing, s)
  for i=1:rows(testing)
    y(end+1,1) =alpha'  * kernel(trainx,testing(i,:),s) + beta;
  end
  disp(y(end));
end