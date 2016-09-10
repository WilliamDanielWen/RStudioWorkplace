library(ggplot2) 



#plot the  dataset3
dataset3<-read.csv("dataset3.csv")
ggplot(dataset3, aes(x=x_coordinate, y=y_coordinate,color=factor(true_label))) + geom_point()+ ggtitle("Dataset 3 input")+scale_colour_manual(values=c("red","black","blue","green","white","orange"))

kmeans3<-read.csv("Kmeans_result_on_dataset3.csv")
ggplot(kmeans3, aes(x=x_coordinate, y=y_coordinate,colour=factor(cluster_label))) + geom_point()+ ggtitle("Kmeans result on dataset 3")+scale_colour_manual(values=c("red","black","blue","green","white","orange"))

dbscan3<-read.csv("DBSCAN_result_on_dataset3.csv")
ggplot(dbscan3, aes(x=x_coordinate, y=y_coordinate,colour=factor(cluster_label))) + geom_point()+ ggtitle("DBSCAN result on dataset 3")+scale_colour_manual(values=c("red","black","blue","green","white","orange"))

gmm3<-read.csv("GMM_result_on_dataSet3.csv")
ggplot(gmm3, aes(x=x_coordinate, y=y_coordinate,colour=factor(cluster_label))) + geom_point()+ ggtitle("GMM result on dataset 3")+scale_colour_manual(values=c("red","black","blue","green","white","orange"))


