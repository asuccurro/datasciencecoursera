if(!file.exists("data")) {
  dir.create("data")
}
fileUrl <- "https://data.baltimorecity.gov/api/views/dz54-2aru/rows.csv?accessType=DOWNLOAD"
download.file(fileUrl, destfile="./data/cameras.csv", method="curl")
list.files("./data")
dateDownloaded <- date()
#df <- read.table(fname, header = TRUE, sep=",", quote="")
df <- read.csv("./data/cameras.csv", header = TRUE)

xlsfileUrl <- "https://data.baltimorecity.gov/api/views/dz54-2aru/rows.xls?accessType=DOWNLOAD"
download.file(xlsfileUrl, destfile="./data/cameras.xls", method="curl")
dfx <- read.xlsx("./data/cameras.xls", sheetIndex=1, header=TRUE)

require(XML)
xmlfileUrl<-"http://www.w3schools.com/xml/simple.xml"
doc <- xmlTreeParse(xmlfileUrl, useInternal=TRUE)
rootNode<- xmlRoot(doc)
xmlName(rootNode)
xpathSApply(rootNode,"//name",xmlValue)
xpathSApply(rootNode,"//calories",xmlValue)

htmlfileUrl <- "http://espn.go.com/nfl/team/_/name/bal/baltimore-ravens"
doch <- htmlTreeParse(htmlfileUrl, useInternal=TRUE)
scores <- xpathSApply(doch,"//li[@class='score']", xmlValue)
teams <- xpathSApply(doch,"//li[@class='team-name']", xmlValue)


require(jsonlite)
jsonData<-fromJSON("https://api.github.com/users/jtleek/repos")
names(jsonData)
names(jsonData$owner)
jsonData$owner$login
myjson <- toJSON(iris, pretty=TRUE)


require(data.table)
DF <- data.frame()
DT <- data.table()








ucscDb <- dbConnect(MySQL(), user="genome", host="genome-mysql.cse.ucsc.edu")
result <- dbGetQuery(ucscDb, "show databases;")
dbDisconnect(ucscDb)







