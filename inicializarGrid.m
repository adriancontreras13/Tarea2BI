function [grid] = inicializarGrid(StepGama, StepSigma, baseSigma, baseGama, a, b)
  for i=a:StepSigma : b
     for j = a: StepGama : b
      grid(end+1,:)=[(baseGama(1))^j (baseSigma(1))^(i)]; 
     endfor
  endfor
end