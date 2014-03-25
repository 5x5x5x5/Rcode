### Simulation for Model Checking
## Key ideas
# Way back in the first week we talked about simulating data from distributions in R using the rfoo functions
# In general simulations are way more flexible/useful
# - for bootstrapping as we saw
# - for evaluating models
# - for testing different hypotheses
# - for sensitivity analysis
# At minimum it is useful to simulate
# - a best case scenario
# - a few examples where you know your approach won't work
# - the importance of simulating extremes

## Simulating data from a model
# regression model Yi = b0 + b1Xi + ei
# here is an example of generating data from this model where Xi and ei are normal:
set.seed(44333)
x <- rnorm(50)
e <- rnorm(50)
b0 <- 1; b1 <- 2
y <- b0 + b1*x + e

# Violating assumptions
set.seed(44333)
x <- rnorm(50)
e <- rnorm(50); e2 <- rcauchy(50)
b0 <- 1; b1 <- 2
y <- b0 + b1*x + e; y2 <- b0 + b1*x + e2

par(mfrow=c(1,2))
plot(lm(y ~ x)$fitted,lm(y~x)$residuals,pch=19,xlab="fitted",ylab="residuals")
plot(lm(y2 ~ x)$fitted,lm(y2~x)$residuals,pch=19,xlab="fitted",ylab="residuals")

## Repeatedsimulations
set.seed(44333)
betaNorm <- betaCauch <- rep(NA,1000)
for(i in 1:1000){
  x <- rnorm(50); e <- rnorm(50); e2 <- rcauchy(50); b0 <- 1; b1 <- 2
  y <- b0 + b1*x + e; y2 <- b0 + b1*x + e2
  betaNorm[i] <- lm(y ~ x)$coeff[2]; betaCauch[i] <- lm(y2 ~ x)$coeff[2]
}
quantile(betaNorm)

quantile(betaCauch)

# Monte carlo error
boxplot(betaNorm,betaCauch,col="blue",ylim=c(-5,5))

# Simulation based on a original data set characteristics
library(UsingR); data(galton); nobs <- dim(galton)[1]
par(mfrow=c(1,2))
hist(galton$child,col="blue",breaks=100)
hist(galton$parent,col="blue",breaks=100)

# Calculating means,variances
lm1 <- lm(galton$child ~ galton$parent)
parent0 <- rnorm(nobs,sd=sd(galton$parent),mean=mean(galton$parent))
child0 <- lm1$coeff[1] + lm1$coeff[2]*parent0 + rnorm(nobs,sd=summary(lm1)$sigma)
par(mfrow=c(1,2))
plot(galton$parent,galton$child,pch=19)
plot(parent0,child0,pch=19,col="blue")

## Simulating more complicated scenarios
library(bootstrap); data(stamp); nobs <- dim(stamp)[1]
hist(stamp$Thickness,col="grey",breaks=100,freq=F)
dens <- density(stamp$Thickness)
lines(dens,col="blue",lwd=3)

# A simulation that is too simple
plot(density(stamp$Thickness),col="black",lwd=3)
for(i in 1:10){
  newThick <- rnorm(nobs,mean=mean(stamp$Thickness),sd=sd(stamp$Thickness))
  lines(density(newThick),col="grey",lwd=3)
}
# kernel desnity estimate does it better
# stacking overlapping normal distridutions

plot(density(stamp$Thickness),col="black",lwd=3)
for(i in 1:10){
  newThick <- rnorm(nobs,mean=stamp$Thickness,sd=dens$bw) # bw is bandwidth
  lines(density(newThick),col="grey",lwd=3)
}

# add a little variability if that seems too close to original values
plot(density(stamp$Thickness),col="black",lwd=3)
for(i in 1:10){
  newThick <- rnorm(nobs,mean=stamp$Thickness,sd=dens$bw*1.5)
  lines(density(newThick,bw=dens$bw),col="grey",lwd=3)
}

## Notes
# simulation can be applied to missing data problems - simulate what missing data might be
# simulation values are often drawn from standard distributions, but this may not be appropriate
# sensitivity analysis means trying different simulations with different assumptions and seeing how estimates change
