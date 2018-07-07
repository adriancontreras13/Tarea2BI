function [mlpt]=mlp_test(x_test,y_test,bestWTrain) 
  L = length(bestWTrain)+1;
  z= cell(L);
  z = mlp_fp(x_test,bestWTrain);
  z{L}=round(z{L});
  l_E =cell(1,L-1);
  l_E{L-1} = y_test - z{L};
  mlpt.mse = mean(l_E{L-1}.^2);
  true_p = 0;
  true_n = 0;
  false_p = 0;
  false_n = 0;
  for i=1:length(z{L})
    if y_test(1,i) == 1
      if y_test(1,i) - z{L}(1,i) == 0
        true_p = true_p + 1;
      else
        false_p = false_p + 1;
      endif
    endif
    if y_test(1,i) == 0
      if y_test(1,i) - z{L}(1,i) == 0
        true_n = true_n + 1;
      else
        false_n = false_n + 1;
      endif
    endif
  endfor
  mlpt.confusion_matrix = [true_p false_p;false_n true_n];
  if true_p + false != 0
    mlpt.precision_irf = true_p/(true_p+false_p);
  else
    mlpt.precision_irf = 0;
  endif
  if true_p + false_n !=0
    mlpt.recall_irf = true_p/(true_p + false_n);
  else
    mlpt.recall_irf = 0;
  endif
  if mlpt.precision_irf + mlpt.recall_irf != 0
    mlpt.f_score_irf = 2*((mlpt.precision_irf*mlpt.recall_irf)/(mlpt.precision_irf+mlpt.recall_irf));
  else
    mlpt.f_score_irf = 0;
  endif
  if true_p + false != 0
    mlpt.precision_irf = true_p/(true_p+false_p);
  else
    mlpt.precision_irf = 0;
  endif
  if true_p + false_n !=0
    mlpt.recall_irf = true_p/(true_p + false_n);
  else
    mlpt.recall_irf = 0;
  endif
  if mlpt.precision_irf + mlpt.recall_irf != 0
    mlpt.f_score_irf = 2*((mlpt.precision_irf*mlpt.recall_irf)/(mlpt.precision_irf+mlpt.recall_irf));
  else
    mlpt.f_score_irf = 0;
  endif
  
  mlpt.accuracy = (true_p + true_n)/(true_p+true_n+false_p+false_n);
  
  if true_n + false_n != 0
    mlpt.precision_orf = true_n/(true_n+false_n);
  else
    mlpt.precision_orf = 0;
  endif
  if true_p + false_p !=0
    mlpt.recall_orf = true_n/(true_n + false_p);
  else
    mlpt.recall_orf = 0;
  endif
  if mlpt.precision_orf + mlpt.recall_orf != 0
    mlpt.f_score_orf = 2*((mlpt.precision_orf*mlpt.recall_orf)/(mlpt.precision_orf+mlpt.recall_orf));
  else
    mlpt.f_score_orf = 0;
  endif
  #fprintf("\n Verdaderos positivos: %d",true_p);
  #fprintf("\n Verdaderos negativos: %d",true_n);
  #fprintf("\n Falsos positivos: %d",false_p);
  #fprintf("\n Falsos negativos: %d",false_n);
endfunction