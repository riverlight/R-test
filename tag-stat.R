
library(reshape)

args <- commandArgs()
input <- args[6]
output <- args[7]

setwd("d://workroom//testroom")

tag <- read.table(input, header = TRUE, sep = ",")
tag$tv <- (tag$tvPC + tag$tvMobile + tag$tvUnknown)
tag$tc <- (tag$tcPC + tag$tcMobile + tag$tcUnknown)
tag$lc <- (tag$lcPC + tag$lcMobile + tag$lcUnknown)

newData <- tag[c("tagID", "tv", "tc", "lc")]
newData <- aggregate(newData[c("tv", "tc", "lc")], by=list(tagID=newData$tagID), FUN=sum, na.rm=TRUE)
tagID <- c("global")
tv <- c(sum(newData$tv))
tc <- c(sum(newData$tc))
lc <- c(sum(newData$lc))
global <- data.frame(tagID, tv, tc, lc)
newData <- rbind(newData, global)
newData <- newData[order(-newData$tv),]
write.csv(newData, output)
