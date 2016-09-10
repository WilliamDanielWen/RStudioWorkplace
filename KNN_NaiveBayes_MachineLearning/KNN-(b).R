require(class) #import to use the knn class
library(ggplot2) #import to draw the accuracy lines

#read file from the training data set and the test data set
setwd("knn_2D")
train_set <- read.csv("train.csv")
test_set <- read.csv("test.csv")

# store x1,x2 from the training data set and the test data set
train_set_x <- train_set[,2:3]
test_set_x <- test_set[,2:3]

# store true lables from the training data set and the test data set
train_set_labels <- train_set$label
test_set_labels <- test_set$label

setwd("..")

#define a function to calculate the prediction precision
calculate_precision <- function (predicted_labels,true_labels){
  
  error_count<- 0
  total_number <- NROW(predicted_labels)
  
  for(i in 1:total_number)
    if(predicted_labels[i]!=true_labels[i])
      error_count <- error_count+1
  error_count
  
  precision <- (1-error_count/total_number)*100
  
}

# declare a data frame to store precisions
train_set_precisions <- data.frame(k=1:12, training_set_precision_in_percent=0)
test_set_precisions <- data.frame(k=1:12, test_set_precision_in_percent=0)


# run the knn algorighm for 12 time with k=1...12
for(neigbor_num in 1:12){
  
  prediction_train_set <- knn(train=train_set_x, test=train_set_x,cl=train_set_labels,k=neigbor_num)
  train_set_precisions$training_set_precision_in_percent[neigbor_num]<-calculate_precision (prediction_train_set,train_set_labels)
  
  prediction_test_set <- knn(train=train_set_x, test=test_set_x,cl=train_set_labels,k=neigbor_num)
  test_set_precisions$test_set_precision_in_percent[neigbor_num]<-calculate_precision (prediction_test_set,test_set_labels)
  
}


#plot the precision of prediction on trianing set for k=1...12
train_set_precisions$k<-factor(train_set_precisions$k)
ggplot(train_set_precisions, aes(x=k, y=training_set_precision_in_percent,group=1)) + geom_line()+geom_point()

#plot the precision of prediction on trianing set for k=1...12
test_set_precisions$k<-factor(test_set_precisions$k)
ggplot(test_set_precisions, aes(x=k, y=test_set_precision_in_percent,group=1)) + geom_line()+geom_point()






