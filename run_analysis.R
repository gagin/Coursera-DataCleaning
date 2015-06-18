## We need "dplyr" package to use pipe operator and cleaning functions
library(dplyr)

## Step 1. Let's merge train and test data

# 1.1 Bind subject number and activity number

# Read it all from test, bind, clean up memory
test_subjects<-read.table("test/subject_test.txt",col.names="subject")
test_Y<-read.table("test/y_test.txt",col.names="activity_number")
test_X<-read.table("test/X_test.txt")
test_all<-cbind(test_subjects,test_Y,test_X)
rm(test_subjects,test_X,test_Y)

# Same for train
train_subjects<-read.table("train/subject_train.txt",col.names="subject")
train_Y<-read.table("train/y_train.txt",col.names="activity_number")
train_X<-read.table("train/X_train.txt")
train_all<-cbind(train_subjects,train_Y,train_X)
rm(train_subjects,train_X,train_Y)

# Merge test with train and clean up memory
data<-rbind(test_all,train_all)
rm(test_all,train_all)

## Step 2. Extract only the measurements on the mean and standard deviation for each measurement.

# Read features file
features<-read.table("features.txt")
# Keep only straightforward std and mean features
goodfeatures<-filter(features,grepl("mean()",V2,fixed=TRUE) | grepl("std()",V2,fixed=TRUE))
# Now filter out data (keep first two rows)
goodcolumns<-c(1,2,unlist(goodfeatures$V1)+2)
gooddata<-data[,goodcolumns]

## Step 3. Use descriptive activity names to name the activities in the data set

activities_labels<-read.table("activity_labels.txt")
# Simpler to use as a vector
labels<-unlist(activities_labels$V2)
gooddata<-mutate(gooddata,activity_number=labels[activity_number])

## Step 4. Appropriately label the data set with descriptive variable names

# First column is already good, second one needs adjusting though, as it now contains factors
gooddata<-rename(gooddata,activity=activity_number)

# To name measurement columns, recall filtered features list from step 3
gooddata1<-rename






