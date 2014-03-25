### Smoothing

## Key ideas
# sometimes there are nonlinear trends in data
# we can use "smoothing" to try to capture these
# still a risk of overfitting
# often hard to interpret

download.file("http://www.cbcb.umd.edu/~hcorrada/PracticalML/Data/cd4.data", destfile="./cd4.data",method="curl")
cd4Data <- read.table("./cd4.data",
                       col.names=c("time", "cd4", "age", "packs", "drugs", "sex", "cesd", "id"))
cd4Data <- cd4Data[order(cd4Data$time),]
head(cd4Data)

# CD4 over time
plot(cd4Data$time,cd4Data$cd4,pch=19,cev=0.1)

# Average first two points
plot(cd4Data$time,cd4Data$cd4,pch=19,cex=0.1)
points(mean(cd4Data$time[1:2]),mean(cd4Data$cd4[1:2]),col="blue",pch=19)

points(mean(cd4Data$time[2:3]),mean(cd4Data$cd4[2:3]),col="blue",pch=19)

## A moving average
plot(cd4Data$time,cd4Data$cd4,pch=19,cex=0.1)
aveTime <- aveCd4 <- rep(NA,length(3:(dim(cd4Data)[1]-2)))
for(i in 3:(dim(cd4Data)[1]-2)){
    aveTime[i] <- mean(cd4Data$time[(i-2):(i+2)])
	aveCd4[i] <- mean(cd4Data$cd4[(i-2):(i+2)])
}
lines(aveTime,aveCd4,col="blue",lwd=3)

## average more points!
plot(cd4Data$time,cd4Data$cd4,pch=19,cex=0.1)
aveTime <- aveCd4 <- rep(NA,length(11:(dim(cd4Data)[1]-10)))
for(i in 11:(dim(cd4Data)[1]-2)){
    aveTime[i] <- mean(cd4Data$time[(i-10):(i+10)])
	aveCd4[i] <- mean(cd4Data$cd4[(i-10):(i+10)])
}
lines(aveTime,aveCd4,col="blue",lwd=3)

##Average all of the points!!
aveTime <- aveCd4 <- rep(NA,length(201:(dim(cd4Data)[1]-200)))
for(i in 201:(dim(cd4Data)[1]-2)){
    aveTime[i] <- mean(cd4Data$time[(i-200):(i+200)])
	aveCd4[i] <- mean(cd4Data$cd4[(i-200):(i+200)])
}
lines(aveTime,aveCd4,col="blue",lwd=3)

## A faster way     as.vector
filtTime <- as.vector(filter(cd4Data$time,filter=rep(1,200))/200)
filtCd4 <- as.vector(filter(cd4Data$cd4,filter=rep(1,200))/200)
plot(cd4Data$time,cd4Data$cd4,pch=19,cex=0.5); lines(filtTime,filtCd4,col="blue",lwd=3)

## Averaging = weighted sums
filtCd4more <- as.vector(filter(cd4Data$cd4,filter=rep(1,4))/4)
filtCd4more[2]

sum(cd4Data$cd4[1:4] * rep(1/4,4))

## other weights -> should sum to one
ws = 10; tukey = function(x) pmax(1 - x^2,0)^2
filt = tukey(seq(-ws,ws)/(ws+1));filt=filt/sum(filt)
plot(seq(-(ws),(ws)),filt,pch=19)

## Applying those weights to weighted sums

ws = 100; tukey = function(x) pmax(1 - x^2,0)^2
filt= tukey(seq(-ws,ws)/(ws+1));filt=filt/sum(filt)
filtTime <- as.vector(filter(cd4Data$time,filter=filt))
filtCd4 <- as.vector(filter(cd4Data$cd4,filter=filt))
plot(cd4Data$time,cd4Data$cd4,pch=19,cex=0.1); lines(filtTime,filtCd4,col="blue",lwd=3)

### Lowess (loess)
# Locally weighted scatterplot smoothing
lw1 <- loess(cd4 ~ time,data=cd4Data)
plot(cd4Data$time,cd4Data$cd4,pch=19,cex=0.1)
lines(cd4Data$time,lw1$fitted,col="blue",lwd=3)

## Span
plot(cd4Data$time,cd4Data$cd4,pch=19,cex=0.1,ylim=c(500,1500))
lines(cd4Data$time,loess(cd4 ~ time,data=cd4Data,span=0.1)$fitted,col="blue",lwd=3)
lines(cd4Data$time,loess(cd4 ~ time,data=cd4Data,span=0.25)$fitted,col="red",lwd=3)
lines(cd4Data$time,loess(cd4 ~ time,data=cd4Data,span=0.76)$fitted,col="yellow",lwd=3)

## Predicting with loess

tme <- seq(-2,5,length=100); pred1 = predict(lw1,newdata=data.frame(time=tme),se=TRUE)
plot(tme,pred1$fit,col="blue",lwd=3,type="l",ylim=c(0,2500))
lines(tme,pred1$fit + 1.96*pred1$se.fit,col="red",lwd=3)
lines(tme,pred1$fit - 1.96*pred1$se.fit,col="red",lwd=3)
points(cd4Data$time,cd4Data$cd4,pch=19,cex=0.1)

### Splines   Yi = b0 SUM bk*sk(xi) + ei
#Yi = outcome for the ith observation
#b0 = intercept term
#bk = coefficient for the kth spline function
#sk = kth spline function
#xi = covariate for ith observation
#ei = everything we didn't measure/model

library(splines)
nsl <- ns(cd4Data$time,df=3)
par(mfrow=c(1,3))
plot(cd4Data$time,nsl[,1]); plot(cd4Data$time,nsl[,2]); plot(cd4Data$time,nsl[,3])

## Regression with spline

lm1 <- lm(cd4Data$cd4 ~ nsl)
summary(lm1)

## Fitted values

plot(cd4Data$time,cd4Data$cd4,pch=19,cex=0.1)
points(cd4Data$time,lm1$fitted,col="blue",pch=19,cex=0.5)

## Notes and further resources
# Cross-validation with splines/smoothing is a good idea
# Do not predict outside the range of observed data