function [z]= mlp_fp(x,W)
L=length(W)+1;

z=cell(L);
z{1}=x;

for l =1:L-1
  aux = W{l}';
  aux = aux*z{l};
  z{l+1}=sigmoidAct(aux);
end
end