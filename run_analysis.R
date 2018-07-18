## Create one R script called run_analysis.R that does the following:
# 1 Merges the training and the test sets to create one data set.
# 2 Extracts only the measurements on the mean and standard deviation for each measurement.
# 3 Uses descriptive activity names to name the activities in the data set
# 4 Appropriately labels the data set with descriptive variable names.
# 5 From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.


library(dplyr)

# 1. read activity label file and add logical variable names to the columns
activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt")
names(activity_labels) <- c("activity", "activity_label")

# 2. read y_test file and add 1 column with the mapped activity name
y_test <- read.table("UCI HAR Dataset/test/y_test.txt")
names(y_test) <- c("activity")
y_test <- mutate(y_test, activity_label = activity_labels$activity_label[activity])

# 3. read feature list and add logical variable names
features <- read.table("UCI HAR Dataset/features.txt", stringsAsFactors = F)
names(features) <- c("feature_id", "feature")
# 4. remove () from variables and select coulms for which te variable name contains "std" or "mean"
features$feature <- gsub("[()]", "", features$feature)
features_mean_std <- grep("mean|std", features$feature)

# 5. read x_test and select only the columns with std|mean in the column name
x_test <- read.table("UCI HAR Dataset/test/X_test.txt")
x_test <- x_test[,features_mean_std]
names(x_test) <- features$feature[features_mean_std]

# 6. read subjects and add logical variable name
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt")
names(subject_test) <- c("subject")

# 7. bind columns of subjects activity names and and test data
x_test <- cbind(subject_test, select(y_test, activity_label), x_test)

# 8. read y_train file and 1 column with mapped activity name
y_train <- read.table("UCI HAR Dataset/train/y_train.txt")
names(y_train) <- c("activity")
y_train <- mutate(y_train, activity_label = activity_labels$activity_label[activity])

# 9. read x_train file and select only the columns with std|mean in the column name 
x_train <- read.table("UCI HAR Dataset/train/X_train.txt")
x_train <- x_train[,features_mean_std]
names(x_train) <- features$feature[features_mean_std]

# 10. read subjects and add logical variable name
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt")
names(subject_train) <- c("subject")

# 11. bind columns of subjects activity names and and test data
x_train <- cbind(subject_train, select(y_train, activity_label), x_train)

# 12. bind rows of test and train set
x_mean_std_data <- rbind(x_test, x_train)

# 13. group by subject and activity and calculate the average of all other columns
average_subject_activity <- group_by(x_mean_std_data, subject, activity_label) %>% summarise_all(mean)

write.table(average_subject_activity, file = "./tidy_data.txt", row.names = FALSE)
