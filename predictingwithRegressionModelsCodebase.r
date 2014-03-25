### Predicting with regression models

## Key ideas
# use a standard regression model
# - lm
# - glm
# predict new values with the coefficients
# useful when the linear model is (nearly) correct

#Pros
# - easy to implement
# - easy to interpret
#Cons
# - poor performance in nonlinear settings

## Example: Old-faithful eruptions
data(faithful)
dim(faithful)

set.seed(333)
trainSamples <- sample(1:272,size=(272/2),replace=F)
trainFaith <- faithful[trainSamples,]
testFaith <- faithful[-trainSamples,]
head(trainFaith)

plot(trainFaith$waiting,trainFaith$eruptions,pch=19,col="blue",xlab="Waiting",ylab="Duration")

# Fit a linear model    EDi = b0 + b1*WTi +ei

lm1 <- lm(eruptions ~ waiting,data=trainFaith)
summary(lm1)

# Model fit
plot(trainFaith$waiting,trainFaith$eruptions,pch=19,col="blue",xlab="Waiting",ylab="Duration")
lines(trainFaith$waiting,lm1$fitted,lwd=3)

## Predict a new value   EDhat =b0hat + b1hat*WT   when waiting time is 80

coef(lm1)[1] + coef(lm1)[2]*80

newData <- data.frame(waiting=80)
predict(lm1,newData)

## Plot predictions - training and test

par(mfrow=c(1,2))
plot(trainFaith$waiting,trainFaith$eruptions,pch=19,col="blue",xlab="Waiting",ylab="Duration")
lines(trainFaith$waiting,predict(lm1),lwd=3)
plot(testFaith$waiting,testFaith$eruptions,pch=19,col="blue",xlab="Waiting",ylab="Duration")
lines(testFaith$waiting,predict(lm1,newdata=testFaith),lwd=3)

## Get training set/test errors
# Calculate RMSE on training
sqrt(sum((lm1$fitted-trainFaith$eruptions)^2))
## [1] 5.713
#Calculate RMSE on test
sqrt(sum((predict(lm1,newdata=testFaith)-testFaith$eruptions)^2))
## [1] 5.827

## Prediction intervals
pred1 <- predict(lm1,newdata=testFaith,interval="prediction")
ord <- order(testFaith$waiting)
plot(testFaith$waiting,testFaith$eruptions,pch=19,col="blue")
matlines(testFaith$waiting[ord],pred1[ord,],type="l",,col=c(1,2,2),lty = c(1,1,1), lwd=3)

# Examples with binary data

# Ravens data

download.file ( never works)
load("./ravensData.rda")
head(ravensData)

## Fit a logistic regression logit(E[RWi|RSi]) = b0 + b1RSi

glm1 <- glm(ravenWinNum ~ ravenScore,family="binomial",data=ravensData)
par(mfrow=c(1,2))
boxplot(predict(glm1) ~ ravensData$ravenWinNum,col="blue")
boxplot(predict(glm1,type="response") ~ reavensData$ravenWinNum,col="blue")

# Chossing a cutoff (re-substitution)
xx <- seq(0,1,length=10); err <- rep(NA,10)
for(i in 1:length(xx)){
  err[i] <- sum((predict(glm1,type="response") > xx[i]) != ravensData$ravenWinNum)
}

plot(xx,err,pch=19,xlab="Cutoff",ylab="Error")

## Comparing models with cross validation

library(boot)
cost <- function(win, pred = 0) mean(abs(win-pred) > 0.5)
glm1 <- glm(ravenWinNum ~ ravenScore,family="binomial",data=ravensData)
glm2 <- glm(ravenWinNum ~ ravenScore,family="gaussian",data=ravensData)
cv1 <- cv.glm(ravensData,glm1,cost,K=3)
cv2 <- cv.glm(ravensData,glm2,cost,K=3)
cv1$delta

cv2$delta

## regression models with multiple covariates can be included
## often useful in combination with other models
