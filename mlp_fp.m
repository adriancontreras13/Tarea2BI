function [z]= mlp_fp(x,W)
L=length(W)+1;
#printf("Esta wea es L");
#disp(L);
z=cell(L);
z{1}=x;
#printf("Esta wea es el largo de z{1}");
#disp(size(z{1}));
#printf("Esta wea es z{1}");
#disp(z{1});
for l =1:L-1
  aux = W{l}';
  aux = aux*z{l};
  z{l+1}=sigmoidAct(aux);
end
end