function [LF_HF,Y] = concat(X_Lf_train,Y_Lf_train,X_Hf_train,Y_Hf_train)
    
  XL_add = X_Lf_train;
  XL_add = XL_add';
  YL_add = Y_Lf_train;
  YL_add = YL_add';
  XH_add = X_Hf_train;
  XH_add = XH_add';
  YH_add = Y_Hf_train;
  YH_add = YH_add';
  LF_matriz = [XL_add;YL_add]';
  HF_matriz = [XH_add;YH_add]';
  LF_HF = [LF_matriz';HF_matriz']';
  Y = LF_HF(:,[columns(LF_HF)]);
  LF_HF(:,[columns(LF_HF)]) = [];
endfunction
