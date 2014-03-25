## Regression with factor variables

# Key ideas
# - Outcome is still quantitative
# - Covariate(s) are factor variables
# - Fitting lines = fitting means
# - want to evaluate contribution of all factor levels at once


## Movie data

download.file("http://rossmanchance.com/iscam2/data/movies03RT.txt",destfile="movies.txt")
movies <- read.table("movies.txt",sep="\t",header=T,quote="")
head(movies)

# rotten tomatoes score vs. ratings

plot(movies$score ~ jitter(as.numeric(movies$rating)),col="blue",xaxt="n",pch=19)
axis(side=1,at=unique(as.numeric(movies$rating)),labels=unique(movies$rating))

# Average score by rating

plot (movies$score ~ jitter(as.numeric(movies$rating)),col="blue",xaxt="n",pch=19)
axis(side=1,at=unique(as.numeric(movies$rating)),labels=unique(movies$rating))
meanRatings <- tapply(movies$score,movies$rating,mean)
points(1:4,meanRatings,col="red",pch="-",cex=5)

## Assign a logical value that is one if movie rating matches and zero otherwise

lm1 <- lm(movies$score ~ as.factor(movies$rating))
summary(lm1)

plot (movies$score ~ jitter(as.numeric(movies$rating)),col="blue",xaxt="n",pch=19)
axis(side=1,at=unique(as.numeric(movies$rating)),labels=unique(movies$rating))
points(1:4,lm1$coeff[1] + c(0,lm1$coeff[2:4]),col="red",pch="-",cex=5)

# Question 1 - what is the avergae difference in rating between G and R movies
# b3

lm1 <- lm(movies$score ~ as.factor(movies$rating))
summary(lm1)

confint(lm1)

# What is the average difference between PG-13 and R movies?
# b2-b3
# or rewrite the model to make it b3

lm2 <- lm(movies$score ~ relevel(movies$rating,ref="R"))
summary(lm2)

confint(lm2)

## Question 3 - Is there any difference in score between any of the movie ratings?

lm1 <- lm(movies$score ~ as.factor(movies$rating))
anova(lm1)

# Sum of squares

gMovies <- movies[movies$rating=="G",]; xVals <- seq(0.2,0.8,length=4)
plot(xVals,gMovies$score,ylab="score",xaxt="n",xlim=c(0,1),pch=19)
abline(h=mean(gMovies$score),col="blue",lwd=3); abline(h=mean(movies$score),col="red",lwd=3)
segments(xVals+0.01,rep(mean(gMovies$score),length(xVals)),xVals+0.01,
    rep(mean(movies$score),length(xVals)),col="red",lwd=2)
segments(xVals-0.01,gMovies$score,xVals-0.01,rep(mean(gMovies$score),length(xVals)),col="blue",lwd=3)

# Tukey's (honestly significant different test)

lm1 <- aov(movies$score ~ as.factor(movies$rating))
TukeyHSD(lm1)