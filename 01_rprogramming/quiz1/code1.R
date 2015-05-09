d <- read.csv("hw1_data.csv")


d[1:2,]


dim(d)


d[152:153,]


d[47,"Ozone"]

z <- is.na(d[,"Ozone"])
d[z,"Ozone"]
length(d[z,"Ozone"])

do <- d[d$Ozone > 31,]
dot <- do[do$Temp > 90,]
mean(dot[,"Solar.R"], na.rm=TRUE)

mean(d[d$Month==6,][,"Temp"], na.rm=TRUE)

max(d[d$Month==5,][,"Ozone"],  na.rm=TRUE)



