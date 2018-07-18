#Getting and cleaning data course project

This repository contains an R script to clean the following dataset https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
The zip file contains the datasets and a readme.txt file which describes the datasets

##run_analyis.R will:

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

##Running run_analysis.R

1. Download and dataset https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
2. Unzip the dataset, after unzipping the dataset a folder UCI HAR Dataset is created
3. Start run_analysis.R source("run_analysis.R"), after running the script a file tidy_dataset.txt is created and contains the result of the setp 5

##preconditions
To run run_analysis.R correctly:
1. the work space directory must contains a directory "UCI HAR Dataset" including the dataset files
2. The dplyr library must be installed
