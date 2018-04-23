library(class)
library(e1071)
library(randomForest)
library(mlbench)

data(Vehicle)
lobs<-nrow(Vehicle)
tmp<-sample(1:lobs,round(lobs/3),replace = FALSE)

vtrain<-Vehicle[-tmp,]
vtest<-Vehicle[tmp,]

ind <- sample(2, nrow(vtrain), replace = TRUE, prob=c(0.8, 0.2))
Vehicle.rF <- randomForest(Class ~ ., data=vtrain)
vehicle.pred <- predict(Vehicle.rF, vtest,type = "class")

waznosci <- Vehicle.rF$importance

varImpPlot(Vehicle.rF)

blad<-1-sum(vehicle.pred==vtest[,5])/length(vtest[,5])
