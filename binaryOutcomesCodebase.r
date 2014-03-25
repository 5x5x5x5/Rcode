### Binary Outcomes
## Key ideas
# - Frequently we care about outcomes that have two values (Alive/Dead, Win/Loss)
# - Binary outcomes   0/1
# - linear regression may not be the best

# Download ravens data
download.file("https://dl.dropbox.com/u/7710864/data/ravensData.rda", destfile="ravensData.rda",method="curl")
load("ravensData.rda")
head(ravensData)

## Linear regression
# RWi = b0 + b1RSi + ei
#RW = ravens win
#RSi = number of points Ravens scored
#b0 = probability of a Ravens win if they score 0 points
#b1 = increase in probability of a Ravens win for each additional point
#ei = variation due to everything we didn't measure

# Linear regression in R

lmRavens <- lm(ravensData$ravenWinNum ~ ravenData$ravenScore)
summary(lmRavens)

plot(ravensData$ravenScore,lmRavens$fitted,pch=19,col="blue",ylab="Prob Win",xlab="Raven Score")
# probability goes over 1

## Logistic regression in R
logRegRavens <- glm(ravensData$ravenWinNum ~ ravensData$ravenScore,family="binomial")
summary(logRegRavens)

plot(ravensData$ravenScore,logRegRavens$fitted,pch=19,col="blue",xlab="Score",ylab="Prob Ravens Win")

# Odds ratio and confidence intervals
exp(logRegRavens$coeff)

exp(confint(logRegRavens))

anova(logRegRavens,test="Chisq")
#Analysis of deviance rather than variance

## Relative risk and Odds ratio are similar but different
# Can't really do logistic regression on RR but it is commonly seen.