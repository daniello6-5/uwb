library(class)
library(e1071)
library(mlbench)
library(tree)


data(Vehicle)
l.obs <- nrow(Vehicle)
tmp <- sample(1:l.obs,round(l.obs/3), replace=FALSE)
V.train <- Vehicle[-tmp,]
V.test <- Vehicle[tmp,]

V.train.tree<-tree(Class~., V.train)

plot(V.train.tree)
text(V.train.tree)

s <-predict(V.train.tree,V.test[,-19],type= 'class')

blad<-1-sum(s==V.test[,19])/length(V.test[,19])