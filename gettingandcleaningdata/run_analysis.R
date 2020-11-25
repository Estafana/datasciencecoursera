
##Loading libraries
library(dplyr)
library(tidyr)

##setting directory
setwd("E:/Data Science Coursera/UCI HAR Dataset")

##Loading data 
##loading X values (values of all the variables)
trainx = read.table("X_train.txt")
testx = read.table("X_test.txt")
##loading subject data 
trainsub = read.table("subject_train.txt")
testsub = read.table("subject_test.txt")
##Loading activities data per row of the X data
trainy = read.table("y_train.txt")
testy = read.table("y_test.txt")
##Loading list of all features
features = read.table("features.txt")
##Loading list of activities
act = read.table("activity_labels.txt")

## 1. Merges the training and the test sets to create one data set.
##merging the X data values of training and test set
X = rbind(trainx, testx)
##merging subjects from training and test sets
sub = rbind(trainsub, testsub)
##mergning actvities data set for corresponding rows in X dataset
Y = rbind(trainy, testy)
##naming all the variables of X dataset
colnames(X) = gsub("mean()","Mean", tolower(features[,2]))
colnames(X) = gsub("std()","Std", colnames(X))

## 2. Extracts only the measurements on the mean and standard deviation for each measurement.
##returns a list of indices which are the means or stanndard deviations.
indices = grep("mean[()+]|std[()+]", features[,2])
Xdata = X[indices]
##subsetting. 

## 3. Uses descriptive activity names to name the activities in the data set
act[,2] = gsub("_","",tolower(act[,2])) ##replaces WALKING_UPSTAIRS with walkingupstairs and so on. 
Y[,1] = act[Y[,1],2]
## here, the activity name in the second col gets assigned to the Y[,1] as per the number in Y[,1] which corresponds to the row value in act. 
## basically, if vector Y[,1] values become row values. so, if Y[,1] is c(5.1,3,6,2,4), then the values get assigned accordingly because row indices are same as the factor levels given to the activities

## 4. Appropriately labels the data set with descriptive variable names.
##colnames(X) = features[,indices]
colnames(sub) = "Subject"
colnames(Y) = "Activities"
Xdata = cbind(sub, Y, Xdata)
##Resulting is a data frame with the subject code, activity performed, and the corresponding data of the variables

## 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
##Converting the subject and activities columns to factors
Xdata$Subject = factor(Xdata$Subject)
Xdata$Activities= factor(Xdata$Activities)
##Calculating means of the dataset
tidydata = Xdata %>% group_by(Subject, Activities) %>% summarise(across(.cols = everything(), .fns = mean))

write.table(tidydata, "tidydata.txt")
