require(XML)
xmll <-"https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml"
xmlf <- "./data/restaurants.xml"
download.file(xmll, xmlf, method = "wget",quiet = TRUE)
doc <- xmlTreeParse(xmlf, useInternal=TRUE)
rootNode<- xmlRoot(doc)
zips <- xpathSApply(rootNode,"//zipcode",xmlValue)
summary(as.factor(zips))
