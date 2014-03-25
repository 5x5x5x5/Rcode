## Model Checking and model selection
# Sometimes model checking is not allowed
# Often it can lead to problems
# - overfitting
# - Overtesting
# - biased inference
# But you don't want to miss something obvious

## Linear regression - basic assumptions
# Variance is constant
# You are summarizing a linear trend
# You have all the right terms in the model
# There are no big outliers

### Model checking - constant variance

set.seed(3433); par(mfrow=c(1,2))
data <- rnorm(100,mean=seq(0,3,length=100),sd=seq(0.1,3,length=100))
lm1 <- lm(data ~ seq(0,3,length=100))
plot(seq(0,3,length=100),data,pch=19,col="grey"); abline=lm1,col="red",lwd=3)
plot(seq(0,3,length=100),lm1$residuals,,pch=19,col="grey"); abline(c(0,0),col="red",lwd=3)
# What to do?
# - see if another variable explains the increased variance
# - use the vcovHC {sandwich} variance estimators (if n is big)

# Using the sandwich estimate
set.seed(3433); par(mfrow=c(1,2))
data <- rnorm(100,mean=seq(0,3,length=100),sd=seq(0.1,3,length=100))
lm1 <- lm(data ~ seq(0,3,length=100))
vcovHC(lm1)
summary(lm1)$cov.unscaled

### Model checking - linear trend

set.seed(3433); par(mfrow=c(1,2))
data <- rnorm(100,mean=seq(0,3,length=100)^3,sd=2)
lm1 <- lm(data ~ seq(0,3,length=100))
plot(seq(0,3,length=100),data,pch=19,col="grey"); abline(lm1,col="red",lwd=3)
plot(seq(0,3,length=100),lm1$residuals,,pch=19,col="grey"); abline(c(0,0),col="red",lwd=3)
# What to do?
# - use poisson regression(if it looks exponential/multiplicative)
# - use a data transformation (e.g. take the log)
# - smooth the data/fit a nonlinear trend (next week's lecture)
# - use linear regression anyway
# -- interpret as the linear trend between the variables
# -- use the vcovHC {sandwigh} variance estimators (if n is big)

### Model checking - missing covariate

set.seed(3433); par(mfrow=c(1,3)); z <- rep(c(-0.5,0.5),50)
data <- rnorm(100,mean=(seq(0,3,length=100) + z),sd=seq(0.1,3,length=100))
lm1 <- lm(data ~ seq(0,3,length=100))
plot(seq(0,3,length=100),data,pch=19,col=((z>0)+3)); abline(lm1,col="red",lwd=3)
plot(seq(0,3,length=100),lm1$residuals,pch=19,col=((z>0)+3)); abline(c(0,0),col="red",lwd=3)
boxplot(lm1$residuals ~ z,col = ((z>0)+3) )
# What to do?
# - use exploratory analysis to identify other variables to include
# - use the vcovNC
# - report unexplained patterns in the data

### model checking - outliers

set.seed(343); par(mfrow=c(1,2)); betahat <- rep(NA,100)
x <- seq(0,3,length=100); y <- rcauchy(100); lm1 <- lm(y ~ x)
plot(x,y,pch=19,col="blue"); abline(lm1,col="red",lwd=3)
for(i in 1:length(data)){betahat[i] <- lm(y[-i] ~ x[-i])$coeff[2]}
plot(betahat - lm1$coeff[2],col="blue",pch=19); abline(c(0,0),col="red",lwd=3)
# What to do?
# - if outliers are experimental mistakes - remove and document them
# - if they are real - consider reporting how sensitive your estimate is to outliers
# - consider using a robust linear model fir like rlm{MASS}

# Robust linear model

set.seed(343); x <- seq(0,3,length=100); y <- rcauchy(100);
lm1 <- lm(y ~ x); rlm1 <- rlm(y ~ x)
lm1$coeff
rlm1$coeff

par(mfrow=c(1,2))
plot(x,y,pch=19,col="grey")
lines(x,lm1$fitted,col="blue",lwd=3); lines(x,rlm1$fitted,col="green",lwd=3)
plot(x,y,pch=19,col="grey",ylim=c(-5,5),main="Zoomed In")
lines(x,lm1$fitted,col="blue",lwd=3); lines(x,rlm1$fitted,col="green",lwd=3)

### Model checking - default plots
# does alot of this automatically

set.seed(343); par(mfrow=c(1,2))
x <- seq(0,3,length=100); y <- rnorm(100); lm1 <- lm(y ~ x)
plot(lm1)

### Model checking - deviance
# - commonly reported for GLMs
# - usually compares the model where every opint gets its own parameter to the model you are using
# - on it's own it doesn't tell you what is wrong
# - in large samples the deviance may be big even for "consecutive" models
# - you can not compare deviances for models with different sampe sizes

## R^2 may be a bad summary

### Model selection
# Many times you have multiple variables to evaluate
# Options for choosing variables
# - domain-specific knowledge
# - exploratory analysis
# - statistical selection
# There are many statistical selection options
# - step-wise
# - AIC
# - BIC
# - modern approaches: Lasso, Ridge-regression, etc.
# Statistical selection may bias your inference
# - if possible, do selection on a held out sample

## Error measures
# R^2 alone isn't enough - more variables = bigger R^2
# Adjusted R^2 takes into account the number of estimated parameters
# AIC also penalizes models with more parameters
# BIC does the same, but with a bigger penalty

### Movie data

download.file( movies03RT.txt)
movies <- read.table(movies.txt,sep="\t",header=T,quote="")
head(movies)

movies <- movies[,-1]
lm1 <- lm(score ~ .,data=movies)
aicFormula <- step(lm1)

aicFormula

library(leaps);
regSub <- regsubsets(score ~ .,data=movies)
plot(regSub)

### model selection - bic.glm

library(BMA)
bicglm1 <- bic.glm(score ~ .,data=movies,glm.family="gaussian")
print(bicglm1)
