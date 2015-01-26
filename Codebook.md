Accelerometer data from the Samsung Galaxy S smartphone
Data for the project was downloaded from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

The following steps were taken to create the tidy data as required:
- Required R Packages "plyr"
- Download data to subdirectory: "data/UCI HAR Dataset/"
- Run run_analysis.R which does the following:
    - Read data 
    - Merges the training and the test sets to create one data set.
    - Extracts only the measurements on the mean and standard deviation for each measurement.
    - Appropriately labels the data set with descriptive variable names.
    - Final merge of x, y & subject
    - Uses descriptive activity names to name the activities in the data set
    - From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
    - Create text file

Column Descriptions:
Subject - the subject who performed the activity for each window sample. Its range is from 1 to 30. 
Activity_Description - The tyoe of activity
Other columns contain average (by Subject & Activity) measurements.  See features_info.txt file for more details.
