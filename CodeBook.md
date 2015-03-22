#Codebook

##Contents
- Feature Selection
- Column Labels

##Feature Selection
The above feature labels were taken 

The features selected for this database are a subset of the features that are 
found in the "features.txt" file in the Samsung Galaxy S smartphone dataset: 

<https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip>

The only columns kept from that database are the ones where mean and standard 
deviations were calculated for the for the original measurements.  

Column names are the same, except that special characters that are not compatible 
with R's variable naming conventions were replaced with something more compatible 
with R. All instances of commas, parentheses, underscores, and dashes have been 
removed, and replaced with a single decimal point. In cases where there were two 
or more special characters side by side, they were replaced with one single 
decimal point. In cases where these special characters appear in the end of a 
name, then they were simply removed, and not replaced with anything. 

Additionally, two columns have been included in this dataset. 

- **participant.id** is a number between 1-30 which identifies each participant.  
- **activity** activity is a factor with 6 levels:
    - WALKING
    - WALKING_UPSTAIRS
    - WALKING_DOWNSTAIRS
    - SITTING
    - STANDING
    - LAYING

For each feature, (apart from participant.id, and activity), the mean of all 
columns from both the training and test sets in the Samsung Galaxy S smartphone 
dataset was averaged, by first grouping the variables by participant.id, and 
activity. 

All features (apart from participant.id, and activity) are mean normalised values between -1 and 1.

##Column Labels
- participant.id
- activity
- tBodyAcc.mean.X
- tBodyAcc.mean.Y
- tBodyAcc.mean.Z
- tBodyAcc.std.X
- tBodyAcc.std.Y
- tBodyAcc.std.Z
- tGravityAcc.mean.X
- tGravityAcc.mean.Y
- tGravityAcc.mean.Z
- tGravityAcc.std.X
- tGravityAcc.std.Y
- tGravityAcc.std.Z
- tBodyAccJerk.mean.X
- tBodyAccJerk.mean.Y
- tBodyAccJerk.mean.Z
- tBodyAccJerk.std.X
- tBodyAccJerk.std.Y
- tBodyAccJerk.std.Z
- tBodyGyro.mean.X
- tBodyGyro.mean.Y
- tBodyGyro.mean.Z
- tBodyGyro.std.X
- tBodyGyro.std.Y
- tBodyGyro.std.Z
- tBodyGyroJerk.mean.X
- tBodyGyroJerk.mean.Y
- tBodyGyroJerk.mean.Z
- tBodyGyroJerk.std.X
- tBodyGyroJerk.std.Y
- tBodyGyroJerk.std.Z
- tBodyAccMag.mean
- tBodyAccMag.std
- tGravityAccMag.mean
- tGravityAccMag.std
- tBodyAccJerkMag.mean
- tBodyAccJerkMag.std
- tBodyGyroMag.mean
- tBodyGyroMag.std
- tBodyGyroJerkMag.mean
- tBodyGyroJerkMag.std
- fBodyAcc.mean.X
- fBodyAcc.mean.Y
- fBodyAcc.mean.Z
- fBodyAcc.std.X
- fBodyAcc.std.Y
- fBodyAcc.std.Z
- fBodyAccJerk.mean.X
- fBodyAccJerk.mean.Y
- fBodyAccJerk.mean.Z
- fBodyAccJerk.std.X
- fBodyAccJerk.std.Y
- fBodyAccJerk.std.Z
- fBodyGyro.mean.X
- fBodyGyro.mean.Y
- fBodyGyro.mean.Z
- fBodyGyro.std.X
- fBodyGyro.std.Y
- fBodyGyro.std.Z
- fBodyAccMag.mean
- fBodyAccMag.std
- fBodyBodyAccJerkMag.mean
- fBodyBodyAccJerkMag.std
- fBodyBodyGyroMag.mean
- fBodyBodyGyroMag.std
- fBodyBodyGyroJerkMag.mean
- fBodyBodyGyroJerkMag.std


