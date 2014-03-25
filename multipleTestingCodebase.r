### Multiple Testing
## Key ideas
# Hypothesis testing/significance analysis is commonly overused
# Correcting for multiple testing avoids false positives or discoveries
# Two key components
# - Error measure
# - Correction

## Controlling family-wise error rate (FWER)
# Bonferromi correction is oldest
# - Suppose you do m tests
# - You want to comtrol FWER at level alpha so Pr(V > 1) < alpha
# - Calculate P-values normally
# - Set alphafwer = alpha/m
# - Call all P-values less than alphafwer significant
# Pros
# easy to calculate, conservative
# Cons
# may be too conservative

## Controlling false dicovery rate (FDR)
# This is the most popular correction when performing lots of tests 
#say in genomics, imaging, astronomy or other signal-processing disciplines.
# - Suppose you do m tests
# - You want to control FDR at a level alpha so E(V/R)
# - Calculate P-values normally
# - Order the P-values from smallest to largest P1...Pm
# - Call any Pi < alpha * i/m significant
# Pros: still pretty easy to calculate, less conservative (maybe much less)
# Cons: allows for more false positives, may behave strangely under dependence

## Adjusted p-values
# - one approach is to adjust the threshold alpha
# - a different approac is to calculate "adjusted p-values"
# - they are not p-values any more!
# - but they can be used directly without adjusting alpha

## Case study 1: no tru positives
set.seed(1010093)
pValues <- rep(NA,1000)
for(i in 1:1000){
  y <- rnorm(20)
  x <- rnorm(20)
  pValues[i] <- summary(lm(y ~ x))$coeff[2,4]
}
# Controls false positive rate
sum(pValues < 0.05)

# Controls FWER
sum(p.adjust(pValues,method="bonferroni") < 0.05)

# Controls FDR
sum(p.adjust(pValues,method="BH") < 0.05)

## Case study 2: 50% true positives
set.seed(1010093)
pValues <- rep(NA,1000)
for(i in 1:1000){
  x <- rnorm(20)
  # First 500 beta=0, last 500 beta=2
  if(i <= 500){y <- rnorm(20)}else{ y <- rnorm(20,mean=2*x)}
  pValues[i] <- summary(lm(y ~ x))$coeff[2,4]
}
trueStatus <- rep(c("zero","not zero"),each=500)
table(pValues < 0.05, trueStatus)

# Controls FWER
table(p.adjust(pValues,method="bonferroni") < 0.05,trueStatus)

# Controls FDR
table(p.adjust(pValues,method="BH") < 0.05,trueStatus)

# p-values versus adjusted p-values
par(mfrow=c(1,2))
plot(pValues,p.adjust(pValues,method="bonferroni"),pch=19)
plot(pValues,p.adjust(pValues,method="BH"),pch=19)

## Notes
# Multiple testing is an entire subfield
# A basic bonferroni/BH correction is usually enough
# If there is a strong dependence between tests there may be problems
# - consider method="BY"
