library(e1071) #import to use the naive bayes class

#read file from the training data set and the test data set
setwd("census")
train_set <- read.csv("adult.train.csv")
test_set <- read.csv("adult.test.csv")

#transfer the objects into character and remove the extra "dot" in the test set
test_set[,15]<-gsub(".", "", as.character(test_set[,15]), fixed = TRUE)
test_set[,15]<- as.factor(test_set[,15])

#step1 clean the data

#clean the data with missing value of " ?"
clean_column <- function(column,sbstitution){
  row_num <- NROW(column)
  for(i in 1:row_num)
    if(as.character(column[i])==" ?")
      column[i]<-as.factor(sbstitution)
    column
}

subti_value<-names(which.max(table(train_set$workclass)))
train_set$workclass<-clean_column(train_set$workclass,subti_value)

subti_value<-names(which.max(table(test_set$workclass)))
test_set$workclass<-clean_column(test_set$workclass,subti_value)

subti_value<-names(which.max(table(train_set$occupation)))
train_set$occupation<-clean_column(train_set$occupation,subti_value)

subti_value<-names(which.max(table(test_set$occupation)))
test_set$occupation<-clean_column(test_set$occupation,subti_value)

subti_value<-names(which.max(table(train_set$native.country)))
train_set$native.country<-clean_column(train_set$native.country,subti_value)

subti_value<-names(which.max(table(test_set$native.country)))
test_set$native.country<-clean_column(test_set$native.country,subti_value)

#prepare input variables and labels
train_set_x<-train_set[,1:14]
train_set_label<-train_set[,15]

test_set_x<-test_set[,1:14]
test_set_label<-test_set[,15]

setwd("..")


#step2 build the naive bayes model and make prediction

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


#train the naiveBayes model and make the prediction
model <- naiveBayes(label ~ ., data = train_set)
predict_test_set_label<-predict(model, test_set_x)

#transform the predict_test_set_label and test_set_label from factor into character to calculate 
#precision
predict_test_set_label <- as.character(predict_test_set_label)
test_set_label <- as.character(test_set_label)

#store the precision 
precision<-calculate_precision(predict_test_set_label,test_set_label)
