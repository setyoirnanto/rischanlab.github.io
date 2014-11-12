
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


set.seed(4)
dat <- data.frame(pop = rnorm(900, c(0,3,6), 1), strat = factor(rep(c(0,1,2), times=300)))
ind <- sample(1:900)
train <- dat[ind[1:600],]
test <- dat[ind[601:900],]

svm_tune <- tune(svm, train.x=i, train.y=j, 
              kernel="radial", ranges=list(cost=10^(-1:2), gamma=c(.5,1,2)))


svm_model_after_tune <- svm(Species ~ ., data=iris, kernel="radial", cost=1, gamma=0.5)
summary(svm_model_after_tune)


pred <- predict(svm_model_after_tune,x)
system.time(predict(svm_model_after_tune,x))


