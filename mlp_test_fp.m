function [y]=mlp_test_fp(x_test,bestWTrain) 
  L = length(bestWTrain)+1;
  z= cell(L);
  z = mlp_fp(x_test,bestWTrain);
  y=z{L};
endfunction