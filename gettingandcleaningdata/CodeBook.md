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
