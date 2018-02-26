library(class)
dane<-read.table("/home/student/Pobrane/iris_train.csv",header=T, sep= ",")
dane1<-read.table("/home/student/Pobrane/iris_test.csv",header=T, sep= ",")
m_irys<-matrix(nrow=106,ncol=4)
m_irys[,1]<-dane$ddk
m_irys[,2]<-dane$sdk
m_irys[,3]<-dane$dp
m_irys[,4]<-dane$sp
t_irys<-matrix(nrow=44,ncol=4)
t_irys[,1]<-dane1$ddk
t_irys[,2]<-dane1$sdk
t_irys[,3]<-dane1$dp
t_irys[,4]<-dane1$sp
klasa<-dane$klasa
klasa1<-dane1$klasa


wynik<-knn(m_irys,t_irys,klasa,1)
blad<-1-sum(wynik==klasa1)/length(klasa1)





