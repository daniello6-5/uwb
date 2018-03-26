library(mlbench)
library(e1071)

data(Vehicle)


x<-Vehicle[,-19]


hc<-hclust(dist(x),method = "complete")
vec <- cutree(hc,k=15)
table(Vehicle[,19],vec)
plot(hc)



