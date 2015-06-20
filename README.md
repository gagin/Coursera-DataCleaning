# Programming assignment for Data Cleaning course on Coursera, part of Data Science specialization

This code is intended to show skills with handling datasets. To do it, this dataset
is used as a source:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 
To use it, download this file:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
Unpack it, change to "UCI HAR Dataset" directory and clone code from GitHub there
   ```
   cd "UCI HAR Dataset"
   git clone https://github.com/gagin/Coursera-DataCleaning
   ```
These are actions that were required from the run_analysis.R script: 
1. Merge the training and the test sets to create one data set.
2. Extract only the measurements on the mean and standard deviation for each measurement. 
3. Use descriptive activity names to name the activities in the data set
4. Appropriately label the data set with descriptive variable names. 
5. From the data set in step 4, create a second, independent tidy data set with the average of each variable for each activity and each subject.

Final dataset is named "Resulting dataset has been written to file tidy_dataset_with_means_and_stds_meaned.csv" and, according to its name, it's in CSV format and can be read be:
   ```
   data<-read.csv("tidy_dataset_with_means_and_stds_meaned.csv")
   ```

Notes by David Hood (Community TA) were used while working on the project https://class.coursera.org/getdata-015/forum/thread?thread_id=26
In particular, data Intertial Signals folders was not read, as it doesn't include the measurements on the mean and standard deviation, which will actually be used. Although, despite idea that both wide and narrow forms of the resulting data will be tidy, and data was actually converted to narrow form to calculate means without naming all the columns (I had to use plyr package to do this at the step 4), the final dataset is expanded to wide form, so that each variable will be in one column.
