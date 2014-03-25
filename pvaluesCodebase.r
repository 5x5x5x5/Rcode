## P-values

# Suppose nothing is going on - how unusual is the estimate we got?
# 1 - Define the hypotheitcal distribution of a data summary (statistic) when "nothing is going on"
# (null hypothesis)
# 2 - Calculate the summary/statistic with the data we have (test statistic)
# 3 - Compare what we calculated to our hypothetical distribution and see if the value is extreme (p-value)

library(UsingR); data(galton)
plot(galton$parent,galton$child,pch=19,col="blue")
lm1 <- lm(galton$child ~ galton$parent)
abline(lm1,col="red",lwd=3)

# The null distribution

x <- seq(-20,20,length=100)
plot(x,dt(x,df=(928-2)),col="blue",lwd=3,type="l")

# Null distribution + observed statistic

x <- seq(-20,20,length=100)
plot(x,dt(x,df=(928-2)),col="blue",lwd=3,type="l")
arrows(summary(lm1)$coeff[2,3],0.25,summary(lm1)$coeff[2,3],0,col="red",lwd=4)

# Calculating p-values

summary(lm1)

# A quick simulated example

set.seed(9898324)
yValues <- rnorm(10); xValues <- rnorm(10)
lm2 <- lm(yValues ~ xValues)
summary(lm2)

x <- seq(-5,5,length=100)
plot(x,dt(x,df=(10-2)),col="blue",lwd=3,type="l")
arrows(summary(lm2)$coeff[2,3],0.25,summary(lm2)$coeff[2,3],0,col="red",lwd=4)

xCoords <- seq(-5,5,length=100)
plot(xCoords,dt(xCoords,df=(10-2)),col="blue",lwd=3,type="l")
xSequence <- c(seq(summary(lm2)$coeff[2,3],5,length=10),summary(lm2)$coeff[2,3])
ySequence <- c(dt(seq(summary(lm2)$coeff[2,3],5,length=10),df=8),0)
polygon(xSequence,ySequence,col="red"); polygon(-xSequence,ySequence,col="red")

# Simulate a ton of data sets with no signal

set.seed(8323); pValues <- rep(NA,100)
for(i in 1:100){
  xValues <- rnorm(20); yValues <- rnorm(20)
  pValues[i] <- summary(lm(yValues ~ xValues))$coeff[2,4]
}
hist(pValues,col="blue",main="",freq=F)
abline(h=1,col="red",lwd=3)

# Simulate a ton of datasets with signal

set.seed(8323); pValues <- rep(NA,100)
for(i in 1:100){
  xValues <- rnorm(20); yValues <- 0.2 * xValues + rnorm(20)
  pValues[i] <- summary(lm(yValues ~ xValues))$coeff[2,4]
}
hist(pValues,col="blue",main="",freq=F,xlim=c(0,1)); abline(h=1,col="red",lwd=3)

## In modern analyses, people generally report both the confidence interval and P-value. This 
# is less tru if many many hypotheses are tested

summary(lm(galton$child ~ galton$parent))$coeff

# A one inch increase in parental height is associated with a 0.77 inch increase in 
# child's height (95% CI: 0.42-1.12 inches). This difference was statistically 
# significant (P < 0.001).

