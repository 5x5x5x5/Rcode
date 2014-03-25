## ANOVA with multiple factors

## Movie data

download.file("http://rossmanchance.com/iscam2/data/movies03RT.txt",destfile="movies.txt")
movies <- read.table("movies.txt",sep="\t",header=T,quote="")
head(movies)

# ANOVA in R

aovObject <- aov(movies$score ~ movies$rating)
aovObject

aovObject$coeff

# Adding a second factor
# There are only two variables in this model. They have multiple levels

aovObject2 <- aov(movies$score ~ movies$rating + movies$genre)
aovObject2

summary(aovObject2)

## Order matters
aovObject3 <- aov(movies$score ~ movies$genre + movies$rating)
summary(aovObject3)

## Adding a quantitative variable
# There are three variables in this model - box office is quantitative so only has one term.

aovObject4 <- aov(movies$score ~ movies$genre + movies$rating + movies$box.office)
summary(aovObject4)

## Language 
# Units - one observation
# Treatments - applied to units
# Factors - controlled by experimenters
# Replicates - multiple (independent) units with the same factors/treatments
