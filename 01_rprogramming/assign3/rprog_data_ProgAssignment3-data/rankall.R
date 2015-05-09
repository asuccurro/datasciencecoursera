rankall <- function(outcome, num = "best") {
  ## Read outcome data
  ## Check that state and outcome are valid
  ## For each state, find the hospital of the given rank
  ## Return a data frame with the hospital names and the
  ## (abbreviated) state name
  od  <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
  outcomes <- list("heart attack", "heart failure", "pneumonia")
  ocolumn <- c(11, 17, 23)
  if(!(outcome %in% outcomes)){
    stop("invalid outcome")
  }
  sd <- split(od[, c(2, ocolumn[match(outcome, outcomes)], 7)], od$State)
  if(num=='best') num = 1
  orderit <- function(sh){
    sh[,2] <- as.numeric(sh[,2])
    sortedsh <- sh[order(sh[,2],sh[,1]),]
    sortedsh <- sortedsh[!is.na(sortedsh[,2]),]
    if(num=='worst') num=dim(sortedsh)[1]
    return(sortedsh[num,1])
  }
  a <- lapply(sd, orderit)
  states <- sort(unique(od$State))
  rankeddf <- data.frame(hospital=a[[1]], state=states[1])
  for(i in 2:length(states)){
    rankeddf <- rbind(rankeddf, data.frame(hospital=a[[i]], state=states[i]))
  }
  rownames(rankeddf) <- states
  #names(rankeddf) <- c("hospital", "state")
  return(rankeddf)
}