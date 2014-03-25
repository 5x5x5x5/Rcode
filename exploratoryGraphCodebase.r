######Exploratory Graph stuff
#### We use graphs to
## understand data properties
## find patterns in data
## suggest modeling strategies
## "debug" analyses
## communicate results

## Housing data from US census
pData <- read.csv("./data/ss06pid.csv")

## boxplot()
#parameter: col,varwidth,names,horizontal

boxplot(pData$AGEP,col="blue")

boxplot(pData$AGEP ~ as.factor(pData$DDRS),col="blue")

boxplot(pData$AGEP ~ as.factor(pData$DDRS),col=c("blue","orange"),names=c("yes","no"),varwidth=TRUE

##
barplot(table(pData$CIT),col="blue")

## hist()
#parameter: breaks,freq,,col,xlab,ylab,xlim,_ylim,main

hist(pData$AGEP,col="blue")

hist(pData$AGEP,col="blue",breaks=100,main="Age")

##Density plots     density()
#parameter: col,lwd,xlab,ylab,xlim,ylim

dens <- density(pData$AGEP)
plot(dens,lwd=3,col"blue")

dens <- density(pData$AGEP)
densMales <- density(pData$AGEP[which(pData$SEX==1)])
plot(dens,lwd=3,col="blue")
lines(densMales,lwd=3,col="orange")

## Scatterplot
#parameter: x,y,type,xlab,ylab,xlim,ylim,cex,col,bg

plot(pData$JWMNP,pData$WAGP,pch=19,col="blue")
#size matters
plot(pData$JWMNP,pData$WAGP,pch=19,col="blue",cex=0.5)
#using color
plot(pData$JWMNP,pData$WAGP,pch=19,col=pDATA$SEX,cex=0.5)
#using size
percentMaxAge <- pData$AGEP/max(pData$AGEP)
plot(pData$JWMNP,pData$WAGP,pch=19,col="blue",cex=percentMaxAge*0.5)
#overlaying lines/points
plot(pData$JWMNP,pData$WAGP,pch=19,col="blue",cex=0.5)
lines(rep(100,dim(pData)[1]),pData$WAGP,col="grey",lwd=5)
points(seq(0,200,length=100),seq(0,20e5,length=100),col="red",pch=19)
##numeric variables as factors
library(Hmisc)
ageGroups <- cut2(pData$AGEP,g=5)
plot(pData$JWMNP,pData$WAGP,pch=19,col=ageGroups,cex=0.5)

##If you have alot of points
x <- rnorm(1e5)
y <- rnorm(1e5)
plot(x,y,pch=19)
#sampling
sampledValues <- sample(1:1e5,size=1000,replace=FALSE)
plot(x[sampledValues],y[sampledValues],pch=19)
#smooth scatter
smoothscatter(x,y)
#hexbin{hexbin}
library(hexbin)
hbo <- hexbin(x,y)
plot(hbo)

## QQ-plots    qqplot()
qqplot(x,y)
abline(c(0,1))

##Matplot and spaghetti
#matplot()   parameters: x,y,Ity,lwd,pch,col

X <- matrix(rnorm(20*5),nrow=20)
matplot(X,type="b")

## Heatmaps
#parameters: x,y,z,col

image(1:10,161:236,as.matrix(pData[1:10,161:236]))
#matching intuition
newMatrix <- as.matrix(pData[1:10,161:236])
newMatrix <- t(newMatrix)[,nrow(newMatrix):1]
image(161:236, 1:10, newMatrix)

##maps - very basic
library(maps)
map("world")
lat <- runif(40,-180,180); lon <- runif(40,-90,90)
points(lat,lon,col="blue",pch=19)

## Missing values and plots

x <- c(NA,NA,NA,4,5,6,7,8,9,10)
y <- 1:10
plot(x,y,pch=19,xlim=c(0,11),ylim=c(0,11))

#
x <- rnorm(100)
y <- rnorm(100)
y[x < 0] <- NA
boxplot(x ~ is.na(y))

 