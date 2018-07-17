function [top_svm] = mejor_svm(data,train_size,lag,H,l)
  stepGama=[4,5];
  stepSigma=[4,6];
  a=[1,2];
  b=[9,10];
  baseGama=[2];
  baseSigma=[2];
  top_svm.mnsc=-999999999999999;
  for ind_Gama=1:length(baseGama)
    for ind_Sigma=1:length(baseSigma)
      for ind_sGama= 1:length(stepGama)
        for ind_sSigma=1:length(stepSigma)
          for ind_a=1:length(a)		
            for	ind_b=1:length(b)
              best_mnsc_local=[];
              for ind_H=1:H
                %Procesar datos
                [X_Lf_train,Y_Lf_train,X_Hf_train,Y_Hf_train,X_Lf_test,Y_Lf_test,X_Hf_test,Y_Hf_test]=procesa_data(data,train_size,l,lag,H);
                disp("process data");
                fflush(stdout);
                metricas=svm(a(ind_a),b(ind_b),stepGama(ind_sGama),stepSigma(ind_sSigma),baseGama(ind_Gama),baseSigma(ind_Sigma),X_Lf_train,Y_Lf_train,X_Hf_train,Y_Hf_train,X_Lf_test,Y_Lf_test,X_Hf_test,Y_Hf_test,l,H,lag);
                best_mnsc_local(end+1)=metricas.mnsc;
                disp("svm listo");  
                fflush(stdout);
              endfor
              disp(a(ind_a));
              fflush(stdout);
              if(mean(best_mnsc_local)>mean(top_svm.mnsc))
                top_svm.mnsc=mean(best_mnsc_local);
                top_svm.stepGama=stepGama(ind_sGama);
                top_svm.stepSigma=stepSigma(ind_sSigma);
                top_svm.a=a(ind_a);
                top_svm.b=b(ind_b);
                top_svm.baseGama=baseGama(ind_Gama);
                top_svm.baseSigma=stepSigma(ind_Sigma);
                save top_svm.txt top_svm;
              endif						
            endfor
          endfor			
        endfor
      endfor
    endfor
  endfor
endfunction