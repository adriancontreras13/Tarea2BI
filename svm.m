function [metricas]= svm(a,b,stepGama,stepSigma,baseGama,baseSigma,X_Lf_train,Y_Lf_train,X_Hf_train,Y_Hf_train,X_Lf_test,Y_Lf_test,X_Hf_test,Y_Hf_test,l,H,lag)
	y_LF=svm_func(a,b,stepGama,stepSigma,baseGama,baseSigma,X_Lf_train,Y_Lf_train,X_Lf_test,Y_Lf_test);
	y_HF=svm_func(a,b,stepGama,stepSigma,baseGama,baseSigma,X_Hf_train,Y_Hf_train,X_Hf_test,Y_Hf_test);
	y=y_LF+y_HF;
	y_test=Y_Lf_test+Y_Hf_test;
	metricas=calculo_metricas(y,y_test);	
end