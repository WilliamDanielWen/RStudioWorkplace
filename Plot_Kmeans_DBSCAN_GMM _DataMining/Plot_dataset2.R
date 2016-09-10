library(ggplot2) 



#plot the  dataset2
dataset2<-read.csv("dataset2.csv")
ggplot(dataset2, aes(x=x_coordinate, y=y_coordinate,color=factor(true_label))) + geom_point()+ ggtitle("Dataset 2 input")+scale_colour_manual(values=c("red","black","blue","green","white","orange"))

kmeans2<-read.csv("Kmeans_result_on_dataset2.csv")
ggplot(kmeans2, aes(x=x_coordinate, y=y_coordinate,colour=factor(cluster_label))) + geom_point()+ ggtitle("Kmeans result on dataset 2")+scale_colour_manual(values=c("red","black","blue","green","white","orange"))

dbscan2<-read.csv("DBSCAN_result_on_dataset2.csv")
ggplot(dbscan2, aes(x=x_coordinate, y=y_coordinate,colour=factor(cluster_label))) + geom_point()+ ggtitle("DBSCAN result on dataset 2")+scale_colour_manual(values=c("red","black","blue","green","white","orange","deepskyblue4","indianred4","lightblue","darkblue","gold4","lightcoral","wheat2"))

gmm2<-read.csv("GMM_result_on_dataSet2.csv")
ggplot(gmm2, aes(x=x_coordinate, y=y_coordinate,colour=factor(cluster_label))) + geom_point()+ ggtitle("GMM result on dataset 2")+scale_colour_manual(values=c("red","black","blue","green","white","orange"))


