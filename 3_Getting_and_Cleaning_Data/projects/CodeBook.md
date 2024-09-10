# CodeBook for Samsung Galaxy S Smartphone Accelerometer Data Analysis

## Data Source
The data for this project comes from the Human Activity Recognition Using Smartphones Dataset, Version 1.0:
- Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
- Smartlab - Non Linear Complex Systems Laboratory
- DITEN - Università degli Studi di Genova.
- Via Opera Pia 11A, I-16145, Genoa, Italy.
- activityrecognition@smartlab.ws
- www.smartlab.ws

## Dataset Information
The experiments were carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, 3-axial linear acceleration and 3-axial angular velocity were captured at a constant rate of 50Hz.

## Variables in the Tidy Dataset

### Identifiers
- `subject`: The ID of the test subject (integer, ranges from 1 to 30)
- `activity`: The type of activity performed when the corresponding measurements were taken (factor with 6 levels)

### Measurements
The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz.

- `tBodyAcc-mean()-X`
- `tBodyAcc-mean()-Y`
- `tBodyAcc-mean()-Z`
- `tBodyAcc-std()-X`
- `tBodyAcc-std()-Y`
- `tBodyAcc-std()-Z`
...

[List all variables here. There should be 66 measurement variables if you've extracted only the mean and standard deviation for each measurement.]

## Transformations

1. Merged the training and the test sets to create one data set.
2. Extracted only the measurements on the mean and standard deviation for each measurement.
3. Used descriptive activity names to name the activities in the data set.
4. Appropriately labeled the data set with descriptive variable names.
5. From the data set in step 4, created a second, independent tidy data set with the average of each variable for each activity and each subject.

## Units
- Features are normalized and bounded within [-1,1].
- The units used for the accelerations (total and body) are 'g's (gravity of earth -> 9.80665 m/seg2).
- The gyroscope units are rad/seg.

## Additional Notes
- Features are normalized and bounded within [-1,1].
- Each feature vector is a row on the text file.

For more information about this dataset contact: activityrecognition@smartlab.ws
