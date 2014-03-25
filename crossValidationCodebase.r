### Cross Vaildation

## Key ideas
# - sub-sampling the training data
# - avoiding overfitting
# - making predictions generalizable

# Overfitting
set.seed(12345)
x <- rnorm(10); y <- rnorm(10); z <- rbinom(10,size=1,prob=0.5)
plot(x,y,pch=19,col=(z+3))

# Classifier
par(mfrow=c(1,2))
zhat <- (-0.2 < y) & (y < 0.6)
plot(x,y,pch=19,col=(z+3)); plot(x,y,pch=19,col=(zhat+3))

# New data - if -0.2 <y < 0.6 call blue, otherwise green
set.seed(1233)
xnew <- rnorm(10); ynew <- rnorm(10); znew <- rbinom(10,size=1,prob=0.5)
par(mfrow=c(1,2)); zhatnew <- (-0.2 < ynew) & (ynew < 0.6)
plot(xnew,ynew,pch=19,col(z+3)); plot(xnew,ynew,pch=19,col=(zhatnew+3))

## Key idea
# - accuracy on the training set (resubstitution accuracy) is optimistic
# - a better estimate comes from an independent set (test set accuracy)
# - but we can't use the test set when building the model or it becomes part of the training set
# - so we estimate the test set accuracy with the training set

## Cross-validation
# Approach:
# 1. Use the training set
# 2. Split it into training/test sets
# 3. Build a model on the training set
# 4. Evaluate on the test set
# 5. Repeat and average the estimated errors

# Used for:
# 1. Picking variables to include in a model (feature selection)
# 2. Picking the type of prediction function to use
# 3. Picking the parameters in the prediction function
# 4. Comparing different predictors (estimate their errors on another set) ( more accurate estimate of out of sample population)

## Random subsampling
## K-fold
## Leave one out

y1 <- y[1:5]; x1 <- x[1:5]; z1 <- z[1:5]
y2 <- y[6:10]; x2 <- x[6:10]; z2 <- z[6:10];
zhat2 <- (y2 < 1) & (y2 > -0.5)
par(mfrow=c(1,3))
plot(x1,y1,col=(z1+3),pch=19); plot(x2,y2,col=(z2+3),pch=19); plot(x2,y2,col=(zhat2+3),pch=19)

## Notes
# the training and test sets must come from the same population
# sampling should be designed to mimic real patterns (e.g. sampling time chunks for time series)
# cross-validation estimates have variance - it is difficult to estimate how much
# cvTools
# boot