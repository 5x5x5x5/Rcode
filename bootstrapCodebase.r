### Bootstrap
## Key ideas
#Treat the sample as if it were the population
## What is it good for:
# Calculating standard errors
# Forming confidence intervals
# Performing hypothesis tests
# Improving predictors

## Example
set.seed(333); x <- rnorm(30)
bootMean <- rep(NA,1000); sampledMean <- rep(NA,1000)
for(i in 1:1000){bootMean[i] <- mean(sample(x,replace=TRUE))}
for(i in 1:1000){sampledMean[i] <- mean(rnorm(30))}
plot(density(bootMean)); lines(density(sampledMean),col="red")

# Example with boot package
set.seed(333)
x <- rnorm(30); sampledMean <- rep(NA,1000)
for(i in 1:1000){sampledMean[i] <- mean(rnorm(30))}
meanFunc <- function(x,i){mean(x[i])}
bootMean <- boot(x,meanFunc,1000)
bootMean

# Plotting boot package example

plot(density(bootMean$t)); lines(density(sampledMean),col="red")

## Nuclear costs
# Use the boot package to calculate confidence interval without having to make any assumptions about normality or other stron parametric modelling assumptions
library(boot); data(nuclear)
nuke.lm <- lm(log(cost) ~ date,data=nuclear)
plot(nuclear$date,log(nuclear$cost),pch=19)
abline(nuke.lm,col="red",lwd=3)

# next calculate bootstrap samples and refit the line
par(mfrow=c(1,3))
for(i in 1:3){
    nuclear0 <- nuclear[sample(1:dim(nuclear)[1],replace=TRUE),]
	nuke.lm0 <- lm(log(cost) ~ date,data=nuclear0)
	plot(nuclear0$date,log(nuclear0$cost),pch=19)
	abline(nuke.lm0,col="red",lwd=3)
}

# Try to calculate the distribution of expected values from a sample of this population and recalculate the linear model coefficients.
# Generate simulate 1000 linear model fits where you've resampled the dataset with replacement
bs <- function(data, indicies,formula) {
  d <- data[indicies,];fit <- lm(formula, data=d);return(coef(fit))
  }
results <- boot(data=nuclear, statistic=bs, R=1000, formula=log(cost) ~ date)
plot(density(results$t[,2]),col="red",lwd=3)
lines(rep(nuke.lm$coeff[2],10),seq(0,8,length=10),col="blue",lwd=3)

# bootstrap confidence intervals

boot.ci(results)

## Bootstraping from a submodel with the goal of performing a hypothesis test
# Performing a hypothesis test using the bootstrap

resid <-rstudent(nuke.lm)
fit0 <- fitted(lm(log(cost) ~ 1,data=nuclear))
newNuc <- cbind(nuclear,resid=resid,fit0=fit0)
bs <- function(data, indices) {
    return(coef(glm(data$fit0 + data$resid[indices] ~ data$date,data=data)))
}
results <- boot(data=newNuc, statistic=bs, R=1000)

# plot the relationship if there was no relationship between cost and date
plot(density(results$t[,2]),lwd=3,col="blue")
lines(rep(coef(nuke.lm)[2],10),seq(0,3,length=10),col="red",lwd=3)
# distribution centered on zero
# calculate an empirical p-value by summing the area to the right of the expected ___
# then reflect the line about the y axis and summ below for a two sided value

## An empirical p-value
B <- dim(results$t)[1]
(1 + sum((abs(results$t[,2]) > abs(coef(nuke.lm)[2]))))/(B+1)

boot.ci(results)
# results not quite the same as lecture - oh depends on seed.

## Bootstrap on non-linear statistics
# Calculating the confidence interval for the sample median is a very difficult thing analytically - no so for bootstrap
set.seed(555); x <- rnorm(30); sampledMed <- rep(NA,1000)
for(i in 1:1000){sampledMed[i] <- median(rnorm(30))}
medFunc <- function(x,i){median(x[i])}
bootMed <- boot(x,medFunc,1000)
plot(density(bootMed$t),col="red",lwd=3)
lines(density(sampledMed),lwd=3)

## Things you can't bootstrap (max) or min

set.seed(333); x <- rnorm(30); sampledMax <- rep(NA,1000)
for(i in 1:1000){sampledMax[i] <- max(rnorm(30))}
maxFunc <- function(x,i){max(x[i])}
bootMax <- boot(x,maxFunc,1000)
plot(density(bootMax$t),col="red",lwd=3,xlim=c(1,3))
lines(density(sampledMax),lwd=3)
