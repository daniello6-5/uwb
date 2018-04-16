library(RoughSets)
library(class)
library(e1071)

data(iris)

l.obs<-nrow(iris)
tmp <-sample(1:l.obs,round(l.obs/3), replace=FALSE)
V.train <- SF.asDecisionTable(iris[-tmp,],decision.attr = 4)
V.test <- SF.asDecisionTable(iris[tmp,],decision.attr = 4)
V.test.class <-iris[tmp,ncol(iris)]

decisiontrain.table <- SF.asDecisionTable(dataset = V.train, decision.attr = 3 , indx.nominal = 3)
decisiontest.table <- SF.asDecisionTable(dataset = V.test, decision.attr = 3 , indx.nominal = 3)

cut.Value <- D.discretization.RST(decisiontrain.table)

data.train <- SF.applyDecTable(decisiontrain.table,cut.Value)
data.test <- SF.applyDecTable(decisiontest.table,cut.Value)


rules <- RI.LEM2Rules.RST(data.test)

pred <- predict(rules,data.test)

blad<-1-sum(pred$predictions==V.test[,5])/length(V.test[,5])





