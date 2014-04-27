run_analysis.R script takes data from 'UCI HAR Dataset' to generate a tidy data set which contains the average of each aggregated measurement for each activity and each subject, the aggregated measurements interested in this project are the mean and standard deviation for each measurement.

There are a few notes when running run_analysis.R script:

1. The script requires 'plyr' and 'reshape2' libraries. These two libraries will be installed and loaded as part of script, but script will fail if any dependency cannot be resolved and these libraries cannot be installed.
2. The script doesn't require Samsung data file to be pre-downloaded. However, if the zip file has been downloaded and stored in the current working directory, please set 'destfile' variable in the very first line of the script to be the correct name of the zip file to avoid re-download the file again.
3. The script only uses files contain aggregated measurements data, e.g. 'X\_train.txt' and 'X_test.txt' files, the raw data files in the 'Inertial Signal' folder are not used.

run_analysis.R script processes 'UCI HAR Dataset' as follows:

1. The script checks where 'UCI HAR Dataset' zip file exists in current working directory, if not, it will download the zip file.
2. The script loads 'plyr' and 'reshape2' libraries, if they hasn't been installed, it installs them first.
3. The script reads the zip file and stores the names of files which will be worked with in the variable 'files' (Note: all the files in the 'Inertial Signal' folder are excluded).
4. The script merges subject numbers from both training and test sets to form one data set and stores in the 'subjects' variable.
5. The script merges activity codes from both training and test sets to form one data set. Then, it replaces those activity codes with descriptive activity names and stores in the 'activities' variable.
6. The script loads all the names of aggregated measurements into variable 'features'. Then, it use this variable to construct a filter vector, named 'colClasses', which extracts only the aggregated measurements on the mean and standard deviation for each measurement.
7. The script merges aggregated measurement data from both training and test sets to form one data set and store in the 'data' variable (Note: filter vector 'colClasses' is used when reading data, so only the aggregated measurements on the mean and standard deviation for each measurement are loaded).
8. The script combines 'subjects', 'activities' and 'data' variable to form one new data set that contains aggregated measurements for each activity and each subject.
9. The script creates a new data set with the average of each aggregated measurement for each activity and each subject. This data set is stored in the 'tidyData' variable, as well as the 'tidydata.txt' file in the current working directory.
