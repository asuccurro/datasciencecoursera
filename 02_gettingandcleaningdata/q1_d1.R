furl = "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
download.file(furl, destfile="./data/acs.csv", method="curl")
df <- read.csv("./data/acs.csv", header=TRUE)
val <- df[,"VAL"]
length(which(val==24))
summary(as.factor(df$VAL))
