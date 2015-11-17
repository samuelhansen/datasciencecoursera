mergeFitData<- function(){
      ##Function to merge the data together
      ##Will add mesurement type to differentiate
      ##Label columns using included feature names table
      
      ##Load in the data
      testDataSet<-read.table("data/test/X_test.txt")
      testLabelSet<-read.table("data/test/Y_test.txt")
      testSubjectSet<-read.table("data/test/subject_test.txt")
      trainDataSet<-read.table("data/train/X_train.txt")
      trainLabelSet<-read.table("data/train/Y_train.txt")
      trainSubjectSet<-read.table("data/train/subject_train.txt")
      features<-read.table("data/features.txt")
      
      ##Create a factor variable of test and train to label rows
      dataType<-factor(c(rep("test",nrow(testLabelSet))
                         ,rep("train",nrow(trainLabelSet))))
      
      ##Name columns of labels and activities for easier joins
      colnames(testLabelSet)<-c("activityID")
      colnames(trainLabelSet)<-c("activityID")
      
      ##Label feature columns for easier reference
      colnames(features)<-c("featureID","featureName")
      
      ##Add subject and activity information to test and train data sets
      testDataSet<-cbind(testSubjectSet,testLabelSet,testDataSet)
      trainDataSet<-cbind(trainSubjectSet,trainLabelSet,trainDataSet)
      
      ##Use feature names to label columns of test and train data sets
      ##Use as.character to for factor labels instead of integers
      dataColNames<-c("subjectID","activityID",
                      as.character(features$featureName))
      colnames(testDataSet)<-dataColNames
      colnames(trainDataSet)<-dataColNames
      
      ##Merge together the rows of test and train data sets
      allDataSet<-rbind(testDataSet,trainDataSet)
      allDataSet<-cbind(measurementType=dataType,allDataSet)
      
      return(allDataSet)
      
}

stdMeanDataExtract<-function(allDataSet){
      ##Function to extract out only mean and std measures
      
      ##Use regex to find all mean and std measurements
      ##Do not include the mean frequency measurements
      meanStdNames<-setdiff(grep('mean()|std()'
                                 ,names(allDataSet))
                            ,grep('meanFreq()',names(allDataSet)))
      
      
      ##Include the measurementType, subjectID, and activityName Info
      keptCols<-union(c(1,2,3),meanStdNames)
      
      ##Extract the mean std columns to a new data frame
      stdMeanDataSet<-allDataSet[,keptCols]
      
      return(stdMeanDataSet)
      
}

addActivities<-function(stdMeanDataSet){
      ##Function to add activity labels to data
      
      ##Add to use join
      library(dplyr)
      
      activityLabels<-read.table("data/activity_labels.txt")
      colnames(activityLabels)<-c("activityID","activityName")
      ##Add activity labels to Data Set
      stdMeanDataSetActivity<-join(activityLabels,stdMeanDataSet)
      
      return(stdMeanDataSetActivity)
       
}

summarizeStdMeanByPersonActivity<-function(stdMeanDataSetActivity){
      ##Function to find over all measure averages by subject and activity
      
      ##Add to use group_by and summarize_each
      library(dplyr)
      
      ##Remove activityID and measurementType to make grouping easier
      stdMeanDataSetActivity<-select(stdMeanDataSetActivity,-(activityID))
      stdMeanDataSetActivity<-select(stdMeanDataSetActivity,-(measurementType))
      
      ##Group data by subject and activity
      stdMeanDataGrouped<-group_by(stdMeanDataSetActivity,subjectID,activityName)
      
      ##Average each factor measurement by subject and activity type
      stdMeanAveraged<-summarise_each(stdMeanDataGrouped,funs(mean))
      
      ##Make sure column names are descriptive
      newColNames<-paste("average-of-",colnames(stdMeanAveraged),sep="")
      newColNames[1:2]<-c("subjectID","activityName")
      colnames(stdMeanAveraged)<-newColNames
      
      return(stdMeanAveraged)
      
}