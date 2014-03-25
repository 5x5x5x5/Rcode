### Combining Predictors
## Key ideas
# You can combine classifiers by averaging/voting
# Combining classifiers improves accuracy
# Combining classifiers reduces interpretability

## Basic intuition
# Suppose we have 5 independent classifiers
# If accuracy is &70% for each:
# 10 * (0.7^3*0.3^3) + 5 * (0.7^4*0.3^2) + 0.7^5
# = 83.7% accuracy
# With 101 independent classifiers
# = 99.9% accuracy

## Approaches for combining classifiers
# 1. Bagging (see previous lecture)
# 2. Boosting
# 3. Combining different classifiers

## Example
library(devtools)
install_github("medley","mewo2")
library(medley)
set.seed(453234) 
y <- rnorm(1000)
x1 <- (y > 0); x2 <- y*rnorm(1000)
x3 <- rnorm(1000,mean=y,sd=1); x4 <-(y > 0) & (y < 3)
x5 <- rbinom(1000,size=4,prob=exp(y)/(1+exp(y)))
x6 <- (y < -2) | (y > 2)
data <- data.frame(y=y,x1=x1,x2=x2,x3=x3,x4=x4,x5=x5,x6=x6)
train <- sample(1:1000,size=500)
trainData <- data[train,]; testData <- data[-train,]

# Baisc models
library(tree)
lm1 <- lm(y ~.,data=trainData)
rmse(predict(lm1,data=testData),testData$y)

tree1 <- tree(y ~.,data=trainData)
rmse(predict(tree1,data=testData),testData$y)

tree2 <- tree(y~.,data=trainData[sample(1:dim(trainData)[1]),])

## Combining models
combine1 <- predict(lm1,data=testData)/2 + predict(tree1,data=testData)/2
rmse(combine1,testData$y)

combine2 <- (predict(lm1,data=testData)/3 + predict(tree1,data=testData)/3
              + predict(tree2,data=testData)/3)
rmse(combine2,testData$y)

## Medley package
#library(devtools)
#install_github("medley","mewo2")
library(medley)
library(e1071)
library(randomForest)
x <- trainData[,-1]
y <- trainData$y
newx <- testData[,-1]

# Blending models
m <- create.medley(x, y, errfunc=rmse);
for (g in 1:10) {
  m <- add.medley(m, svm, list(gamma=1e-3 * g));
}
# also try different values of random forests
for (mt in 1:2) {
  m <- add.medley(m,randomForest, list(mtry=mt));
# prune medley to the top 80% of models}
m <- prune.medley(m, 0.8);
rmse(predict(m,newx),testData$y)
# leads to significantly redused rmse!  from 1.2 -> ~ .5


### Notes
# Even simple blending can be useful
# Majority vote is typical for binary/multiclass data
# Makes models hard to interpret
