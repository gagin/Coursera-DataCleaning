## We will use plyr instead of in addition to dplyr to use its mass column rename by vector
library(plyr)
library(dplyr)
library(tidyr)

## Step 1. Let's merge train and test data

# 1.1 Bind subject number and activity number

# Read it all from test
test_subjects<-read.table(file.path("UCI HAR Dataset","test","subject_test.txt"),col.names="subject")
test_Y<-read.table(file.path("UCI HAR Dataset","test","y_test.txt"),col.names="activity_number")
test_X<-read.table(file.path("UCI HAR Dataset","test","X_test.txt"))
# Put numbers for subject and activity to the first two columns
test_all<-cbind(test_subjects,test_Y,test_X)
# Clean up the memory
rm(test_subjects,test_X,test_Y)

# Same for train
train_subjects<-read.table(file.path("UCI HAR Dataset","train","subject_train.txt"),col.names="subject")
train_Y<-read.table(file.path("UCI HAR Dataset","train","y_train.txt"),col.names="activity_number")
train_X<-read.table(file.path("UCI HAR Dataset","train","X_train.txt"))
train_all<-cbind(train_subjects,train_Y,train_X)
rm(train_subjects,train_X,train_Y)

# Merge test with train and clean up memory
data<-rbind(test_all,train_all)
rm(test_all,train_all)

## Step 2. Extract only the measurements on the mean and standard deviation for each measurement.

# Read features file
features<-read.table(file.path("UCI HAR Dataset","features.txt"))

# Keep only straightforward std and mean features
goodfeatures<-filter(features,grepl("mean()",V2,fixed=TRUE) | grepl("std()",V2,fixed=TRUE))

# Now filter out data. Keep first two rows as they have information on subject and activity, not
# measurements. Shift column numbers for measurements by 2 to compensate for that.
goodcolumns<-c(1,2,unlist(goodfeatures$V1)+2)
gooddata<-data[,goodcolumns]

## Step 3. Use descriptive activity names to name the activities in the data set

activities_labels<-read.table(file.path("UCI HAR Dataset","activity_labels.txt"))
# Simpler to use as a vector, so unlist
labels<-unlist(activities_labels$V2)
gooddata<-mutate(gooddata,activity_number=labels[activity_number])

## Step 4. Appropriately label the data set with descriptive variable names

# First column is already good, second one needs adjusting though, as it now contains factors
gooddata<-rename(gooddata,activity=activity_number)

# To name measurement columns, recall filtered features list from step 3
# In order to mass-rename columns withour manually naming them, we'll use plyr's function
# First, let's prepare replace vector

# It has to be converted to character, otherwise factors are presented by their numbers.
# Also, let's remove parenthesis, they are just visual noise
# We'll use "fixed=TRUE" so parenthesis wouldn't need to be escaped
replace<-sub("()","", as.character(goodfeatures$V2), fixed=TRUE)
# Also, auto-generated column names have "V" in them, so let's attach it
names(replace)<-paste0("V",goodfeatures$V1)
# Now we can rename
# Dplyr package has been loaded last, so its functions are default,
# and plyr's rename (which is different) should be named fully
gooddata<-plyr::rename(gooddata,replace)

## Step 5. Creates a tidy data set with the average of each variable for each activity and each subject

# It would be inconvenient to summarize wide form of the data, so let's make it narrow before summarizing
meaned<- gooddata %>%
  gather(variable,value,-subject,-activity) %>%
    group_by(subject,activity,variable) %>%
      summarize(mean=mean(value)) %>%
        spread(variable,mean)
write.csv(meaned, "tidy_dataset_with_means_and_stds_meaned.csv")
print("Resulting dataset has been written to file tidy_dataset_with_means_and_stds_meaned.csv")
