# Getting and Cleaning Data | Coursera

## Data

Source data:
    https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 


## Scripts

The repository contains the script run_analysis.R to do the following:

1. Merge the training and the test sets to create one data set.
2. Extract only the measurements on the mean and standard deviation for each measurement. 
3. Use descriptive activity names to name the activities in the data set
4. Appropriately label the data set with descriptive variable names. 
5. Create a second, independent tidy data set with the average of each variable for each activity and each subject.

The script file should be located in the root of the unzipped dataset directory.

Set this as the working directory and use 

```R
source('run_analysis.R')
```

to run the script.

