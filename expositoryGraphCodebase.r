######### Expository Graphs
### to communicate results
##communicate information
##information density is good
##color/size is used for aesthetics and communication
##understandable axes, titles and legends

##housing data
pData <- read.csv("./data/ss06pid.csv")

## Axes
plot(pData$JWMNP,pData$WAGP,pch=19,col="blue",cex=0.5,
       xlab="Travel time(min)",ylab="Last 12 month wages (dollars)"
	   cex.lab=2,cex.axis=1.5)

## Legends
plot(pData$JWMNP,pData$WAGP,pch=19,col="blue",cex=0.5,xlab="TT (min)",ylab="Wages(dollars)")
legend(100,200000,legend="All surveyed",col="blue",pch=19,cex=0.5)

plot(pData$JWMNP,pData$WAGP,pch=19,col="blue",cex=0.5,xlab="TT (min)",ylab="Wages(dollars)",col=pData$SEX)
legend(100,200000,legend=c("men","women"),col=c("black","red"),pch=c(19,19),cex=c(0.5,0.5))
#with title
plot(pData$JWMNP,pData$WAGP,pch=19,cex=0.5,xlab="CT (min)",
     ylab="Wages(dollars)",col=pData$SEX,main="Wages earned versus commute time")
legend(100,200000,legend=c("men","women"),col=c("black","red"),pch=c(19,19),cex=c(0.5,0.5))

#multiple panels
par(mfrow=c(1,2))
hist(pData$JWMNP,xlab="CT (min)",col="blue",breaks=100,main="")
plot(pData$JWMNP,pData$WAGP,pch=19,cex=0.5,xlab="CT (min)",ylab="Wages (dollars)",col=pData$SEX)
legend(100,200000,legend=c("men","women"),col=c("black","red"),pch=c(19,19),cex=c(0.5,0.5))
#adding text
par(mfrow=c(1,2))
hist(pData$JWMNP,xlab="CT (min)",col="blue",breaks=100,main="")
mtext(text="(a)",side=3,line=1)
plot(pData$JWMNP,pData$WAGP,pch=19,cex=0.5,xlab="CT (min)",ylab="Wages (dollars)",col=pData$SEX)
legend(100,200000,legend=c("men","women"),col=c("black","red"),pch=c(19,19),cex=c(0.5,0.5))
mtext(text="(b)",side=3,line=1)

##also captions and colorblindness (vischeck)

####Workflow
## Start with rough plot
## Tweak it to make expository
## Save the file                ?devices
## include in presentations

### Saving the file
pdf(file="twoPanel.pdf",height=4,width=8)
par(mfrow=c(1,2))
hist(pData$JWMNP,xlab="CT (min)",col="blue",breaks=100,main="")
mtext(text="(a)",side=3,line=1)
plot(pData$JWMNP,pData$WAGP,pch=19,cex=0.5,xlab="CT (min)",ylab="Wages (dollars)",col=pData$SEX)
legend(100,200000,legend=c("men","women"),col=c("black","red"),pch=c(19,19),cex=c(0.5,0.5))
mtext(text="(b)",side=3,line=1)

dev.off

## or png
png(file="twoPanel.png", height=480,width=(2*480))
par(...

## or this

par(mfro...
...
...

dev.copy2pdf(file="twopanelv2.pdf")

  