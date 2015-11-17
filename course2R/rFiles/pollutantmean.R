pollutantmean <- function(directory, pollutant, id = 1:332) {
      
      ## Write a function named 'pollutantmean' that calculates the mean 
      ## of a pollutant (sulfate or nitrate) across a specified list of 
      ## monitors. The function 'pollutantmean' takes three arguments: 
      ## 'directory', 'pollutant', and 'id'. Given a vector monitor ID numbers, 
      ## 'pollutantmean' reads that monitors' particulate matter data from the 
      ## directory specified in the 'directory' argument and returns the mean 
      ## of the pollutant across all of the monitors, ignoring any missing values
      ## coded as NA. A prototype of the function is as follows 
      
      ## 'directory' is a character vector of length 1 indicating
      ## the location of the CSV files
      
      ## 'pollutant' is a character vector of length 1 indicating
      ## the name of the pollutant for which we will calculate the
      ## mean; either "sulfate" or "nitrate".
      
      ## 'id' is an integer vector indicating the monitor ID numbers
      ## to be used
      
      ## Return the mean of the pollutant across all monitors list
      ## in the 'id' vector (ignoring NA values)
      ## NOTE: Do not round the result!
      
      overallMean<-0
      counter<-0
      
      if (id[1]>0 & id[1]<10){
            pollutantTable<-read.csv(paste(directory,'/',0,0,id[1],'.csv',sep = ""))}
      else if (id[1]>9 & id[1]<100){
            pollutantTable<-read.csv(paste(directory,'/',0,id[1],'.csv',sep = ""))}
      else {
            pollutantTable<-read.csv(paste(directory,'/',id[1],'.csv',sep = ""))}
      
      for (i in 1:length(id)){
            if(i==1){
                  next()
            }
            
            if (id[i]>0 & id[i]<10){
                  tempTbl<-read.csv(paste(directory,'/',0,0,id[i],'.csv',sep = ""))}
            else if (id[i]>9 & id[i]<100){
                  tempTbl<-read.csv(paste(directory,'/',0,id[i],'.csv',sep = ""))}
            else {
                  tempTbl<-read.csv(paste(directory,'/',id[i],'.csv',sep = ""))}
            
            pollutantTable<-rbind(pollutantTable,tempTbl)
            
      }
      mean(pollutantTable[,pollutant],na.rm = TRUE)
}

