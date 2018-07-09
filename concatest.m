function [LF_HF] = concatest(X_Lf_train,X_Hf_train)
    
  XL_add = X_Lf_train;
  XL_add = XL_add';
  XH_add = X_Hf_train;
  XH_add = XH_add';
  LF_matriz = [XL_add]';
  HF_matriz = [XH_add]';
  LF_HF = [LF_matriz';HF_matriz']';
  
endfunction
