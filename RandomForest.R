
#Random Forest in R example IRIS data
detach("package:RColorBrewer", unload=TRUE)

#Split iris data to Training data and testing data

ind <- sample(2,nrow(iris),replace=TRUE,prob=c(0.7,0.3))
trainData <- iris[ind==1,]
testData <- iris[ind==2,]

#Load Library Random FOrest

library(randomForest)

#Generate Random Forest learning treee

iris_rf <- randomForest(Species~.,data=trainData,ntree=100,proximity=TRUE)
table(predict(iris_rf),trainData$Species)
print(iris_rf)
plot(iris_rf)
importance(iris_rf)
varImpPlot(iris_rf)


#Try to build random forest for testing data
irisPred<-predict(iris_rf,newdata=testData)
table(irisPred, testData$Species)

plot(margin(iris_rf,testData$Species))

tune.rf <- tuneRF(iris[,-5],iris[,5],  mtry=2, ntreeTry=100, stepFactor=2, improve=0.05)
print(tune.rf)
