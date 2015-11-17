---
title: "Coursera Getting and Cleaning Data Project"
author: "Samuel Hansen"
date: "Nov 17, 2015"
output:
  html_document:
    keep_md: yes
---

## Project Description
From the Project Assignment Description:
>The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. You will be graded by your peers on a series of yes/no questions related to the project. You will be required to submit: 1) a tidy data set as described below, 2) a link to a Github repository with your script for performing the analysis, and 3) a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md. You should also include a README.md in the repo with your scripts. This repo explains how all of the scripts work and how they are connected. 
>
>One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained: 

>You should create one R script called run_analysis.R that does the following. 
>
 > 1. Merges the training and the test sets to create one data set.
 > 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
> 3. Uses descriptive activity names to name the activities in the data set
> 4. Appropriately labels the data set with descriptive variable names. 
> 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.



##Study design and data processing

###Collection of the raw data
From the UCI Machine Learn Repository(the home of the original data set)

>The experiments were carried out with a group of 30 volunteers within an age bracket of 19-48 years. They performed a protocol of activities composed of six basic activities: three static postures (standing, sitting, lying) and three dynamic activities (walking, walking downstairs and walking upstairs). The experiment also included postural transitions that occurred between the static postures. These are: stand-to-sit, sit-to-stand, sit-to-lie, lie-to-sit, stand-to-lie, and lie-to-stand. All the participants were wearing a smartphone (Samsung Galaxy S II) on the waist during the experiment execution. We captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz using the embedded accelerometer and gyroscope of the device. The experiments were video-recorded to label the data manually. The obtained dataset was randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.
>
>The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of 561 features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details.
>
>This dataset is an updated version of the UCI Human Activity Recognition Using smartphones Dataset that can be found at: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

>This version provides the original raw inertial signals from the smartphone sensors, instead of the ones pre-processed into windows which were provided in version 1. This change was done in order to be able to make online tests with the raw data. Moreover, the activity labels were updated in order to include postural transitions that were not part of the previous version of the dataset. 

From the data set README:
>The dataset includes the following files:
>
>- 'README.txt'
>
>- 'features_info.txt': Shows information about the variables used on the feature vector.
>
>- 'features.txt': List of all features.
>
>- 'activity_labels.txt': Links the class labels with their activity name.
>
>- 'train/X_train.txt': Training set.
>
>- 'train/y_train.txt': Training labels.
>
>- 'test/X_test.txt': Test set.
>
>- 'test/y_test.txt': Test labels.
>
>The following files are available for the train and test data. Their descriptions are equivalent. 
>
>- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 
>
>- 'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis. 
>
>- 'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration. 
>
>- 'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second. 

###Notes on the original (raw) data 
The data is split into two different types. Data from testing and from training. 
Each measurement provides these things(from the data set README):
>- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
>- Triaxial Angular velocity from the gyroscope. 
>- A 561-feature vector with time and frequency domain variables. 
>- Its activity label. 
>- An identifier of the subject who carried out the experiment.
>- Features are normalized and bounded within [-1,1].
>- Each feature vector is a row on the 'X' and 'y' files.
>- The units used for the accelerations (total and body) are 'g's (gravity of earth -> 9.80665 m/seg2).
>- The gyroscope units are rad/seg. 

##Creating the tidy datafile

###Guide to create the tidy data file
You can get the data from: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

The data should be stored in a folder called data in the same directory as the script.

1. Get the script run_analysis.R from:
2. Download the datat from here: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip The data should be stored in a folder called data in the same directory as the script. 
3. Load the script into R using source('/.../run_analysis.R') (replace the ... with the directory path to the R script)
4. Run the function mergeFitData() to merge the test and train data 
5. You can then run either stdMeanDataExtract(nameOfDataFrameWithMergedData) if you wish to extract only the std and mean measurements or addActivities(nameOfDataFrameWithMergedData) if you wish to add descriptive activity names to the data. These can be run in either order
6. Finally if you wish to summarize the data by subject and activity run summarizeStdMeanByPersonActivity(nameOfDataFrameWithDataWithActivityNamesAdded). This can only be run after addActvities has transformed the data. This function will determine the average of each measure by subject ID and activity name.
7. To get to the final data set run the following code:  
>dataFrameName<-mergeFitData()
>dataFrameName<-stdMeanDataExtract(dataFrameName)
>dataFrameName<-addActivities(dataFrameName)
>dataFrameName<-summarizeStdMeanByPersonActivity(dataFrameName)

###Cleaning of the data
For mergeFitData: The data is first extracted into data frames. The data frames then get their columns named using the features list. Then columns for subject, and activity. The test and train data is then combined and finally the measurement type column is added.

For stdMeanDataExtract: The columns with mean() and std() measurements are determine and extracted from the full combined data set.

For addActvities: Descripty activities are added by joining the combined data set with a table made from the activities_label data

For summarizeStdMeanByPersonActivity: The measurementType and activityID columns are removed and then the data is grouped by subject and activity. Finally the data is summarized by taking the mean of each measurement by the groups.


##Description of the variables in the tiny_data.txt file
General Dataset Information

mergeFitData Dataset: 10299 rows X 564 columns

Variables(From the Data Set README):
These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

tBodyAcc-XYZ
tGravityAcc-XYZ
tBodyAccJerk-XYZ
tBodyGyro-XYZ
tBodyGyroJerk-XYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag

The set of variables that were estimated from these signals are: 

mean(): Mean value
std(): Standard deviation
mad(): Median absolute deviation 
max(): Largest value in array
min(): Smallest value in array
sma(): Signal magnitude area
energy(): Energy measure. Sum of the squares divided by the number of values. 
iqr(): Interquartile range 
entropy(): Signal entropy
arCoeff(): Autorregresion coefficients with Burg order equal to 4
correlation(): correlation coefficient between two signals
maxInds(): index of the frequency component with largest magnitude
meanFreq(): Weighted average of the frequency components to obtain a mean frequency
skewness(): skewness of the frequency domain signal 
kurtosis(): kurtosis of the frequency domain signal 
bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
angle(): Angle between to vectors.

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

gravityMean
tBodyAccMean
tBodyAccJerkMean
tBodyGyroMean
tBodyGyroJerkMean

The complete list of variables of each feature vector is available in 'features.txt'

- Features are normalized and bounded within [-1,1].
- Each feature vector is a row on the 'X' and 'y' files.
- The units used for the accelerations (total and body) are 'g's (gravity of earth -> 9.80665 m/seg2).
- The gyroscope units are rad/seg. 
- 
All of the above are type num.

Also included are subject ids from subject_train and subject_test and activity ids from Y_Train and Y_Test. Both are integers

Only variable not included in the original data was measurementType which uses a 2 level factor string to show if the data is from the test or train sets

stdMeanDataExtract Dataset:10299  rows X 69 columns


Variables:
Only the variables from above with 
>mean(): Mean value
>std(): Standard deviation
in the name.

addActivities Dataset just adds one column to either of the previous datasets

New Variable: activityName. Takes the name of the activity from activity_labels.txt 

summarizeStdMeanByPersonActivity Dataset: 180 rows X 68 columns
(after both addActivities and stdMeanExtract run, if the extract is not run it would be 180 rows by 563 columns)

Variables:
subjectID: integer with values of 1 to 30
activityName: factor with 6 levels(WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING)
Averages:
 [1] "average-of-tBodyAcc-mean()-X"          
 [2] "average-of-tBodyAcc-mean()-Y"          
 [3] "average-of-tBodyAcc-mean()-Z"          
 [4] "average-of-tBodyAcc-std()-X"           
 [5] "average-of-tBodyAcc-std()-Y"           
 [6] "average-of-tBodyAcc-std()-Z"           
 [7] "average-of-tGravityAcc-mean()-X"       
 [8] "average-of-tGravityAcc-mean()-Y"       
 [9] "average-of-tGravityAcc-mean()-Z"       
[10] "average-of-tGravityAcc-std()-X"        
[11] "average-of-tGravityAcc-std()-Y"        
[12] "average-of-tGravityAcc-std()-Z"        
[13] "average-of-tBodyAccJerk-mean()-X"      
[14] "average-of-tBodyAccJerk-mean()-Y"      
[15] "average-of-tBodyAccJerk-mean()-Z"      
[16] "average-of-tBodyAccJerk-std()-X"       
[17] "average-of-tBodyAccJerk-std()-Y"       
[18] "average-of-tBodyAccJerk-std()-Z"       
[19] "average-of-tBodyGyro-mean()-X"         
[20] "average-of-tBodyGyro-mean()-Y"         
[21] "average-of-tBodyGyro-mean()-Z"         
[22] "average-of-tBodyGyro-std()-X"          
[23] "average-of-tBodyGyro-std()-Y"          
[24] "average-of-tBodyGyro-std()-Z"          
[25] "average-of-tBodyGyroJerk-mean()-X"     
[26] "average-of-tBodyGyroJerk-mean()-Y"     
[27] "average-of-tBodyGyroJerk-mean()-Z"     
[28] "average-of-tBodyGyroJerk-std()-X"      
[29] "average-of-tBodyGyroJerk-std()-Y"      
[30] "average-of-tBodyGyroJerk-std()-Z"      
[31] "average-of-tBodyAccMag-mean()"         
[32] "average-of-tBodyAccMag-std()"          
[33] "average-of-tGravityAccMag-mean()"      
[34] "average-of-tGravityAccMag-std()"       
[35] "average-of-tBodyAccJerkMag-mean()"     
[36] "average-of-tBodyAccJerkMag-std()"      
[37] "average-of-tBodyGyroMag-mean()"        
[38] "average-of-tBodyGyroMag-std()"         
[39] "average-of-tBodyGyroJerkMag-mean()"    
[40] "average-of-tBodyGyroJerkMag-std()"     
[41] "average-of-fBodyAcc-mean()-X"          
[42] "average-of-fBodyAcc-mean()-Y"          
[43] "average-of-fBodyAcc-mean()-Z"          
[44] "average-of-fBodyAcc-std()-X"           
[45] "average-of-fBodyAcc-std()-Y"           
[46] "average-of-fBodyAcc-std()-Z"           
[47] "average-of-fBodyAccJerk-mean()-X"      
[48] "average-of-fBodyAccJerk-mean()-Y"      
[49] "average-of-fBodyAccJerk-mean()-Z"      
[50] "average-of-fBodyAccJerk-std()-X"       
[51] "average-of-fBodyAccJerk-std()-Y"       
[52] "average-of-fBodyAccJerk-std()-Z"       
[53] "average-of-fBodyGyro-mean()-X"         
[54] "average-of-fBodyGyro-mean()-Y"         
[55] "average-of-fBodyGyro-mean()-Z"         
[56] "average-of-fBodyGyro-std()-X"          
[57] "average-of-fBodyGyro-std()-Y"          
[58] "average-of-fBodyGyro-std()-Z"          
[59] "average-of-fBodyAccMag-mean()"         
[60] "average-of-fBodyAccMag-std()"          
[61] "average-of-fBodyBodyAccJerkMag-mean()" 
[62] "average-of-fBodyBodyAccJerkMag-std()"  
[63] "average-of-fBodyBodyGyroMag-mean()"    
[64] "average-of-fBodyBodyGyroMag-std()"     
[65] "average-of-fBodyBodyGyroJerkMag-mean()"
[66] "average-of-fBodyBodyGyroJerkMag-std()" 

All of type num. The units used for the accelerations (total and body) are 'g's (gravity of earth -> 9.80665 m/seg2). The gyroscope units are rad/seg. All are averages of features which were normalized and bounded within [-1,1].


##Sources
License:
Use of this dataset in publications must be acknowledged by referencing the following publication [1] 

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.

Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.
