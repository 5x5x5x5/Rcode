###Prediction study design

##Steps in building a prediction
# 1. Find the right data
# 2. Define your error rate
# 3. Split your data into:
# - Training
# - Testing
# - Validation (optional)
# 4. On training set pick features
# 5. On training set pick prediction function
# 6. On training set cross-validate
# 7. If no validation - apply 1x to test set
# 8. If validation - apply to test set and refine
# 9. If validation - apply 1x to validation

## Benchmark for classification
# probability of perfect classification is (1/2)^test set sample size

#True positive
#False positive (Type 1 error)
#True negative
#False negative (Type 2 error)

#Sensitivity (recall)
#Specificity
#Positive predictive value
#Negative predicitive value

#Mean squared error - continuous data, sensitive to outliers
#Median absolute deviation - continuous data, often more robust
#Sensitivity (recall) - if you want few missed positives
#Specificity - if you want few negatives called positives
#Accuracy - weights false positives/negatives equally
#Concordance - one example is kappa

## Key issues
# 1. Accuracy
# 2. Overfitting
# 3. Interpretability
# 4. Computational speed

