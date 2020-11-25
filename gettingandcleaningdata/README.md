# Getting and Cleaning Data 
README file 

This is a repository for the data science course Getting and Cleaning Data on coursera provided by JHU.
The repo constains the raw data files, the tidy dataset, the run_analysis.R script, the codebook and the README file. 

The data has been obtained from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
The file was downloaded and unzipped on the loacal directory. 
The original data is at http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Steps to run the script: 
1. Download the data set and unzip it. Make sure all files (under test and train also) are under the UCI HAR Dataset
2. Create a run_analysis.R in the UCI HAR Dataset folder. Make sure working directory is set to UCI HAR Dataset
3. Runing the run_analysis script cleans the data and writes the cleaned data into a tidydata file. 

The R script does the following: 
1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names.
5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

Tidydata file can be seen in the UCI HAR Dataset.
