library(mlbench)
library(nnet)

data(Vehicle)
l.obs <- nrow(Vehicle)
tmp <-sample(1:l.obs,round(l.obs/3), replace=FALSE)

V.train <- Vehicle[-tmp,]
V.test <- Vehicle[tmp,]

cos.nn <- nnet(Class ~., data = V.train, size = 2)

cos.pred <- predict(cos.nn,V.test,type= 'class')

blad<-1-sum(cos.pred==V.test[,19])/length(V.test[,19])
  