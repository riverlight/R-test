
setwd("d://workroom//testroom")
linzGlobal11 <- read.table("./hbase/20160411.csv", header = TRUE, sep = ",")
attach(linzGlobal11)
newdata <- linzGlobal11[order(-nginxVV),]
detach(linzGlobal11)
newdata