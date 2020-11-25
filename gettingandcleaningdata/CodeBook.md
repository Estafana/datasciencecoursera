# CodeBook

The variables in Rscript:

trainx : dataframe- contains the values of the training dataset.  
testx: dataframe-  - contains the activity for which the values were measured for the training dataset.contains the values of the test dataset.  
trainsub - contains the subjects in the training dataset.  
testsub - contains the subjects in the test dataset.  
trainy - contains the activity for which the values were measured for the training dataset.  
testy - contains the activity for which the values were measured for the test dataset.  
features - vector that contains the names of all the measured values.  
act - contains the activities for which the data was collected.   
X - dataframe (10,299 x 561) - has the X values of both, taining and test dataset.  
sub - dataframe (10,299 x 1) - has the subjects of both, taining and test dataset.  
Y - dataframe (10,299 x 1) - has the corresponding activites for all subjects.  
Xdata - dataframe (10,299 x 66) - Dataset containg variables of only the mean and the standard deviation measurements.  
tidydata - dataframe (180 x 68) - The tidy dataset.  

All column names in the tidy data set are given below. 
"Subject"                     "Activities"                 
"tbodyacc-Mean()-x"           "tbodyacc-Mean()-y"          
"tbodyacc-Mean()-z"           "tbodyacc-Std()-x"           
"tbodyacc-Std()-y"            "tbodyacc-Std()-z"           
"tgravityacc-Mean()-x"        "tgravityacc-Mean()-y"       
"tgravityacc-Mean()-z"        "tgravityacc-Std()-x"        
"tgravityacc-Std()-y"         "tgravityacc-Std()-z"       
"tbodyaccjerk-Mean()-x"       "tbodyaccjerk-Mean()-y"      
"tbodyaccjerk-Mean()-z"       "tbodyaccjerk-Std()-x"       
"tbodyaccjerk-Std()-y"        "tbodyaccjerk-Std()-z"       
"tbodygyro-Mean()-x"          "tbodygyro-Mean()-y"         
"tbodygyro-Mean()-z"          "tbodygyro-Std()-x"          
"tbodygyro-Std()-y"           "tbodygyro-Std()-z"          
"tbodygyrojerk-Mean()-x"      "tbodygyrojerk-Mean()-y"     
"tbodygyrojerk-Mean()-z"      "tbodygyrojerk-Std()-x"      
"tbodygyrojerk-Std()-y"       "tbodygyrojerk-Std()-z"      
"tbodyaccmag-Mean()"          "tbodyaccmag-Std()"          
"tgravityaccmag-Mean()"       "tgravityaccmag-Std()"       
"tbodyaccjerkmag-Mean()"      "tbodyaccjerkmag-Std()"      
"tbodygyromag-Mean()"         "tbodygyromag-Std()"         
"tbodygyrojerkmag-Mean()"     "tbodygyrojerkmag-Std()"     
"fbodyacc-Mean()-x"           "fbodyacc-Mean()-y"          
"fbodyacc-Mean()-z"           "fbodyacc-Std()-x"           
"fbodyacc-Std()-y"            "fbodyacc-Std()-z"           
"fbodyaccjerk-Mean()-x"       "fbodyaccjerk-Mean()-y"      
"fbodyaccjerk-Mean()-z"       "fbodyaccjerk-Std()-x"       
"fbodyaccjerk-Std()-y"        "fbodyaccjerk-Std()-z"       
"fbodygyro-Mean()-x"          "fbodygyro-Mean()-y"         
"fbodygyro-Mean()-z"          "fbodygyro-Std()-x"          
"fbodygyro-Std()-y"           "fbodygyro-Std()-z"          
"fbodyaccmag-Mean()"          "fbodyaccmag-Std()"          
"fbodybodyaccjerkmag-Mean()"  "fbodybodyaccjerkmag-Std()"  
"fbodybodygyromag-Mean()"     "fbodybodygyromag-Std()"     
"fbodybodygyrojerkmag-Mean()" "fbodybodygyrojerkmag-Std()" 

The tidy dataset contains the mean value of the means and standard deviation measurements of all the features.  
There are 6 activities performed by 30 subjects. Hence there will be 180 rows. Of the 561 variables calculated, 33 measurements are means and 33 measurements are standard deviations. Besides this, the first variable corresponds to the subject number and the second to the activity done. Thus. there are a total of 68 columns.   
The resulting dataframe has 180*68 dimensions.   

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

