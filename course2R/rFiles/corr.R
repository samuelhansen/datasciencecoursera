corr <- function(directory, threshold = 0) {
      
      ## Write a function that takes a directory of data files and 
      ## a threshold for complete cases and calculates the correlation 
      ## between sulfate and nitrate for monitor locations where the 
      ## number of completely observed cases (on all variables) is 
      ## greater than the threshold. The function should return a vector 
      ## of correlations for the monitors that meet the threshold requirement. 
      ## If no monitors meet the threshold requirement, then the function 
      ## should return a numeric vector of length 0. A prototype of this 
      ## function follows 
      
      ## For this function you will need to use the 'cor' function in R 
      ## which calculates the correlation between two vectors. Please 
      ## read the help page for this function via '?cor' and make sure 
      ## that you know how to use it. 
      
      ## 'directory' is a character vector of length 1 indicating
      ## the location of the CSV files
      
      ## 'threshold' is a numeric vector of length 1 indicating the
      ## number of completely observed observations (on all
      ## variables) required to compute the correlation between
      ## nitrate and sulfate; the default is 0
      
      ## Return a numeric vector of correlations
      ## NOTE: Do not round the result!
      
      
      pollCor<-numeric(length = 0)
      
      for (i in 1:332){
            
            if(complete(directory,i)[,2]>threshold){
                  if (i>0 & i<10){
                        tempTbl<-read.csv(paste(directory,'/',0,0,i,'.csv',sep = ""))}
                  else if (i>9 & i<100){
                        tempTbl<-read.csv(paste(directory,'/',0,i,'.csv',sep = ""))}
                  else {tempTbl<-read.csv(paste(directory,'/',i,'.csv',sep = ""))}
                  
                  sulTempTbl<-tempTbl[,2]
                  nitTempTbl<-tempTbl[,3]
                  notNA<-numeric(length = 0)
                  
                  for (j in 1:length(sulTempTbl)){
                        if (is.na(sulTempTbl[j]) | is.na(nitTempTbl[j])){
                              
                              next}
                        else{
                              notNA<-c(notNA,j)
                        }
                  
                  }
                  
                  
                  sulTbl<-numeric(length = 0)
                  nitTbl<-numeric(length = 0)
                  
                  for (k in 1:length(notNA)){
                        sulTbl<-c(sulTbl,sulTempTbl[notNA[k]])
                        nitTbl<-c(nitTbl,nitTempTbl[notNA[k]])
                  }      
                  
                  
                  pollCor<-c(pollCor,cor(sulTbl,nitTbl))
                  
            }
            
    
            
           
            
      }
      pollCor
}