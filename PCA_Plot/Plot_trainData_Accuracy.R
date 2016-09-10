library(ggplot2) 

#plot train data
TwoD_train<-read.csv("train_to_2_dim.csv")
ggplot(TwoD_train, aes(x=PC1, y=PC2,colour=factor(LABEL))) + geom_point()+ ggtitle("dimension reduction to 2 on trianing data")+scale_colour_manual(values=c("red","blue","green","orange","deepskyblue4","indianred4","lightblue","darkblue","gold4","lightcoral","wheat2","black","white"))


#plot the precision of svm on test set for different dimension
input <- read.csv("SvmOnPcaResult.CSV")
ggplot(input, aes(x=Dimension, y=Accuracy,group=1)) + geom_line()+geom_point()+ggtitle("Accuracy of different dimensions")


