library(class)
library(e1071)
library(adabag)

data("iris")
lobs<-nrow(iris)
tmp<-sample(1:lobs,round(lobs/3),replace = FALSE)

vtrain<-iris[-tmp,]
vtest<-iris[tmp,]

iris.adaboost <- boosting(Species~., data=vtrain, boos=TRUE, mfinal=3)
iris.pred <- predict.boosting(iris.adaboost, newdata=vtest)

importanceplot(iris.adaboost)
waznosci <- iris.adaboost$importance
glosy <- iris.adaboost$votes

blad<-1-sum(iris.pred$class==vtest[,5])/length(vtest[,5])

