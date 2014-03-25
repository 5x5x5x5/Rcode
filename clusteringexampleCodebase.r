## Clustering example
# Samsung data

download.file("https://dl.dropbox.com/u/7710864/courseraPublic/samsungData.rda",
destfile="samsungData.rda",method="curl")
load("samsungData.rda")
names(samsungData)[1:12]

tables(samsumgData$activity)

# Plotting average acceleration for first subject

par(mfrow=c(1,2))
numericActivity <- as.numeric(as.factor(samsungData$activity))[samsungData$subject==1]
plot(samsungData[samsungData$subject==1,1],pch=19,col=numericActivity,ylab=names(samsungData)[1])
plot(samsungData[samsungData$subject==1,2],pch=19,col=numericActivity,ylab=names(samsungData)[2])
legend(150,-0.1,legend=unique(samsungData$activity),col=unique(numericActivity),pch=19)

# Clustering based just on average acceleration

source("http://dl.dropbox.com/u/7710864/courseraPublic/myplclust.R")
distanceMatrix <- dist(samsungData[samsungData$subject==1,1:3])
hclustering <- hclust(distanceMatrix)
myplclust(hclustering,lab.col=numericActivity)

# Plotting max acceleration for the first subject

par(mfrow=c(1,2))
plot(samsungData[samsungData$subject==1,10],pch=19,col=numericActivity,ylab=names(samsungData)[10])
plot(samsungData[samsungData$subject==1,11],pch=19,col=numericActivity,ylab=names(samsungData)[11])

# Clustering based on max acceleration

source("http://dl.dropbox.com/u/7710864/courseraPublic/myclust.R")
distanceMatrix <- dist(samsungData[samsungData$subject==1,10:12])
hclustering <- hclust(distanceMatrix)
myplclust(huclustering,lab.col=numericActivity)

# Singular Value Decomposition

svd1 = svd(scale(samsungData[samsungData$subject==1,-c(562,563)]))
par(mfrow=c(1,2))
plot(svd1$u[,1],col=numericActivity,pch=19)
plot(svd1$u[,2],col=numericActivity,pch=19)

# Find maximum contributor

plot(svd1$v[,2],pch=19)

# New clustering with maximum contributor

maxContrib <- which.max(svd1$v[,2])
distanceMatrix <- dist(samsungData[samsungData$subject==1,c(10:12,maxContrib)])
hclustering <- hclust(distanceMatrix)
myplclust(hclustering,lab.col=numericActivity)

# New clustering with maximum contributor

names(samsungData)[maxContrib]

# K-means clustering (nstart=1, first try)

kClust <- kmeans(smasungData[samsungData$subject==1,-c(562,563)],centers=6)
table(kClust$cluster,samsungData$activity[samsungData$subject==1])

# K-means clustering (nstart=1, second try)

kClust <- kmeans(samsungData[samsungData$subject==1,-c(562,563)],centers=6,nstart=1)
table(kClust$cluster,samsungData$activity[samsungData$subject==1])

# K-means clustering (nstart=100, first try)

kClust <- kmeans(smasungData[samsungData$subject==1,-c(562,563)],centers=6,nstart=100)
table(kClust$cluster,samsungData$activity[samsungData$subject==1])

# K-means clustering (nstart=100, second try)

kClust <- kmeans(samsungData[samsungData$subject==1,-c(562,563)],centers=6,nstart=100)
table(kClust$cluster,samsungData$activity[samsungData$subject==1])

# Cluster 1 variable centers (laying)

plot(kClust$center[1,1:10],pch=19,ylab="Cluster Center",xlab=" ")

# Cluster 2 variable centers (walking)

plot(kClust$center[6,1:10],pch=19,ylab="Cluster Center",xlab=" ")

