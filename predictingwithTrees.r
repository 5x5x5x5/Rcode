### Predicting with trees!

## Key ideas
# Iteratively split variables into groups
# Split where maximally predictive
# Evaluate "homogeneity" within each branch
# Fitting multiple trees often works better (forests)

# Pros
# - easy to implement
# - easy to interpret
# - better performance
# Cons
# - without pruning/cross-validation can lead to overfitting
# - harder to estimate uncertainty
# - results may be variable

## basic algortihm
# 1. Start with all variables in one group
# 2. Find the variable/split that best separates the outcomes
# 3. Divide the data into two groups ("leaves") on that split ("node")
# 4. Within each split, find the best variable/split that separates the outcomes
# 5. Continue until the groups are too small or sufficiently "pure"

## Measures of impurity
# Misclassification error
# Gini index
# Cross-entropy or deviance

## Example: Iris data
data(iris)
names(iris)

table(iris$Species)

# Iris petal widths/sepal width
plot(iris$Petal.Width,iris$Sepal.With,pch=19,col=as.numeric(iris$Species))
legend(1,4.5,legend=unique(iris$Species),col=unique(as.numeric(iris$Species)),pch=19)

# An alternative is library(npart)
library(npart)
tree1 <- tree(Species ~ Sepal.Width + Petal.Width,data=iris)
summary(tree1)

plot(tree1)
text(tree1)

## Another way of looking at a CART model

plot(iris$Petal.Width,iris$Sepal.Width,pch=19,col=as.numeric(iris$Species))
partition.tree(tree1,label="Species",add=TRUE)
legend(1.75,4.5,legend=unique(iris$Species),col=unique(as.numeric(iris$Species)),pch=19)

## Predicting new values
set.seed(32313)
newdata <- data.frame(Petal.Width = runif(20,0,2.5),Sepal.Width = runif(20,2,4.5))
pred1 <- predict(tree1,newdata)
pred1

pred1 < predict(tree1,newdata,type="class")
plot(newdata$Petal.Width,newdata$Sepal.Width,col=as.numeric(pred1),pch=19)
partition.tree(tree1,"Species",add=TRUE)

### Pruning trees example: Cars
data(Cars93,package="MASS")
head(Cars93)

treeCars <- tree(DriveTrain ~ MPG.city + MPG.highway +AirBags + EngineSize
              Width + Length + Weight + Price + Cylinders + Horsepower +
			  Wheelbase,data=Cars93)
plot(treeCars)
text(treeCars)

# Plot errors
par(mfrow=c(1,2))
plot(cv.tree(treeCars,FUN=prune.tree,method="misclass"))
plot(cv.tree(treeCars))

#Prune the tree
pruneTree <- prune.tree(treeCars,best=4)
plot(pruneTree)
text(pruneTree)

# Show resubstitution error  *note that cross-validation error is a better measure of test set accuracy

table(Cars93$DriveTrain,predict(pruneTree,type="class"))

table(Cars93$DriveTrain,predict(treeCars,type="class"))
