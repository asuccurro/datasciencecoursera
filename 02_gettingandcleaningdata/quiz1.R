furl = "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
download.file(furl, destfile="./data/acs.csv", method="curl")
df <- read.csv("./data/acs.csv", header=TRUE)
val <- df[,"VAL"]
length(which(val==24))
summary(as.factor(home$VAL))
a <- as.factor(home$BDS)
b <- as.factor(home$RMS)
table(a, b)


download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FDATA.gov_NGAP.xlsx", destfile="./data/ngap.xlsx", method="curl")
dfx <- read.xlsx("./data/ngap.xlsx", sheetIndex=1, header=TRUE)
dat<-dfx[18:23,7:15]
sum(dat$Zip*dat$Ext,na.rm=T) 

xmlf <-"https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml"
doc <- xmlTreeParse(xmlf, useInternal=TRUE)
doc
