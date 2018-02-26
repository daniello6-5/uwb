library(class)
library(e1071)

dane<-read.table("/home/student/Pobrane/iris_train.csv",header=T, sep= ",")
dane1<-read.table("/home/student/Pobrane/iris_test.csv",header=T, sep= ",")



CB <- naiveBayes(dane[,-5],dane[,5])
s <-predict(CB,dane1[,-5])

blad<-1-sum(s==dane1[,5])/length(dane1[,5])

