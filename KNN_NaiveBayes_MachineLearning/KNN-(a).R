require(class) #import to use the knn class

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

#draw the decision boundary and regions

#create the background points based on the trainning set coordinates(make denser points than the training set coordinates)
bgx1 <- seq(from = range(train_set_x$x1)[1]-1, to = range(train_set_x$x1)[2]+1, by = 0.1 )
bgx2 <- seq(from = range(train_set_x$x2)[1]-1, to = range(train_set_x$x2)[2]+1, by = 0.1 )
bgpoints <- expand.grid(x1 = bgx1, x2 = bgx2)

#for knn1
#use the model we trained to the predict background points 
prediction_bgpoints_knn1 <- knn(train=train_set_x, test=bgpoints,cl=train_set_labels,k=1,prob=TRUE)
#store its probabilities 
prob_bgpoints_knn1<- attr(prediction_bgpoints_knn1, "prob")
#only store the probability of being label "1"
prob_bgpoints_knn1 <- ifelse(prediction_bgpoints_knn1==1, prob_bgpoints_knn1, 1-prob_bgpoints_knn1)
prob_bgpoints_knn1<-matrix(prob_bgpoints_knn1,length(bgx1),length(bgx2))
#draw the regeion and boundary, when probability of being label of 1 is greater than 0.5, we draw
#it as red, otherwise, blue
contour(bgx1, bgx2, prob_bgpoints_knn1, levels=0.5, labels="", xlab="", ylab="", main="KNN, K=1", axes=TRUE)
points(bgpoints, pch=".", cex=1.0, col=ifelse(prob_bgpoints_knn1>0.5, "red", "blue"))
#plot the training set
points(train_set_x, col=ifelse(train_set_labels==1, "red", "blue"))
box()

#for knn9
#use the model we trained to the predict background points 
prediction_bgpoints_knn9 <- knn(train=train_set_x, test=bgpoints,cl=train_set_labels,k=9,prob=TRUE)
#store its probabilities 
prob_bgpoints_knn9<- attr(prediction_bgpoints_knn9, "prob")
#only store the probability of being label "1"
prob_bgpoints_knn9 <- ifelse(prediction_bgpoints_knn9==1, prob_bgpoints_knn9, 1-prob_bgpoints_knn9)
prob_bgpoints_knn9<-matrix(prob_bgpoints_knn9,length(bgx1),length(bgx2))
#draw the regeion and boundary, when probability of being label of 1 is greater than 0.5, we draw
#it as red, otherwise, blue
contour(bgx1, bgx2, prob_bgpoints_knn9, levels=0.5, labels="", xlab="", ylab="", main="KNN, K=9", axes=TRUE)
points(bgpoints, pch=".", cex=1.0, col=ifelse(prob_bgpoints_knn9>0.5, "red", "blue"))
#plot the training set
points(train_set_x, col=ifelse(train_set_labels==1, "red", "blue"))
box()