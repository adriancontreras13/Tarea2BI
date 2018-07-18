function [X_Lf_train,Y_Lf_train,X_Hf_train2,Y_Hf_train2,X_Lf_test,Y_Lf_test,X_Hf_test2,Y_Hf_test2]=procesa_data2(data,train_size,l,lag,H)
  %Normalizacion de data
  data = data/norm(data);


  %Matriz de Hankel
  h=hankel(data,l);

  %Descomposicion de valores singulares
  [C,r]=svalues(h);

  %Altas frecuencias y Bajas frecuencias(XH Y XL)
  [Hf,Lf]=frecuencias(C,r);

  %Pruebas, comentar si no se usa 
  %Lf = [1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20];
  %Hf = [21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38 39 40];


  tamano = size(Hf,2);

  %Entrenamiento y testing de altas y bajas frecuencias
  [Lf_train,Hf_train,Lf_test,Hf_test]=train_test_split(Lf,Hf,train_size,tamano);

  %Separando X e Y

  [X_Lf_train,Y_Lf_train] = train_split(Lf_train,lag,H);
  [X_Hf_train,Y_Hf_train] = train_split(Hf_train,lag,H);

  [X_Lf_test,Y_Lf_test] = train_split(Lf_test,lag,H);
  [X_Hf_test,Y_Hf_test] = train_split(Hf_test,lag,H);
  
  [X_Hf_train2,Y_Hf_train2] =concat(X_Lf_train,X_Hf_train,Y_Hf_train); 
  [X_Hf_test2,Y_Hf_test2] = concat(X_Lf_test,X_Hf_test,Y_Hf_test);
end