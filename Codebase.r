## Downloading file from the web

fileURL <- "https://data.baltimorecity.gov/api/views/dz54-2aru/rows.csv?accessType=DOWNLOAD"
download.file(fileUrl,destfile="./data/cameras.csv",method="curl") ## method=curl only needed for Mac https request
list files("./data")

## Outputs the files at that location

dateDownloaded <- date()
dateDownloaded

## output example "Sun Jan 27 12:21:15 2013"

###########################
## read.table()
#This is the main function for getting data into R
#Flexible and robust but requires more parameters
#Important parameters: file, header, sep, row.names, nrows
#Only as big as memory
#related to read.csv(), read.csv2()

getwd()
cameraData <- read.table("./data/cameras.csv",sep=",",header=TRUE)
head(cameraData)

## read.csv() sets sep="," and header=TRUE

cameraData <- read.csv("./data/cameras.csv")
head(cameraData)

#read Excel files by loading read.xlsx() or read.xlsx2() package
#read in using read.xlsx() then write them as .csv files or something faster

library(xlsx)
fileUrl <- "https://data.baltimorecity.gov/api/views/dz54-2aru/rows.xlsx?accessType=DOWNLOAD"
download.file(fileUrl,destfile="./data/camera.xlsx",method="curl")
cameraData <- read.xlsx2("./data/camera.xlsx",sheetIndex=1) ##spreadsheets got sheets!
head(cameraData)

#############################
##Interacting more directly with files
#file - open a connection to a text file
#url - open a connection to a url
#gzfile - open a connection to a .gz file
#bzfile - open a connection to a bz2 file
# ?connections for more information
##Remember to close files

##read.lines() 
#parameters con, n, encoding

con <- file("./data/cameras.csv","r")
cameraData <- read.csv(con)
close(con)
head(cameraData)

##
con <- url("http://simplystatistics.org","r")
simplyStats <- readLines(con, 20)
close(con)
head(simplyStats)

## JSON
library(RJSONIO)
fileUrl <- "https://data.baltimorecity.gov/api/views/dz54-2aru/rows.json?accessType=DOWNLOAD"
download.file(file(fileUrl,destfile="./data/camera.json",method="curl")
con = file("./data/camera.json")
jsonCamera = fromJSON(con)
close(con)
head(jsonCamera)

############# Writing data
## write.table()   opposite of read.table()
#parameters: x, file, quote, sep, row.names, col.names

cameraData <- read.csv("./data/cameras.csv")
tmpData <- cameraData[,-1]  ## removes a column from dataframe
write.table(tmpData,file="./data/camerasModified.csv",sep=",")
cameraData2 <- read.csv("./data/camerasModified.csv")
head(cameraData2)

## save(), save.image()
#parameters: list of objects, file
#save.image() saves everything in your workspace into one binary

cameraData <- read.csv("./data/cameras.csv")
tmpData <- cameraData[,-1]
save(tmpData,cameraData,file="./data/cameras.rda")

## load()   opposite of save()
#parameter: file

#remove everything from workspace
rm(list=ls()) 
ls()
character(0)
#load data
load("./data/cameras.rda")
ls()


## paste() and paste0()   for pasting character strings together
#parameters: list of text strings, sep
#paste0() is the same as paste() but with sep=""
#Great for looping over files
#see also file.path

for(i in 1:5){
  filename = paste0("./data",i,".csv")
  print(fileName)
}

#### Getting data off webpages
library(XML)

## Cluncky way of doing it. Outputs to as a single line
con = url("http://scholar.google.com/citations?user=HI-I6C0AAAAJ&h1=en")
htmlCode = readLines(con)
close(con)
htmlCode

# using html tree parser
html3 <- htmlTreeParse("http://scholar.google.com/citations?user=HI-I6C0AAAAJ&h1=en", useInternalNodes=T)
xpathSApply(html3, "//title", xmlValue)
#some advanced data scraping
xpathSApply(html3, "//td[@id='col-citedby']", xmlvalue)


######Further resources / packages
# httr - for working with http connections
# RMySQL - for interfacing with MySQL
# bigmemory - for handling data larger than RAM
# RHadoop - for interfacing R and Hadoop (by Revolution Analytics)
# foreign - for getting data into R from SAS, SPSS, Octave, etc.
# Roger Peng's reading/writing R videos















