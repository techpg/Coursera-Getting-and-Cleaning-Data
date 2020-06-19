library(dplyr)
library(data.table)
## Merges the training and the test sets to create one data set.

X_train <- read.table("./UCI HAR Dataset/train/X_train.txt")
Y_train <- read.table("./UCI HAR Dataset/train/Y_train.txt")
Sub_train <- read.table("./UCI HAR Dataset/train/subject_train.txt")

X_test <- read.table("./UCI HAR Dataset/test/X_test.txt")
Y_test <- read.table("./UCI HAR Dataset/test/Y_test.txt")
Sub_test <- read.table("./UCI HAR Dataset/test/subject_test.txt")

features <- read.table("./UCI HAR Dataset/features.txt")

activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt")

X_total <- rbind(X_train, X_test)
Y_total <- rbind(Y_train, Y_test)
Sub_total <- rbind(Sub_train, Sub_test)
colnames(X_total) <- features[,2]
colnames(Y_total) <- "activityID"
colnames(Sub_total) <- "subjectID"
mergedset <- cbind(Y_total, Sub_total, X_total) ## mergedset is the merged data set

## Extracts only the measurements on the mean and standard deviation for each measurement.

colNames <- colnames(mergedset)
mean_and_std <- (grepl("activityID", colNames) | grepl("subjectID", colNames) | grepl("mean|std", colNames))
setforMeanandStd <- alltotal[ , mean_and_std == TRUE] ## Answer to Part 2

## Uses descriptive activity names to name the activities in the data set

setnames(activity_labels, old = c('V1','V2'), new = c('activityID','activity'))
setWithActivityNames <- merge(activity_labels,setforMeanandStd, by = "activityID", all.x = TRUE) ## Answer to part 3

## Appropriately labels the data set with descriptive variable names.

colnames(setWithActivityNames)<-gsub("^t","time",colnames(setWithActivityNames))
colnames(setWithActivityNames)<-gsub("^f", "frequency", colnames(setWithActivityNames))
colnames(setWithActivityNames)<-gsub("Acc", "Accelerometer", colnames(setWithActivityNames))
colnames(setWithActivityNames)<-gsub("Gyro", "Gyroscope", colnames(setWithActivityNames))
colnames(setWithActivityNames)<-gsub("Mag", "Magnitude", colnames(setWithActivityNames))
colnames(setWithActivityNames)<-gsub("BodyBody", "Body", colnames(setWithActivityNames))

## Removed all symbols for variables and replacing with real names.

## creating a second independent tidy data set with the average of each variable for each activity and each subject.

tidySet <- aggregate(. ~activity + subjectID, setWithActivityNames, mean)
tidySet <- tidySet[order(tidySet$activity, tidySet$subjectID), ]
write.table(tidySet, "tidySet.txt", row.names = FALSE) ## final answer.