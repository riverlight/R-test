
myDiv <- function(dura, cc) {

	result <- c(0)
	for ( i in 1:length(dura)) {
		if (cc[i]==0) {
			result[i] <- 0
		} else {
			result[i] <- dura[i]/cc[i]
		}
	}
	
	return (result)
}

args <- commandArgs()
input <- args[6]
output <- args[7]

setwd("d://workroom//testroom")
dg <- read.table(input, header = TRUE, sep = ",")
dg$rate <- dg$lc / dg$tc
dg$duraDcc <- myDiv(dg$dura , dg$cc)
newdata <- dg[order(-dg$tc),]
newdata <- newdata[c("id", "tc", "lc", "rate", "cc", "dura", "duraDcc")]
write.csv(newdata, output)
summary(newdata)
