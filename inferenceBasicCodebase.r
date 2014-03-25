## Inference Basics

# Fit a line to the Galton data

library(UsingR); data(galton);
plot(galton$parent,galton$child,pch=19,col="blue")
lm1 <- lm(galton$child ~ galton$parent)
lines(galton$parent,lm1$fitted,col="red",lwd=3)

# Fit a line to the Galton data

lm1

# Create a "population" of 1 million families

newGalton <- data.frame(parent=rep(NA,1e6),child=rep(NA,1e6))
newGalton$parent <- rnorm(1e6,mean=mean(galton$parent),sd=sd(galton$parent))
newGalton$child <- lm1$coeff[1] + lm1$coeff[2]*newGalton$parent + rnorm(1e6,sd=sd(lm1$residuals))
smoothScatter(newGalton$parent,newGalton$child)
abline(lm1,col="red",lwd=3)

# Take a sample

set.seed(12345); sampleGalton1 <- newGalton[sample(1:1e6,size=50,replace=F),]
sampleLm1 <- lm(sampleGalton1$child ~ sampleGalton1$parent)
plot(sampleGalton1$parent,sampleGalton1$child,pch=19,col="blue")
lines(sampleGalton1$parent,sampleLm1$fitted,lwd=3,lty=2)
abline(lm1,col="red",lwd=3)

# Another sample

sampleGalton2 <- newGalton[sample(1:1e6,size=50,replace=F),]
sampleLm2 <- lm(sampleGalton2$child ~ sampleGalton2$parent)
plot(sampleGalton2$parent,sampleGalton2$child,pch=19,col="blue")
lines(sampleGalton2$parent,sampleLm2$fitted,lwd=3,lty=2)
abline(lm1,col="red",lwd=3)

# Many samples

sampleLm <- vector(100,mode="list")
for(i in 1:100){
  sampleGalton <- newGalton[sample(1:1e6,size=50,replace=F),]
  sampleLm[[i]] <- lm(sampleGalton$child ~ sampleGalton$parent)
}
  
smoothScatter(newGalton$parent,newGalton$child)
for(i in 1:100){abline(sampleLm[[i]],lwd=3,lty=2)}
abline(lm1,col="red",lwd=3)

# Histogram of estimates

par(mfrow=c(1,2))
hist(sapply(sampleLm,function(x){coef(x)[1]}),col="blue",xlab="intercept",main="")
hist(sapply(sampleLm,function(x){coef(x)[2]}),col="blue",xlab="slope",main="")

## Brief divergence into the Central Limit Theorem

# Estimating values in R

sampleGalton4 <- newGalton[sample(1:1e6,size=50,replace=F),]
sampleLm4 <- lm(sampleGalton4$child ~ sampleGalton4$parent)
summary(sampleLm4)

# Estimating the values in R

hist(sapply(sampleLm,function(x){coef(x)[2]}),col="blue",xlab="Slope",main="",freq=F)
lines(seq(0,5,length=100),dnorm(seq(0,5,length=100),mean=coef(sampleLm4)[2],
  sd=summary(sampleLm4)$coeff[2,2]),lwd=3,col="red")
  
## Talking about standardizing

x <- seq(-5,5,length=100)
plot(x,dnorm(x),type="1",lwd=3)
lines(x,dt(x,df=3),lwd=3,col="red")
lines(x,dt(x,df=10),lwd=3,col="blue")

# Confidence intervals

summary(sampleLm4)$coeff

confint(sampleLm4,level=0.95)

par(mar=c(4,4,0,2));plot(1:10,type="n",xlim=c(0,1.5),ylim=c(0,100),
   xlab="Coefficient Values",ylab="Republican")
for(i in 1:100){
  ci <- confint(sampleLm[[i]]); color="red";
  if((ci[2,1] < lm1$coeff[2]) & (lm1$coeff[2] < ci[2,2])){color = "grey"}
  segments(ci[2,1],i,ci[2,2],i,col=color,lwd=3)
}
lines(rep(lm1$coeff[2],100),seq(0,100,length=100),lwd=3)

# How do you report the inference

sampleLm4$coeff

confint(sampleLm4,level=0.95)

# A one inch increase in parental height is associated with a 0.77 inch increase 
# in child's height (95% CI: 0.42 - 1.12 inches).

