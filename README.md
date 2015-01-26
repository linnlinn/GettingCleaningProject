# Getting and Cleaning Data Course Project

One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Here are the data for the project:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

# R script 
run_analysis.R does the following:

    Merges the training and the test sets to create one data set.
    Extracts only the measurements on the mean and standard deviation for each measurement. 
    Uses descriptive activity names to name the activities in the data set
    Appropriately labels the data set with descriptive variable names. 
    From the data set in step 4, creates a second, independent tidy data set with the average 
    of each variable for each activity and each subject.

# Details
Step 1 : Download and unzip data
Step 2 : Load packages dplyr and plyr
Step 3 : Read all the datasets necessary for the project
Step 4 : Find the title of each activity for each mesurement using the table of activity codes
Step 5 : Create one dataset with all the data
Step 6 : Select only the data related to means or standard deviation
Step 7 : Summarize the data by test subject and activity type

