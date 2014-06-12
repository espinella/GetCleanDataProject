## Source of data for the Coursera project: Human Activity Recognition Using Smartphones Dataset 
## Location of dataset: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
## Unzip the dataset.zip and ensure that your target folder is "UCI HAR Dataset"
## Ensure "UCI HAR Dataset" folder is set as your setwd() target directory
## Ensure the Run_Analysis.R file is sourced from within the "UCI HAR Dataset" folder 

## This R script does the following:
## 1. Loads and merges the training and test sets to create one data set.
## 2. Loads and merges tidy activity and feature names to the merged traning/test sub dataset  
## 3. Selects a subset of the training/test dataset with a mean or std characteristic
## 4. Writes to a .txt and to a .csv file

library(reshape)
  
## Ensure the "UCI HAR Dataset" folder is set in your setwd() target path
 
setwd("C:/Users/Ed/UCI HAR Dataset")
 
##load test data
message("Loading test x, test y and subject test data")
subject_test <- read.table("test/subject_test.txt")
xtest <- read.table("test/X_test.txt")
ytest <- read.table("test/y_test.txt")

##load train data
message("Loading train x, train y and subject train data")
subject_train <- read.table("train/subject_train.txt")
xtrain <- read.table("train/X_train.txt")
ytrain <- read.table("train/y_train.txt")

##load activity names
message("Loading acivity labels")
activity_labels <- read.table("activity_labels.txt")
 
##load feature names
message("Loading feature names") 
features <- read.table("features.txt")
headers <- features[,2]
 
##name columns of test and train features
message("Modify test and train columns with features names")
names(xtest) <- headers
names(xtrain) <- headers

##select only mean and std headers
message("Selecting mean and std headers")
mean_and_std <- grepl("mean\\(\\)|std\\(\\)", headers)
 
##filter mean and std columns on test and train
message("Filter to keep only mean and std columns on test and train datasets")
x_test_mean_and_std <- xtest[,mean_and_std]
x_train_mean_and_std <- xtrain[,mean_and_std]
 
##merge all test and train rows
message("Merging test and train dataset rows")
subject_all <- rbind(subject_test, subject_train)
x_all <- rbind(x_test_mean_and_std, x_train_mean_and_std)
y_all <- rbind(ytest, ytrain)

##combine all vectors/data.frames into one data frame
message("Combine all vectors into one data frame")
merged <- cbind(subject_all, y_all, x_all)
names(merged)[1] <- "SubjectID"
names(merged)[2] <- "Activity"
    
## format the column names
message("Tidying column names")
col_names_vector <- colnames(merged)
col_names_vector <- gsub("-mean()","Mean",col_names_vector,fixed=TRUE)
col_names_vector <- gsub("-std()","Std",col_names_vector,fixed=TRUE)
col_names_vector <- gsub("BodyBody","Body",col_names_vector,fixed=TRUE)
col_names_vector <- gsub("tBody","Time.Body",col_names_vector,fixed=TRUE)
col_names_vector <- gsub("tGravity","Time.Gravity",col_names_vector,fixed=TRUE)
col_names_vector <- gsub("fBody","FFT.Body",col_names_vector,fixed=TRUE)
col_names_vector <- gsub("fGravity","FFT.Gravity",col_names_vector,fixed=TRUE)
  
## put back in the tidy column names
message("Replacing columns with tidy names")
colnames(merged) <- col_names_vector

##aggregate by subjectid and activity
message("Aggregating by Subjectid and Activity")
agg <- aggregate(. ~ SubjectID + Activity, data=merged, FUN = mean)

##give activities better names
message("Adding activity names")
agg$Activity <- factor(agg$Activity, labels=activity_labels[,2])

##write to tidy .csv file
message("Writing 'tidy.csv' file to the target directory") 
write.csv(agg, file = "tidy.csv",row.names = FALSE)

##write to tidy .txt file
message("Writing 'tidy.txt' file to the target directory") 
write.table(agg, file = "tidy.txt",sep="\t", row.names = FALSE)


 

 