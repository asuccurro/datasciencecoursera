rankhospital <- function(state, outcome, num = "best") {
  ## Read outcome data
  ## Check that state and outcome are valid
  ## Return hospital name in that state with the given rank
  ## 30-day death rate
  od  <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
  states <- unique(od$State)
  outcomes <- list("heart attack", "heart failure", "pneumonia")
  ocolumn <- c(11, 17, 23)
  if(!(state %in% states)){
    stop("invalid state")
  }
  if(!(outcome %in% outcomes)){
    stop("invalid outcome")
  }
  sh <- od[od$State==state, c(2, ocolumn[match(outcome, outcomes)])]
  sh[,2] <- as.numeric(sh[,2])
  sortedsh <- sh[order(sh[,2],sh[,1]),]
  sortedsh <- sortedsh[!is.na(sortedsh[,2]),]
  if(num=='best') num = 1
  if(num=='worst') num=dim(sortedsh)[1]
  return(sortedsh[num,1])
}