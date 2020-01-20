#load libraries
library(dplyr)
library(data.table)

# read training data under training directly
X_train <- read.table("./UCI HAR Dataset/train/X_train.txt")
Y_train <- read.table("./UCI HAR Dataset/train/Y_train.txt")
Sub_train <- read.table("./UCI HAR Dataset/train/subject_train.txt")

# read test data under test directory
X_test <- read.table("./UCI HAR Dataset/test/X_test.txt")
Y_test <- read.table("./UCI HAR Dataset/test/Y_test.txt")
Sub_test <- read.table("./UCI HAR Dataset/test/subject_test.txt")

# read variable names from features.txt file
var_names <- read.table("./UCI HAR Dataset/features.txt")

# read activity labels from activity_labels.txt file
activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt")

#Merge the training and test set
X_total <- rbind(X_train, X_test)
Y_total <- rbind(Y_train, Y_test)
Sub_total <- rbind(Sub_train, Sub_test)

#Extract only mean and standard deviation for each measurement
selected_var <- var_names[grep("mean\\(\\)|std\\(\\)",var_names[,2]),]
X_total <- X_total[,selected_var[,1]]

#Update the column names or labels to more descriptive names from activity_labels
colnames(Y_total) <- "activity"
Y_total$activitylabel <- factor(Y_total$activity, labels = as.character(activity_labels[,2]))
activitylabel <- Y_total[,-1]

colnames(X_total) <- var_names[selected_var[,1],2]

#create independent tidy data set and write into tidydata.txt
colnames(Sub_total) <- "subject"
total <- cbind(X_total, activitylabel, Sub_total)
total_mean <- total %>% group_by(activitylabel, subject) %>% summarize_each(funs(mean))
write.table(total_mean, file = "./UCI HAR Dataset/tidydata.txt", row.names = FALSE, col.names = TRUE)