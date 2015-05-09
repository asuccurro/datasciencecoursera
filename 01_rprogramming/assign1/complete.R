complete <- function(directory, id = 1:332) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  
  ## Return a data frame of the form:
  ## id nobs
  ## 1  117
  ## 2  1041
  ## ...
  ## where 'id' is the monitor ID number and 'nobs' is the
  ## number of complete cases
  nobs <- c()
  for(iid in 1:length(id)){
    idstr <- paste(id[iid])
    while(nchar(idstr)<3){
      idstr <- paste('0',idstr,sep='')
    }
    filetoopen <- paste(directory,'/',idstr,'.csv',sep='')
    mydf <- read.csv(filetoopen)
    nobs <- c(nobs, dim(mydf[complete.cases(mydf),])[1])
  }
  return(data.frame(id, nobs))
}
