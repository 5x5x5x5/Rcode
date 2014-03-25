###### Data Munging
### Tidy data
## Each variable forms a column
## Each observation forms a row
## Each table/file stores data about one kind of observation
### Nice to have
## Column and Row names are easy and informative
## Obvious mistakes in the data have been removed
## Variable values are internally consistent
## Appropriate transformed variables have been added
## fix variable names, create new variables, merge datasets, reshape data sets, deal with missing data, transform variables, check on and remove inconsistent values
## Record these steps (in their own data munging R script)

## Fixing character vectors
cameraData <- read.csv("cameras.csv")
names(cameraData)

tolower(names(cameraData))

## strsplit() 
#parameter: x, split
splitNames = strsplit(names(cameraData),"\\.")
splitNames[[5]]
splitNames[[6]]

##sapply() applies a function to each element in a vector or list
#parameter: X, FUN
splitNmaes[[6]][1]

firstElement <- function(x){x[1]} #takes a character or numeric vector in a returns just the first element of that vector
sapply(splitNames,firstElement)   #applies that function to every element of that list

##load peer review datasets reviews.csv solutions.csv
names(reviews)
# too many underscores
sub("_","",names(reviews),)
#only replaces first instance
gsub("_","",names(reviews),)

#Quantitative variables in ranges -- cut()
reviews$time_left[1:10]

timeRanges <- cut(reviews$time_left,seq(0,3600,by=600))
timeRanges[1:10]

class(timeRanges)

table(timeRanges,useNA="ifany")

## cut2(){Hmisc}   break it up by quantiles
library(Hmisc)
timeRanges <- cut2(reviews$time_left,g=6)
table(timeRanges,useNA="ifAny")

## Adding an extra variable
timeRanges <- cut2(reviews$time_left,g=6)
reviews$timeRanges <- timeRanges
head(reviews,2)

## Merging datasets - merge()
#parameters: x,y,by.x,by.y,all

names(reviews)
names(solutions)

mergedData <- merge(reviews,solutions,all=TRUE)
head(mergedData)
#merged on id and duplicated records resulting in lotsa NAs
mergedData2 <- merge(reviews,solutions,by.x="solution_id",by.y="id",all=TRUE)
head(mergedData2[,1:6],3)

reviews[1,1:6]

## sort()
#parameters: x, decreasing

mergedData2$reviewer_id[1:10]

sort(mergedData2$reviewer_id)[1:10]

## order()
#parameter: list of variables to order, na.last, decreasing

order(mergedData2$reviewer_id)[1:10] # outputs how to reorder the original vector. An index
mergedData2$reviewer_id[order(mergedData2$reviewer_id)]

## Reordering a data frame
head(mergedData2[,1:6],3)

sortedData <- mergedData2[order(mergedData2$reviewer_id),]
head(sortedData[,1:6],3)

##Reordering by multiple variables
sortedData <- mergedData2[order(mergedData2$reviewer_id,mergedData2$id),]
head(sortedData[,1:6],3)

##Reshaping data - example from tidy data http://vita.had.co.nz/papers/tidy-data.pdf
## melt()
#parameter: id.vars, measure.vars, variable.name
load(reshape2)

misShaped <-as.data.frame(matrix(c(NA,5,1,4,2,3),byrow=TRUE,nrow=3))
names(misShaped) <- c("treatmentA","treatmentB")
misShaped$people <- c("John","Jane","Mary")
misShaped

melt(misShaped,id.vars="people",variable.name="treatment",value.name="value")

##Also see
#Tidy data and tidy tools
#Andrew Jaffe's Data Cleaning Lectures
#Hadley Wickham on regular expressions
#long, painful experience



