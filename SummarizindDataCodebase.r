####Summarizing data
##too big to look at the whole thing
##Problems
#Missing values
#Values outside expected ranges
#Values in wrong units
#mislabeled variables/columns
#Variables in the wrong class

fileUrl <- "http://earthquake.usgs.gov/earthquakes/catalogs/eqs7day-M1.txt"
download.file(fileUrl,destfile="./data/earthquakeData.csv",method="curl")
dateDownloaded <- date()
dateDownloaded

eData <- read.csv("./data/earthquakesData.csv")

## Looking at data dim(), names(), nrows(), ncol()

dim(eData)

names(eData)

nrow(eData)

quantile(eData$Magnitude, na.rm=TRUE)

summary(eData)

## class()

class(eData)
sapply(eData[1,],class)

## unique(), length(), table()

unique(eData$Src)
    # [1] nc ci ak mn 
	#Levels: nc ci ak mn

length(unique(eData$Src))

table(eData$Src)
    ## ak   ci   hv   mb
	##330  145   29   10

table(eData$SRC,eData$Version)

## any()    all()

eData$Lat[1:40]
eData$Lat[1:10] > 40
any(eData$Lat[1:10] > 40

all(eData$Lat[1:10] > 40

## Subsetting with &

eData[eData$Lat > 0 & eData$Lon > 0,c("Lat","Lon")]

eData[eData$Lat | 0 & eData$Lon > 0,c("Lat","Lon")]

## Peer review data

fileUrl1 <- "https://dl.dropbox.com/u/7710864/data/reviews-apr29.csv"
fileUrl2 <- "https://dl.dropbox.com/u/7710864/data/solutions-apr29.csv"
download.file(fileUrl1,destfile="reviews.csv")
download.file(fileUrl2,destfile="solutions.csv")
reviews <- read.csv("reviews.csv"); solutions <- read.csv("solutions.csv")
head(reviews,2)
head(solutions,2)

is.na(reviews$time_left[1:10])

sum(is.na(reviews$time_left))

table(is.na(reviews$time_left))

## important table()/NA issue
table(c(0,1,2,3,NA,3,3,2,2,3),useNA="ifany")

## Summarizing columns/rows - rowSums() rowMeans() colSums() colMeans()
 na.rm=TRUE
 


