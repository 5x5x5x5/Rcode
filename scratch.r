

glm2 <- glm(gaData$simplystats ~ julian(gaData$date),
	offset=log(visits+1),family="poisson";
