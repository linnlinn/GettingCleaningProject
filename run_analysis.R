##download and unzip file
URL<-"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
filename<-basename(URL)
download.file(URL,destfile=filename,method="internal")
unzip(filename)
##-------------------------------------------------------------------------------------------

## dplyr package used 
## plyr package used 
## if needed : 
#install.packages("dplyr")
#install.packages("plyr")
library(dplyr)
library(plyr)

## training set data
## read measures
X_train <- read.table("UCI HAR Dataset/train/X_train.txt")
## read labels
y_train <- read.table("UCI HAR Dataset/train/y_train.txt")
## read subject data
subject_train<- read.table("UCI HAR Dataset/train/subject_train.txt")

## test set data
## read measures
X_test <- read.table("UCI HAR Dataset/test/X_test.txt")
## read labels
y_test <- read.table("UCI HAR Dataset/test/y_test.txt")
## read subject data
subject_test<- read.table("UCI HAR Dataset/test/subject_test.txt")

## activity labels
labels <- read.table("UCI HAR Dataset/activity_labels.txt")

## merge activity names and labels
train_labels <- join(y_train,labels,by="V1")
test_labels <- join(y_test,labels, by="V1")

## Merge the training and the test sets to create one data set
X_data <- rbind(X_test,X_train)
data_labels <- rbind(test_labels,train_labels)
subjects <- rbind(subject_test,subject_train)
colnames(data_labels)<-c("Activity_Code","Activity_name")

## read feature names
features <- read.table("UCI HAR Dataset/features.txt")
## create valid feature names to data
featnames <- make.names(features[,2],unique=TRUE)

## merge with activity codes/names
X_data <- cbind(X_data,data_labels$Activity_name,subjects)
colnames(X_data)<-c(featnames,"Activity_name","Subject")

## Extract only the measurements on the mean and standard deviation for each measurement 
selected_features<-grepl("mean",features[,2])| grepl("std",features[,2])
tidy_data <- X_data[,selected_features]

## Create a second, independent tidy data set with the average of each variable for each activity and each subject
## create summary for each subject and activity
summary_data<-summarise_each(group_by(tidy_data,Subject, Activity_name),funs(mean))

## save file
write.table(summary_data,"summary_data.txt", row.name=FALSE)


