function [mlp]=mlp_train(xe,ye,mlp)
  L=length(mlp.W)+1; % # H_Layer
  z=cell(L);
  for iter = 1:mlp.MaxIter
    %---Step Forward
    z=mlp_fp(xe,mlp.W);
    %--- step Backward: Update W
[mlp.W mse(iter)]=mlp_upd_w(ye,z,mlp.W,mlp.mu);
end
mlp.mse=mse;
endfunction