# Programming assignment for Data Cleaning course on Coursera, part of Data Science specialization

This code is intended to show skills with handling datasets. To do it, this dataset
is used as a source:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 
To use it, download this file:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
Unpack it to the directory with the run_analysis.R script
So if you copied the code by command
   ```
   git clone https://github.com/gagin/Coursera-DataCleaning
   ```
Then "UCI HAR Dataset" should end up in the "Coursera-DataCleaning" directory.

These are actions that were required from the run_analysis.R script: 
1. Merge the training and the test sets to create one data set.
2. Extract only the measurements on the mean and standard deviation for each measurement. 
3. Use descriptive activity names to name the activities in the data set
4. Appropriately label the data set with descriptive variable names. 
5. From the data set in step 4, create a second, independent tidy data set with the average of each variable for each activity and each subject.

Final dataset is named "tidy_dataset_with_means_and_stds_meaned.txt"
and can be read by this command:
   ```
   data<-read.table("tidy_dataset_with_means_and_stds_meaned.txt", header=TRUE)
   ```
It is tidy, because each row contains one observation with variables from different sensors in multiple columns, and so each observation is in one row and each variable is in one column. 
According to forum post by Community TA David Hood (https://class.coursera.org/getdata-015/forum/thread?thread_id=26), both wide and narrow forms would be acceptible, and script actually converted the data to narrow form while doing summarizing, but wide forms seems to be more proper, as variables are variables, and so they should be in columns.
Also, following the same notes, data Intertial Signals folders was not read, as it doesn't include the measurements on the mean and standard deviation, which will actually be used.
