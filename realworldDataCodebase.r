## Real data

## Things to pay attention to
# - Confounders
# - Complicated interactions
# - Skewness
# - Outliers
# - Non-linear patterns
# - Variance changes
# - Unit/sclae issues
# - Overloading regression
# - Correlation and causation

## Confounders
# can change the regression line
# can change the sign of the line
# can sometimes be detected by careful exploration

# WHO data
par(mfrow=c(1,2))
plot(hunger$Year,hunger$Numeric,col=as.numeric(hunger$WHO.region),pch=19)
plot(1:10,type="n",xaxt="n",yaxt="n",xlab="",ylab="")
legend(1,10,col=unique(as.numeric(hunger$WHO.region)),legend=unique(hunger$WHO.region),pch=19)

# Region correlated with year
anova(lm(hunger$Year ~ hunger$WHO.region))

# Region correlated with hunger
anova(lm(hunger$Numeric ~ hunger$WHO.region))

# Including region - a comlicated interaction
plot(hunger$Year,hunger$Numeric,pch=19,col=as.numeric(hunger$WHO.region))
lmRegion <- lm(hunger$Numeric ~ hunger$Year + hunger$WHO.region + hunger$Year*hunger$WHO.region)
abline(c(lmRegion$coeff[1] + lmRegion$coeff[6],lmRegion$coeff[2] + lmRegion$coeff[12]),col=5,lwd=3)
##not quite working

## Logs to address right-skewness

download.file("http://archive.ics.uci.edu/ml/machine-learning-databases/adult/adult.data","income.csv")
incomeData <- read.csv("income.csv",header=FALSE)
income <- incomeData[,3]
age <- incomeData[,1]

par(mfrow=c(1,4))
smoothScatter(age,income)
hist(income,col="blue",breaks=100)
hist(log(income+1),col="blue",breaks=100)
smoothScatter(age,log(income+1))

## Variance changes

bupaData <- read.csv("ftp://ftp.ics.uci.edu/pub/machine-learning-databases/liver-disorders/bupa.dat")
ggt <- bupaDat[,5]; aat <- bupData[,3]
plot(log(ggt),aat,col="blue",pch=19)

#Plot the residuals
lm1 <- lm(aat ~ log(ggt))
plot(log(ggt),lm1$residuals,col="blue",pch=19)
# Long literature on changing variance - heteroskedasticity
#Power (aka Box-Cox) transform
#Variance stabilizing transform
#Weighted least squares
#Huber-white standard errors


## Variation in units
# Standardize but keep track
# - affects model fit
# - affects interpretation
# - affects inference


