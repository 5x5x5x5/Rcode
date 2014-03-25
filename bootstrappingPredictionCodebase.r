### Bootstraping for prediction
## Key ideas
# Bootstrapping can be useful for
# - cross-validation type error rates
# - prediction errors in regression models
# - improving prediction (in clever ways)

## Bootstrapping prediction errors
library(boot); data(nuclear)
make.lm <- lm(log(cost) ~ date,data=nuclear)
plot(nuclear$date,log(nuclear$cost),pch=19)
abline(nuke.lm,col="red",lwd=3)

newdata <- data.frame(date = seq(65,72,length=100))
nuclear <- cbind(nuclear,resid=rstudent(nuke.lm),fit=fitted(nuke.lm))
nuke.fun <- function(data,inds,newdata){
  lm.b <- lm(fit+ resid[inds] ~ date,data=data)
  pred.b <- predict(lm.b,newdata)
  return(pred.b)
}
nuke.boot <- boot(nuclear,nuke.fun,R=1000,newdata=newdata)
head(nuke.boot$t)


pred <- predict(nuke.lm,newdata)
predSds <- apply(nuke.boot$t,2,sd)
plot(newdata$date,pred,col="black",type="l",lwd=3,ylim=c(0,10))
lines(newdata$date,pred + 1.96*predSds,col="red",lwd=3)
lines(newdata$date,pred - 1.96*predSds,col="red",lwd=3)


### Bagging (bootstrap aggregating)
## improves prediction accuracy
# 1. resample cases and recalculate predictions
# 2. average or majority vote
# Notes
# - similar bias
# - reduced variance
# - more useful for non-linear functions

## Bagged loess
library(ElemStatLearn); data(ozone,package="ElemStatLearn")
ozone <- ozone[order(ozone$ozone),]
head(ozone)

ll <- matrix(NA,nrow=10,ncol=155)
for(i in 1:10){
  ss <- sample(1:dim(ozone)[1],replace=T)
  ozone0 <- ozone[ss,]; ozone0 <- ozone0[order(ozone0$ozone),]
  loess0 <- loess(temperature ~ ozone,data=ozone0,span=0.2)
  ll[i,] <- predict(loess0,newdata=data.frame(ozone=1:155))
}


plot(ozone$ozone,ozone$temperature,pch=19,cex=0.5)
for(i in 1:10){lines(1:155,ll[i,],col="grey",lwd=2)}
lines(1:155,apply(ll,2,mean),col="red",lwd=2)
# the bagged version of the loess curve will in general have lower 
# error rate than any of the individual bootstrap curves or the
# original fit



## Bagged trees
# 1. resample data
# 2. recalculate tree
# 3. average/mode of predictors (mode = most common value)
# Notes
# - more stable
# - may not be as good as random forests

data(iris)
head(iris)

library(ipred)
bagTree <- bagging(Species ~.,data=iris,coob=TRUE)
print(bagTree)

# Looking at bagged tree one
bagTree$mtrees[[1]]$btree
# and then the next one - they are slightly different
bagTree$mtrees[[2]]$btree

## more common use - Random forests
# 1. Bootstrap samples
# 2. At each split, bootstrap variables
# 3. Grow multiple trees and vote
# Pros
# - accuracy
# Cons
# - speed
# - interpretability
# - overfitting

library(randomForest)
forestIris <- randomForest(Species ~ Petal.Width + Petal.Length,data=iris,prox=TRUE)
forestIris
## (OOB = out of bag) estimate of error rate

# getting a single tree
getTree(forestIris,k=2)

# Class "centers"
iris.p <- classCenter(iris[,c(3,4)],iris$Species, forestIris$prox)
plot(iris[,3],iris[,4],pch=21,xlab=names(iris)[3],ylab=names(iris)[4],
  bg=c("red","blue","green")[as.numeric(factor(iris$Species))],
  main="Iris Data with Prototypes")
points(iris.p[,1], iris.p[,2], pch=21, cex=2, bg=c("red", "blue", "green"))

# Combining random forests
forestIris1 <- randomForest(Species~Petal.Width + Petal.Length,data=iris,prox=TRUE,ntree=50)
forestIris2 <- randomForest(Species~Petal.Width + Petal.Length,data=iris,prox=TRUE,ntree=50)
forestIris3 <- randomForest(Species~Petal.Width + Petal.Length,data=iris,prox=TRUE,ntree=50)
combine(forestIris1,forestIris2,forestIris3)

# predicting new values
newdata <- data.frame(Sepal.Length<- rnorm(1000,mean(iris$Sepal.Length),sd(iris$Sepal.Length)),
                      Sepal.Width <- rnorm(1000,mean(iris$Sepal.Width), sd(iris$Sepal.Width)),
					  Petal.Width <- rnorm(1000,mean(iris$Petal.Width),sd(iris$Petal.Width)),
					  Petal.Length <- rnorm(1000,mean(iris$Petal.Length),sd(iris$Petal.Length)))

pred <- predict(forestIris,newdata)

plot(newdata[,4], newdata[,3], pch=21, xlab="Petal.Length",ylab="Petal.Width",
  bg=c("red", "blue", "green")[as.numeric(pred)],main="newdata Predictions")
  
## Notes
# particularly useful for nonlinear models
# watch for overfitting (see rfcv function)
# Out of bag estimates are an efficient estimate of test error 