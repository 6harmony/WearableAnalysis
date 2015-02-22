**Input Data**

This script assumes that the UCI dataset resides in the current working directory.

**Transformation**

The script, run_analysis.R, does the following:



- Load the following files from the UCI dataset:
	- subject_test.txt
	- x_test.txt
	- y_test.txt
	- subject_train.txt
	- x_train.txt
	- y_train.txt
	- features.txt
	- activity_labels.txt



- Merges data from the three test and three training files into a single data frame and sets the column names 
- Creates a smaller second dataset, containing only mean and std variables.
- Computes the means of this secondary dataset, group by subject/activity.
- Saves the last dataset to the local file ./data/tidy_data.txt.



**Output Data**

The resulting tidy_data.txt dataset shows the test and train subjects with their performed activity and the the mean and standard deviation variables for the following original variables:

tBodyAcc, tGravityAcc, tBodyAccJerk, tBodyGyro, tBodyGyroJerk, tBodyAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag, fBodyAcc, fBodyAccJerk, fBodyGyro, fBodyAccMag, fBodyBodyAccJerkMag, fBodyBodyGyroMag, fBodyBodyGyroJerkMag. All three X, Y, Z directions are included.

