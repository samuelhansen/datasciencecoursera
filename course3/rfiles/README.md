The run_analysis.R script has four different function, you should run which ones you need to in order to get the type of data you are looking to work with

You can get the data from: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

The data should be stored in a folder called data in the same directory as the script.

mergeFitData() - This will read in the raw data and combine it into a single data frame. It will add measurementType to denote if a row is from the test or train set. It will also provide a subjectID and activityID for each row.  The columns are named after the feature being measured. This function returns a data frame.

stdMeanDataExtract(dataFrameName) - This can only be run after mergeFitData. You should feed the name of the data frame where you stored the merged data. It will extract from that data frame only the columns with measurement which have to do with mean or standard deviation. It returns a dataframe with those columns and the identifying information from the merged data.

addActivities(dataFrameName) - This function can be run after either of the previous. It add in a column with a descriptive name for the type of activity being done.

summarizeStdMeanByPersonActivity(dataFrameName) - This can only be run after addActivities. It groups the data by subject and activity and then averages all of the values across these groups. It removes the measurementType and activityID variables.

To obtain the final summarized data run the following:  
soruce('/.../run_analysis.R') (replace the ... with the directory path to the R script)  
dataFrameName<-mergeFitData()  
dataFrameName<-stdMeanDataExtract(dataFrameName)  
dataFrameName<-addActivities(dataFrameName)  
dataFrameName<-summarizeStdMeanByPersonActivity(dataFrameName)  