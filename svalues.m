function [C,r]= svalues(h)
  [U,S,V] = svd(h,3);
  D=svd(S);
  r = length(D);
  A=cell(r);
  for i=1:r
    A{i}= D(i)*U(:,i)*V(:,i)';  
  end
  C =cell(r);
  for i=1:r
    Aux = A{i};
    C{i} = [Aux(1,:) Aux(2:end,end)']; 
  end
end