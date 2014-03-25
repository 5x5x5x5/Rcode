## Count outcomes

# Many data take the form of a count 
# - calls to a call center
# - number of flu cases
# - number of cars that cross a bridge
# Data may also take the form of rates
# - Percent of children passing a test
# - Percent of hits to a website from a country
# Linear regression with transformation is an option

## Poisson distribution

set.seed(3433); par(mfrow=c(1,2))
poisData2 <- rpois(100,lambda=100); poisData1 <- rpois(100,lambda=50)
hist(poisData1,col="blue",xlim=c(0,150)); hist(poisData2,col="blue",xlim=c(0,150))

c(mean(poisData1),var(poisData1))

c(mean(poisData2),var(poisData2))

# Website traffic data
download.file("https://dl.dropbox.com/u/7710864/data/gaData.rda",destfile="./gaData.rda")
load("./gaData.rda")
gaData$julian <- julian(gaData$date)
head(gaData)

plot(gaData$julian,gaData$visits,pch=19,col="darkgrey",xlab="Julian",ylab="Visits")

## Linear regression
# NHi = b0 + b1*JDi + ei
# NHi = number of hits to the website
# b0 = number of hits on julian day 0 (1970-01-01)
# b1 = increase in number of hits per unti day
# JDi = day of the julian year
# ei = variation dur to everything we didn't measure

plot(gaData$julian,gaData$visits,pch=19,col="darkgrey",xlab="Julian",ylab="Visits")
lm1 <- lm(gaData$visits ~ gaData$julian)
abline(lm1,col="red",lwd=3)

## a bit more realistic to use poisson ( or log-linear model)
# expected number of hits is e to the expected values
# multiplicative version of a linear model

plot(gaData$julian,gaData$visits,pch=19,col="darkgrey",xlab="Julian",ylab"Visits")
glm1 <- glm(gaData$visits ~ gaData$julian,family="poisson")
abline(lm1,col="red",lwd=3); lines(gaData$julian,glm1$fitted,col="blue",lwd=3)

# mean - variance relationship

plot(glm$fitted,glm$residuals,pch=19,col="grey",ylab="Residuals",xlab="Fitted")

# some craziness about Model agnostic standard errors - a little more conservative

## Rates

# Fitting rates in R

glm2 <-glm(gaData$simplystats ~ julian(gaData$date),offset=log(visit+1),
    family="poisson",data,=gaData)
plot(julian(gaData$date),glm2$fitted,col="blue",pch=19,xlab="Date",ylab="Fitted Counts")
points(julian(gaData$data),glm1$fitted,col="red",pch=19)

glm2 <- glm(gaData$simplystats ~ julian(gaData$date),offset=log(visits+1),
    family="poisson",data=gaData)
plot(julian(gaData$date),gaData$simplystats/(gaData$visits+1),col="grey",xlab="Date",
    ylab="Fitted Rates",pch=19)
lines(julian(gaData$date),glm2$fitted/(gaData$visits+1),col="blue",lwd=3)



