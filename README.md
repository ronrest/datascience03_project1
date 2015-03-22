# Project 1

This repo contains a files:

-run_analysis.R 

-CodeBook.md

## run_analysis.R
This file takes data collected from the accelerometers of the Samsung Galaxy S 
smartphone, and creates a new tidy dataset that is exported as a txt file. 

####Prerequisutes
In order to run the file, you need to have a subdirectory in your working 
directory called "data". Within this directory you will need to have the following data:
    https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
You will need to download this file and extract its contents into the "data" directory, so that you end up with the following file directory structure (directories are enclosed in square brackets)


    [working directory]
        - run_analysis.R
        - [data]
            - activity_labels.txt
            - features.txt
            - [test]
                - subject_test.txt
                - X_test.txt
                - y_test.txt
            - [train]
                - subject_train.txt
                - X_train.txt
                - y_train.txt

A full description of the data that is used is available at: 
    http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 


####Running
Simply run the R script, either in a terminal window, or in RStudio.

####Output
Once you run the script, a new file is created in the "data" directory, called 
"outputdata.txt" which is the new tidy dataset. 



## CodeBook.md
This file contains Information about the new generated tidy dataset. 