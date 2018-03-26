library(mlbench)
library(e1071)

data(Vehicle)


x<-Vehicle[,-19]
    

cl<-cmeans(x,2)
print(cl)

plot(x,col=cl$cluster)
cl$membership
cl$size
cl$cluster

