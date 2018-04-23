library(class)
library(e1071)
library(adabag)

data("iris")
lobs<-nrow(iris)
tmp<-sample(1:lobs,round(lobs/3),replace = FALSE)

vtrain<-iris[-tmp,]
vtest<-iris[tmp,]

iris.bag <- bagging(Species ~ ., data=vtrain, mfinal = 10)

iris.pred <- predict.bagging(iris.bag, newdata=vtest)

importanceplot(iris.bag)

waznosci <- iris.bag$importance
glosowanie <- iris.bag$votes

blad<-1-sum(iris.pred$class==vtest[,5])/length(vtest[,5])


