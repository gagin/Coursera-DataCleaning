---
title: "CodeBook.md"
output: html_document
---

This script creates a summary view for means and standard deviations
of accelerometer and gyroscope data collected from smartphones worn
by 30 human test subjects while performing six activities
(WALKING, WALKING UPSTAIRS, WALKING DOWNSTAIRS, SITTING, STANDING, LAYING).

The original dataset from Smartlab - Non Linear Complex Systems Laboratory
is described and available here:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

* Test and train data were merged,
* subject and activity numbers put to first two columns,
* only measurements on the mean and standard deviation for each
measurement were kept,
* activity labels were put inside of the data table to replace activity numbers,
* columns were named according to dataset features names which are:

1. BodyAcc-mean-X
2. tBodyAcc-mean-Y
3.	tBodyAcc-mean-Z
4.	tBodyAcc-std-X
5.	tBodyAcc-std-Y
6.	tBodyAcc-std-Z
7.	tGravityAcc-mean-X
8.	tGravityAcc-mean-Y
9.	tGravityAcc-mean-Z
10.	tGravityAcc-std-X
11.	tGravityAcc-std-Y
12.	tGravityAcc-std-Z
13.	tBodyAccJerk-mean-X
14.	tBodyAccJerk-mean-Y
15.	tBodyAccJerk-mean-Z
16.	tBodyAccJerk-std-X
17.	tBodyAccJerk-std-Y
18.	tBodyAccJerk-std-Z
19.	tBodyGyro-mean-X
20.	tBodyGyro-mean-Y
21.	tBodyGyro-mean-Z
22.	tBodyGyro-std-X
23.	tBodyGyro-std-Y
24.	tBodyGyro-std-Z
25.	tBodyGyroJerk-mean-X
26.	tBodyGyroJerk-mean-Y
27.	tBodyGyroJerk-mean-Z
28.	tBodyGyroJerk-std-X
29.	tBodyGyroJerk-std-Y
30.	tBodyGyroJerk-std-Z
31.	tBodyAccMag-mean
32.	tBodyAccMag-std
33.	tGravityAccMag-mean
34.	tGravityAccMag-std
35.	tBodyAccJerkMag-mean
36.	tBodyAccJerkMag-std
37.	tBodyGyroMag-mean
38.	tBodyGyroMag-std
39.	tBodyGyroJerkMag-mean
40.	tBodyGyroJerkMag-std
41.	fBodyAcc-mean-X
42.	fBodyAcc-mean-Y
43.	fBodyAcc-mean-Z
44.	fBodyAcc-std-X
45.	fBodyAcc-std-Y
46.	fBodyAcc-std-Z
47.	fBodyAccJerk-mean-X
48.	fBodyAccJerk-mean-Y
49.	fBodyAccJerk-mean-Z
50.	fBodyAccJerk-std-X
51.	fBodyAccJerk-std-Y
52.	fBodyAccJerk-std-Z
53.	fBodyGyro-mean-X
54.	fBodyGyro-mean-Y
55.	fBodyGyro-mean-Z
56.	fBodyGyro-std-X
57.	fBodyGyro-std-Y
58.	fBodyGyro-std-Z
59.	fBodyAccMag-mean
60.	fBodyAccMag-std
61.	fBodyBodyAccJerkMag-mean
62.	fBodyBodyAccJerkMag-std
63.	fBodyBodyGyroMag-mean
64.	fBodyBodyGyroMag-std
65.	fBodyBodyGyroJerkMag-mean
66.	fBodyBodyGyroJerkMag-std

Then data were summarized to show average of each variable for each activity and each subject.