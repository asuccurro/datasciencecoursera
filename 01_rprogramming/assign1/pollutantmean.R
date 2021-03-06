pollutantmean <- function(directory, pollutant, id = 1:332) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'pollutant' is a character vector of length 1 indicating
  ## the name of the pollutant for which we will calculate the
  ## mean; either "sulfate" or "nitrate".
  
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  
  ## Return the mean of the pollutant across all monitors list
  ## in the 'id' vector (ignoring NA values)
  pollutantval <- c()
  for(iid in 1:length(id)){
    idstr <- paste(id[iid])
    while(nchar(idstr)<3){
      idstr <- paste('0',idstr,sep='')
    }
    filetoopen <- paste(directory,'/',idstr,'.csv',sep='')
    mydf <- read.csv(filetoopen)
    pollutantval <- c(pollutantval, mydf[,pollutant])
  } 
  return(mean(pollutantval, na.rm=TRUE))
}
