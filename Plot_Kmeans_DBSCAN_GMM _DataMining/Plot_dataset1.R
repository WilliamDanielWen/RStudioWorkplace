library(ggplot2) 

#plot the  dataset1
dataset1<-read.csv("dataset1.csv")
ggplot(dataset1, aes(x=x_coordinate, y=y_coordinate,color=factor(true_label))) + geom_point()+ ggtitle("Dataset 1 input")+scale_colour_manual(values=c("red","blue","green","black","yellow","orange"))

kmeans1<-read.csv("Kmeans_result_on_dataset1.csv")
ggplot(kmeans1, aes(x=x_coordinate, y=y_coordinate,colour=factor(cluster_label))) + geom_point()+ ggtitle("Kmeans result on dataset 1")+scale_colour_manual(values=c("red","black","blue","green","yellow","orange","darkred"))

dbscan1<-read.csv("DBSCAN_result_on_dataset1.csv")
ggplot(dbscan1, aes(x=x_coordinate, y=y_coordinate,colour=factor(cluster_label))) + geom_point()+ ggtitle("DBSCAN result on dataset 1")+scale_colour_manual(values=c("red","black","blue","green","yellow","orange","darkred"))

gmm1<-read.csv("GMM_result_on_dataSet1.csv")
ggplot(gmm1, aes(x=x_coordinate, y=y_coordinate,colour=factor(cluster_label))) + geom_point()+ ggtitle("GMM result on dataset 1")+scale_colour_manual(values=c("red","black","blue","green","yellow","orange"))
