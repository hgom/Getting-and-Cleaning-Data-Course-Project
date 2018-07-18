##CodeBook run_analysis.R

#Purpose

The script generates from the raw dataset a tidy dataset. The tidy dataset contains the average values of the variables which contains the string mean or std in the name, and are grouped by activity and subject.

Dataset for this project
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

The dataset includes the following files:
=========================================

- 'README.txt'

- 'features_info.txt': Shows information about the variables used on the feature vector.

- 'features.txt': List of all features.

- 'activity_labels.txt': Links the class labels with their activity name.

- 'train/X_train.txt': Training set.

- 'train/y_train.txt': Training labels.

- 'test/X_test.txt': Test set.

- 'test/y_test.txt': Test labels.

The following files are available for the train and test data. Their descriptions are equivalent. 

- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

- 'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis. 

- 'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration. 

- 'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second. 


##run_analysis.R does the following.

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

##Explanation of the script:

1. read activity_labels.txt as a map to translate activity numbers to activaty labels
2. read y_test.txt and y_train.txt files and add an extra column which contains the name of the activity belonging by the activity number
3. read features.txt file and select the columns wich contains one of the strings "std" or "mean"
4. read x_test.txt and x_train.txt and subset the columns with the index created in step 3, the result is a subset which contains only the variables containing "std" or "mean" in the name
5. name the x_test and x_train with the (cleaned) feature names. (the string "()" is removed from the feature names)
5. read subject_test.txt and subject_train.txt and add logical variable names
6. bind the columns subject_test, y_test$activity_label and x_test datasets, bind the columns subject_train, y_train$activitylabel, x_train datasets
7. combine the rows of the two datasets from step 6 (result is one dataset containg one column for the activity, one column for the subject and all variables containing std or mean in the name.)
8. group the combined data by activity and subject and calculate the average for each column and write the result to tidy_data.txt
