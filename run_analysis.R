# run_analysis.R
# Submission for Getting and Cleaning Data Project

# project 
README.md in the repo describing how the script works and the code book describing the variables  the data, and any transformations or work that you performed to clean up the data called CodeBook.md.

Was code book submitted to GitHub that modifies and updates the codebooks available to you with the data to indicate all the variables and summaries you calculated, along with units, and any other relevant information?

#install.packages"plyr"
library(plyr)

# Read data 
setwd("C:/Roger Docs/Documents/DS/GettingData")
training.x <- read.table("data/UCI HAR Dataset/train/X_train.txt") 
training.y <- read.table("data/UCI HAR Dataset/train/y_train.txt") 
training.subject <- read.table("data/UCI HAR Dataset/train/subject_train.txt") 
test.x <- read.table("data/UCI HAR Dataset/test/X_test.txt") 
test.y <- read.table("data/UCI HAR Dataset/test/y_test.txt") 
test.subject <- read.table("data/UCI HAR Dataset/test/subject_test.txt") 
features <- read.table("data/UCI HAR Dataset/features.txt") 
activity_labels <- read.table("data/UCI HAR Dataset/activity_labels.txt") 


# Merges the training and the test sets to create one data set.
merged.x <- rbind(training.x, test.x)
merged.y <- rbind(training.y, test.y)
merged.subject <- rbind(training.subject, test.subject)

# Extracts only the measurements on the mean and standard deviation for each measurement.
i_measures <- grep("mean|std", features[,2], ignore.case = TRUE)
merged.x <- merged.x[,i_measures]

# Appropriately labels the data set with descriptive variable names.
names(merged.x) <- gsub(",","_", gsub("\\(|\\)", "", (features[i_measures, 2])))
colnames(activity_labels) <- c("Activity_Code","Activity_Description")
colnames(merged.y) <- c("Activity_Code")
colnames(merged.subject) <- c("Subject")

# Final merge of x, y & subject
merged <- cbind(merged.subject,merged.y, merged.x)

# Uses descriptive activity names to name the activities in the data set
merged <- merge(merged, activity_labels, by.x = "Activity_Code", by.y = "Activity_Code")
merged.y$Activity_Code <- NULL

# From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
tidy <- ddply(merged, .(Subject, Activity_Description), function(x) colMeans(x[,3:88]))
names(tidy)[3:88] <- gsub(",","_", gsub("\\(|\\)", "", (features[i_measures, 2])))

# Create text file
write.table(tidy,"tidy.txt", row.name=FALSE)


