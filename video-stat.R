
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
video <- read.table(input, header = TRUE, sep = ",")
video$r1 <- video$tc / video$vv
video$r2 <- video$lc / video$tc
newdata <- video[order(-video$vv),]
write.csv(newdata, output)
summary(newdata)
