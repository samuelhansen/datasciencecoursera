best <- function(stateabb, outcome) {
      ## Read outcome data
      data <- read.csv("data/outcome-of-care-measures.csv", colClasses = "character")
      ## Check that state and outcome are valid
      states<-unique(data$State)
      if (!(toupper(stateabb) %in% states))
      {
            stop("invalid state")
      }
      outcomes <- c("heart attack","heart failure","pneumonia")
      if (!(tolower(outcome) %in% outcomes))
      {
            stop("invalid outcome")
      }
      ## Return hospital name in that state with lowest 30-day death
      hospitals <- character( length=0)
      mortalityRates <- integer( length = 0)
      for (i in 1:nrow(data))
      {
            if (data[i,7]==stateabb)
            {
                  
                  if (tolower(outcome)=="heart attack")
                  {
                        if (data[i,11]!="Not Available")
                        {
                              hospitals <- c(hospitals,data[i,2]) 
                              mortalityRates <- c(mortalityRates,as.numeric(data[i,11]))
                        }
                  }
                  else if (tolower(outcome)=="heart failure")
                  {
                        if (data[i,17]!="Not Available")
                        {
                              hospitals <- c(hospitals,data[i,2]) 
                              mortalityRates <- c(mortalityRates,as.numeric(data[i,17]))
                        }
                  }
                  else
                  {
                        if (data[i,23]!="Not Available")
                        {
                              hospitals <- c(hospitals,data[i,2]) 
                              mortalityRates <- c(mortalityRates,as.numeric(data[i,23]))
                        }
                  }
                  
            }
      }
      hospMatrix <- cbind(hospitals,mortalityRates)
      orderedHospitals <- matrix(hospMatrix[order(mortalityRates,hospitals),])
      bestHosp<-orderedHospitals[1,1]
      as.character(bestHosp)
}