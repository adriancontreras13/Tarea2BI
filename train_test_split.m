function [XL_train,XH_train,XL_test,XH_test]= train_test_split(XL,XH,train_size,tamano)
  index_train = uint64(train_size*tamano);
  XL_train = XL(1:index_train);
  XL_test = XL(index_train+1:end);
  XH_train = XH(1:index_train);
  XH_test = XH(index_train+1:end);
end