complete <- function(directory, id = 1:332) {
      
      ## Write a function that reads a directory full of files 
      ## and reports the number of completely observed cases in 
      ## each data file. The function should return a data frame 
      ## where the first column is the name of the file and the second 
      ## column is the number of complete cases. A prototype of this 
      ## function follows 
      
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
      
    
     
      for (i in 1:length(id)){
            if (id[i]>0 & id[i]<10){
                  tempTbl<-read.csv(paste(directory,'/',0,0,id[i],'.csv',sep = ""))}
            else if (id[i]>9 & id[i]<100){
                  tempTbl<-read.csv(paste(directory,'/',0,id[i],'.csv',sep = ""))}
            else {tempTbl<-read.csv(paste(directory,'/',id[i],'.csv',sep = ""))}
                  
            if (i==1){/Volumes/hugeFuckingDisk/Sync/portableSync/gitHub/datasciencecoursera/course2R/rFiles/corr.R
                  compCount <- data.frame(id=id[1],
                                          nobs=sum(complete.cases(tempTbl)))}
            else {tableCount<-data.frame(id=id[i],nobs=sum(complete.cases(tempTbl)))
                  compCount<-rbind(compCount,tableCount)}
         
            
      }
      compCount
}
