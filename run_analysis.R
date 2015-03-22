################################################################################
#  You should create one R script called run_analysis.R that does the following. 
# - Merges the training and the test sets to create one data set.
# - Extracts only the measurements on the mean and standard deviation for each 
#   measurement. 
# - Uses descriptive activity names to name the activities in the data set
# - Appropriately labels the data set with descriptive variable names. 
# - From the data set in step 4, creates a second, independent tidy data set 
#   with the average of each variable for each activity and each subject.
################################################################################
library(dplyr)
library(reshape2)


################################################################################
#                      Import the training and test sets as one single dataframe
################################################################################
# The data from the Samsung Galaxy S accelerometer dataset has been split up 
# into two segments:
#  - a training set, and a
#  - a test set
# This split was done for the purposes of training and testing machine learning 
# algorithms as a means of avoiding the problem of "overfitting". However, for 
# our purposes, we simply want to summarise the whole data. As we such want all 
# of that data together. 
df <- rbind(read.table("data/test/X_test.txt",   colClasses="numeric"), 
            read.table("data/train/X_train.txt", colClasses="numeric"))


################################################################################
#                                                 Attach meaningful column names
################################################################################
# The names that will be used are specified in the "features.txt" file. 
# We then fix any invalid column names (column names that include invalid 
# characters such as parentheses) which would interfere with dplyr functions 
# later on (To avoid "Error: Duplicated Column name." errors)
col_names_from_file <- read.table("data//features.txt")[[2]]
names(df) <- make.names(names=col_names_from_file, unique=TRUE, allow_ = TRUE)


################################################################################
#                                                     Import the Participant IDs
#                              And add them as an extra column in  the dataframe
################################################################################
df <- cbind(df, rbind(read.table("data//test//subject_test.txt", colClasses="factor"),
                      read.table("data/train/subject_train.txt", colClasses="factor")))

df <- rename(df, participant.id=V1)  # Assigns a meaningful name to this new column


################################################################################
#                              Import the Activities from training and test sets
#                              And add them as an extra column in  the dataframe
################################################################################
df <- cbind(df, rbind(read.table("data//test//y_test.txt", colClasses="factor"),
                      read.table("data/train/y_train.txt", colClasses="factor")))

df <- rename(df, activity=V1)     # Assigns a meaningful name to this new column

# Assign Meaningful Activity Names (as specified in activity_labels.txt)
levels(df$activity) = read.table("data//activity_labels.txt", 
                                 colClasses="character")[[2]]


################################################################################
#                                                                 FILTER COLUMNS
################################################################################
# We are noly interested in keeping the columns representing the mean and 
# standard deviation for each measurement (and the Activity Label) 
df <- df[,grepl("(-mean\\(\\)|-std\\(\\))", col_names_from_file)]


################################################################################
#                          AVERAGE OF EACH VARIABLE PER ACTIVITY AND PARTICIPANT
################################################################################
# creates a second, independent tidy data set with the average of each variable 
# for each activity and each subject.
melted <- melt(df, id.vars=c("participant_id","activity"))
final.tidy <- dcast(melted, participant_id+activity~variable, mean)

# Use neat column names
names(final.tidy) <- c("participant.id", "activity", "tBodyAcc.mean.X", "tBodyAcc.mean.Y", "tBodyAcc.mean.Z", "tBodyAcc.std.X", "tBodyAcc.std.Y", "tBodyAcc.std.Z", "tGravityAcc.mean.X", "tGravityAcc.mean.Y", "tGravityAcc.mean.Z", "tGravityAcc.std.X", "tGravityAcc.std.Y", "tGravityAcc.std.Z", "tBodyAccJerk.mean.X", "tBodyAccJerk.mean.Y", "tBodyAccJerk.mean.Z", "tBodyAccJerk.std.X", "tBodyAccJerk.std.Y", "tBodyAccJerk.std.Z", "tBodyGyro.mean.X", "tBodyGyro.mean.Y", "tBodyGyro.mean.Z", "tBodyGyro.std.X", "tBodyGyro.std.Y", "tBodyGyro.std.Z", "tBodyGyroJerk.mean.X", "tBodyGyroJerk.mean.Y", "tBodyGyroJerk.mean.Z", "tBodyGyroJerk.std.X", "tBodyGyroJerk.std.Y", "tBodyGyroJerk.std.Z", "tBodyAccMag.mean", "tBodyAccMag.std", "tGravityAccMag.mean", "tGravityAccMag.std", "tBodyAccJerkMag.mean", "tBodyAccJerkMag.std", "tBodyGyroMag.mean", "tBodyGyroMag.std", "tBodyGyroJerkMag.mean", "tBodyGyroJerkMag.std", "fBodyAcc.mean.X", "fBodyAcc.mean.Y", "fBodyAcc.mean.Z", "fBodyAcc.std.X", "fBodyAcc.std.Y", "fBodyAcc.std.Z", "fBodyAccJerk.mean.X", "fBodyAccJerk.mean.Y", "fBodyAccJerk.mean.Z", "fBodyAccJerk.std.X", "fBodyAccJerk.std.Y", "fBodyAccJerk.std.Z", "fBodyGyro.mean.X", "fBodyGyro.mean.Y", "fBodyGyro.mean.Z", "fBodyGyro.std.X", "fBodyGyro.std.Y", "fBodyGyro.std.Z", "fBodyAccMag.mean", "fBodyAccMag.std", "fBodyBodyAccJerkMag.mean", "fBodyBodyAccJerkMag.std", "fBodyBodyGyroMag.mean", "fBodyBodyGyroMag.std", "fBodyBodyGyroJerkMag.mean", "fBodyBodyGyroJerkMag.std")

# Dimensions of the final tidy data
# ncol(final.tidy)   # 68  columns
# nrow(final.tidy)   # 180 rows


################################################################################
#                                                                  WRITE TO FILE
################################################################################
write.table(final.tidy, file="data/outputdata.txt", row.names=FALSE) 

