function [mlpt]=mlp_test(x_test,y_test,bestWTrain) 
  L = length(bestWTrain)+1;
  z= cell(L);
  z = mlp_fp(x_test,bestWTrain);
  z{L}=round(z{L});
  l_E =cell(1,L-1);
  l_E{L-1} = y_test - z{L};
  mlpt.mse = mean(l_E{L-1}.^2);
endfunction