best <- function(state, outcome) {
  ## Read outcome data
  ## Check that state and outcome are valid
  ## Return hospital name in that state with lowest 30-day death
  ## rate
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
  sortedsh <- sh[order(sh[,2]),]
  hi <- which(!is.na(match(sortedsh[,2], sortedsh[1,2])))
  return(sort(sortedsh[hi,1]))
}
