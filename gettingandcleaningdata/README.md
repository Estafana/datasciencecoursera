# Getting and Cleaning Data 
README file 

This is a repository for the data science course Getting and Cleaning Data on coursera provided by JHU.
The repo constains the tidy dataset, the run_analysis.R script, the codebook and the README file. 

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

The clean up process:   
First, all the files are loaded.  
1. The traing and test datasets are merged and stored in the variable X (dataframe of dimensions 10299 x 561).  
   This dataset has no columns. The features variable contains the column names. Hence, we assign the column names, while making sure the names are in lowercase and removing the () after mean and std.  
   This is done using the command:  
      colnames(X) = gsub("mean()","Mean", tolower(features[,2]))  
      colnames(X) = gsub("std()","Std", colnames(X))  
   The subject and and the Y data sets are made by merging the subject_train and subject_test, and y_train and y_test datasets respectively.   
   There datasets are of dimensions 10399x1.  
   
2. To extract the means and standard deviations:  
   A temproary variable indices is created which will store the indices and subsequently column numbers of all the features which measure mean and std.  
   To identify the indices, the gsub funtion is used.   
   The required colums are then subsetted from the X dataset.  
   The resulting dataframe has dimensions 10299x66.  
   
3. To descriptively name the activities dataset:  
   the activites dataset is stored in the Y variable. The list of activites is in the act variable.   
   The act variable also stores the number code for the respective activity.   
   Thus, we substitute the Y dataset (having only 1 column) with the activtity name by the following code:   
   Y[,1] = act[Y[,1],2]  
   Thus, depending on the number in the Y[,1], the name of the activity gets substituted.   
   The Y dataset continues to be of dimensions 10299x1.  
   
4. To label the dataset appropriately:   
   We first rename the column of the sub and act datasets as "subject" and "activity".  
   Then, we combine the subject, activity and the Xdata set via the cbind, to give a dataset where each row corresponds to the one activity and subject.  
   The resulting dataframe Xdata has dimensions 10299x68.  
   
5. Tidying the dataset:   
   The subject and activities column are converted to factors. This allows us to calcultate the means of all the features group wise directly, rather than writing it in a loop.   
   Then, using the tidy package, we first group the dataset by subject and activites (via group_by()), then calculate its mean.   
   This is done by using the summarise function. The across funtion makes sure that the mean is calculated for all the columns.   
   Finally, the tidy dataset has 180 rows and 68 columns.   

