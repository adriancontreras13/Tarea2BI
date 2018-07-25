function [y]= svm_test(alpha, beta, trainx, testing, s)
   y=alpha' * kernel2(trainx,testing,s) + beta;
end

