# This is the code book for the project

## How to get to the tinyData.txt:
1. Download data from the link below and unzip it into working directory of R Studio.
2. Execute the R script.

## About the source data
The source data are from the Human Activity Recognition Using Smartphones Data Set. A full description is available at the site where the data was obtained:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
Here are the data for the project: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

## About R script
File with R code "run_analysis.R" performs the 5 following steps (in accordance assigned task of course work):   
1. Reading in the files and merging the training and the test sets to create one data set.    
2. Extracting only the measurements on the mean and standard deviation for each measurement   
3. Using descriptive activity names to name the activities in the data set   
4. Appropriately labeling the data set with descriptive variable names   
5. Creating a second, independent tidy data set with the average of each variable for each activity and each subject     

The code assumes all the data is present in the same folder, un-compressed and without names altered.

# Tidy data set description

### The variables in the tidy data
Tidy data contains 180 rows and 82 columns. Each row has averaged variables for each subject and each activity.
### The data were averaged based on subject and activity group.

Subject column is numbered sequentially from 1 to 30.
Activity column has 6 types as listed below.
1. WALKING
2. WALKING_UPSTAIRS
3. WALKING_DOWNSTAIRS
4. SITTING
5. STANDING
6. LAYING
