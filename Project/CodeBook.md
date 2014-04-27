The dataset description from original 'UCI HAR Dataset' as follows:

"The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING\_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain." [1]

The variables defined in the run_analysis.R script are:

* destfile - name of 'UCI HAR Dataset' zip file
* files - list of name of files to be worked with
* colClasses - filter vector used to extract only the aggregated measurements on the mean and standard deviation for each measurement
* subjects - subject numbers from both training and test sets
* activities - descriptive activity names from both training and test sets
* features - names of aggregated measurements
* data - data set contains only the aggregated measurements for each activity and each subject
* tidyData - final tidy data set contains only the average of each aggregated measurement for each activity and each subject

The transformations that the run\_analysis.R script performs are (for more detailed description of how run_analysis.R script processes 'UCI HAR Dataset', please see 'README.md'):

* Merges the aggregated measurements from both training and test sets to create one data set
* Extracts only the aggregated measurements on the mean and standard deviation for each measurement
* Replaces activity code with descriptive activity names
* Appropriately labels the data set with subject numbers and descriptive activity names
* Creates a tidy data set with the average of each aggregated measurement for each activity and each subject

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012
