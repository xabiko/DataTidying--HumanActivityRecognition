#Code Book for run_analysis.R

* **It will take 1 parameter**: the file path to the unzipped dataset (UCI HAR Dataset/).

* It will apply the following transformations:
	1. **Binding raw data**:
		*subject_train, y_train, X_train, subject_test, y_test & X_test will be binded into one big table*
	2. **Selecting filtered variables from raw data**:
		*It will select 88 variables from features.txt, all of them containing "[Mm]ean" | "std".*
	3. **Renaming ACTIVITY variable values**:
		*Values 1:6 will be named with the value names found in activity_labels.txt*
	4. **Renaming filtered variables**:
		*The variables will be labeled with descriptive variable names.*
	5. **Creating a second, independent tidy data set** with the average of each variable for each activity and each subject.

* It will display the two final tables.

* It will return the table in step 5.
