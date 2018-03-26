library(mlbench)
library(e1071)

data("iris")

x<- iris[,-5]

cl<-kmeans(x,2, nstart = 20)
print(cl)

plot(x,col=cl$cluster)

cl$cluster
cl$size