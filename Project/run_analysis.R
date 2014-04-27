## CAUTION: If 'UCI HAR Dataset' has been downloaded in current working directory, 
## please set correct name of zip file to "destfile" variable to avoid re-download
destfile <- "getdata_projectfiles_UCI HAR Dataset.zip"
if (!file.exists(destfile)) {
  download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", destfile, method="curl")
}

## Load "plyr" library
if (!require(plyr)) {
  install.packages("plyr")
  library(plyr)
}

## Load "reshape2" library
if (!require(reshape2)) {
  install.packages("reshape2")
  library(reshape2)
}

## Get list of file names to work with, note that all the files in the 'Inertial Signal' folder are not used
files <- unzip(destfile, list=TRUE)
files <- files[-grep("Inertial Signals/|features_info|README", files$Name), "Name"]

subjects <- rbind(read.table(unz(destfile, files[grep("subject_train", files)])), read.table(unz(destfile, files[grep("subject_test", files)])))

## 3. Uses descriptive activity names to name the activities in the data set
activities <- rbind(read.table(unz(destfile, files[grep("y_train", files)])), read.table(unz(destfile, files[grep("y_test", files)])))
activities <- join(activities, read.table(unz(destfile, files[grep("activity_labels", files)])))[, 2]

features <- c(t(read.table(unz(destfile, files[grep("features", files)])))[2, ])
## 2. Extracts only the measurements on the mean and standard deviation for each measurement.
colClasses <- rep("NULL", length(features))
colClasses[grep("mean\\(\\)|std\\(\\)", features)] <- "numeric" ## exclude features whose name contain 'meanFreq'
## colClasses[grep("mean|std", features)] <- "numeric" ## include features whose name contain 'meanFreq'

## 1. Merges the training and the test sets to create one data set.
data <- rbind(read.table(unz(destfile, files[grep("X_train", files)]), colClasses=colClasses), read.table(unz(destfile, files[grep("X_test", files)]), colClasses=colClasses))
## 4. Appropriately labels the data set with descriptive activity names.
data <- cbind(subjects, activities, data)
names(data) <- c("subject", "activity", features[grep("mean\\(\\)|std\\(\\)", features)]) ## exclude features whose name contain 'meanFreq'
## names(data) <- c("subject", "activity", features[grep("mean|std", features)]) ## include features whose name contain 'meanFreq'
## write.table(data, "cleandata.txt")

## 5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.
tidyData <- dcast(melt(data, id = c("subject", "activity")), ... ~ variable, mean)
write.table(tidyData, "tidydata.txt")

## remove(subjects, activities, features, colClasses, files, destfile)
## View(tidyData)