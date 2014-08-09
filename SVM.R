
#example SVM in R using Iris data

head(iris)
attach(iris)

svm_model <- svm(Species ~ ., data=iris)
summary(svm_model)

x <- subset(iris, select=-Species)
y <- Species

svm_model1 <- svm(x,y)
summary(svm_model1)


pred <- predict(svm_model1,x)
system.time(pred <- predict(svm_model1,x))

table(pred,y)


