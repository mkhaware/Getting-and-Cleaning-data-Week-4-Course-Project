---
title: "Codebook.md"
output: github_document
date: "January 19, 2020"
author: "Manish Khaware"
---

```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE)
```

## R Markdown

# Getting and Cleaning Data Week 4 Project

##Description

This code book summarizes the data and variables in tidyData.txt -- this is the
output of the Week 4 project in the JHU course Getting & Cleaning Data while providing
information on the Data Set and Attributes used from the original study

#STuDY INFORMATION

##Information on Data Set
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

##Information on Attributes
###For each record in the dataset it is provided:
- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope.
- A 561-feature vector with time and frequency domain variables.
- Its activity label.
- An identifier of the subject who carried out the experiment.

#INFORMATION ON RUNANALYSIS SCRIPT

##GOALS OF RUNANALYSIS SCRIPT

Input UCI HAR Dataset downloaded from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
Following objectives were taken from the Coursera project requirements - 
        1. Merge the training and the test sets to create one data set.
        2. Extract only the measurements on the mean and standard deviation for each measurement. 
        3. Use descriptive activity names to name the activities in the data set
        4. Appropriately label the data set with descriptive activity names. 
        5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 

## 1. MERGING TRAINING & TEST SETS
Training and test data were merged for training, test and subject data sets. 

##2. EXTRACTING MEASUREMENTS ON MEAN & STANDARD DEVIATION
A logical vector was created identifying TRUE for the ID, mean & standrd deviation columns and FALSE for other values. Merged data was then subsetted to only keep the relevant columns

##3. RENAME ACTIVITIES IN DATA SET WITH DESCRIPTIVE ACTIVITY NAMES
'activity_labels.txt' was merged with the subset data to add descriptive activity names to merged data set. Values in 'activityId' column were then replaced with the matching values from the 'activityType' column in order to make the data easier to read. 

##4. APPROPRIATELY LABEL DATA SET WITH DESCRIPTIVE ACTIVITY NAMES
Used the 'gsub' function to clean up the column names in merged & subsetted data set. 'activityType' column removed in order to tidy data further.

##5. INDEPENDNENT TIDY DATA SET CREATED WITH AVERAGE FOR EACH VARIABLE & EACH SUBJECT
New table was created which contains average for each variable for each activity and subject.