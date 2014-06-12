GetCleanDataProject
===================
### Human Activity Recognition Using Smartphones Dataset Version 1.0

### Original work conducted by: 
Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
Smartlab - Non Linear Complex Systems Laboratory
* Source dataset: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip.

### Original experiment:
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.  
###### Getting and Cleaning Data - Coursera Project
Tidy data analysis conducted by Ed Spinella:  
*  Creates one R script called run_analysis.R that does the following:
*  Merges the training and the test sets to create one data set.
*  Extracts only the measurements on the mean and standard deviation for each measurement.
*  Uses descriptive activity names to name the activities in the data set
*  Appropriately labels the data set with descriptive activity names.
*  Creates an independent tidy data set (.csv and .txt file) with the average of each variable for each activity and each subject

###### The analysis includes the following files:
1. Script called `run_analysis.R` to run against the dataset available at (https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip).
2. codebook file
3. readme file
4. tidy.csv and .txt files

###### Running the script
Folder "UCI HAR Dataset" must be in the current work directory and include the source file run_analysis.R. The following messages appear as the run_analysis.R script runs:

```
[run_analysis.R] Loading test x, test y and subject test data
[run_analysis.R] Loading train x, train y and subject train data
[run_analysis.R] Loading acivity labels
[run_analysis.R] Loading feature names 
[run_analysis.R] Modify test and train columns with features names
[run_analysis.R] Selecting mean and std headers 
[run_analysis.R] Filter to keep only mean and std columns on test and train datasets
[run_analysis.R] Merging test and train dataset rows   
[run_analysis.R] Combine all vectors into one data frame
[run_analysis.R] Tidying column names
[run_analysis.R] Replacing columns with tidy names
[run_analysis.R] Aggregating by Subjectid and Activity
[run_analysis.R] Adding activity names
[run_analysis.R] Writing 'tidy.csv' file to the target directory 

```
###### Tidy Data
* The resulting tidy files are named tidy.csv and tidy.txt located within the "UCI HAR Dataset" folder after completion of run_analysis.R.
* The resulting .csv and .txt files contains one row for each subject/activity pair and columns for subject, activity, and each feature that was a mean or standard deviation from the original dataset.
