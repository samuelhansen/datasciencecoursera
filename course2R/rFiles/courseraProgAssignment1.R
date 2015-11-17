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
}

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
}
