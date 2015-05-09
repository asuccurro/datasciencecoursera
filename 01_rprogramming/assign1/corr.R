corr <- function(directory, threshold = 0) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'threshold' is a numeric vector of length 1 indicating the
  ## number of completely observed observations (on all
  ## variables) required to compute the correlation between
  ## nitrate and sulfate; the default is 0
  
  ## Return a numeric vector of correlations
  corrv <- c()
  for(iid in 1:332){
    idstr <- paste(iid)
    while(nchar(idstr)<3){
      idstr <- paste('0',idstr,sep='')
    }
    filetoopen <- paste(directory,'/',idstr,'.csv',sep='')
    mydf <- read.csv(filetoopen)
    completedf <- mydf[complete.cases(mydf),]
    thisthr <- dim(completedf)[1]
    if(thisthr >= threshold){
      corrv <- c(corrv, cor(completedf$sulfate, completedf$nitrate))
    }
  }
  return(corrv)
}