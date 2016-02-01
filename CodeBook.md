#Code Book for run_analysis.R

* [Dataset](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) that will be transformed. Along with original codebooks.

* The script will apply the following transformations:
	1. **Binding raw data**:
		*subject_train, y_train, X_train, subject_test, y_test & X_test will be binded into one big table.*
		* subject_ tables are single column and contain 30 subject IDs, 1:30.
		* y_ tables are single column and contain 6 activity IDs, 1:6.
		* X_ tables have 561-variables and they show 2 different signal domains: time "t" and frequency "f".
	2. **Selecting filtered variables from raw data**:
		*It will select 88 variables from features.txt, all of them containing "[Mm]ean" or "std".*
	3. **Renaming ACTIVITY variable values**:
		*Subject IDs 1:6 will be named with the value names found in activity_labels.txt*
	4. **Renaming filtered variables**:
		*The 88 variables will be labeled with descriptive variable names, substituting "t" for "time", "f" for "freq" and using "." as separation.*
	5. **Creating a second, independent tidy data set** with the average of each variable for each activity and each subject.

* It will display the two final tables.

* It will return the table in step 5.
