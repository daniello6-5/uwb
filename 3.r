library(class)
library(e1071)
library(mlbench)



data(Vehicle)
l.obs <- nrow(Vehicle)
tmp <- sample(1:l.obs,round(l.obs/3), replace=FALSE)
V.train <- Vehicle[-tmp,]
V.test <- Vehicle[tmp,]

CB <- naiveBayes(V.train[,-19],V.train[,19])
s <-predict(CB,V.test[,-19])

blad<-1-sum(s==V.test[,19])/length(V.test[,19])