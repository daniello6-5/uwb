library(class)
library(e1071)
library(mlbench)
library(tree)


dane<-read.table("/home/student/Pobrane/iris_train.csv",header=T, sep= ",")
dane1<-read.table("/home/student/Pobrane/iris_test.csv",header=T, sep= ",")

dane.tree<-tree(klasa ~., dane)
dane.tree<-prune.tree(dane.tree,best =  4)
dane1.tree<-tree(klasa ~., dane1)


plot(dane.tree)
text(dane.tree)

s<-predict(dane.tree,dane1[,-5],type='class')

blad<-1-sum(s==dane1[,5])/length(dane1[,5])

  
  
  
  
  

  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
)