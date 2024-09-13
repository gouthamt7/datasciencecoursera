# CodeBook for Getting and Cleaning Data Project:
# Samsung Galaxy S Smartphone Accelerometer Data Analysis
Goutham Tanjavuru <br />

## Data Source
The data for this project comes from the Human Activity Recognition Using Smartphones Dataset:
The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. 
A full description is available at the site where the data was obtained:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
 
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

## Transformations
1. Merged the training and the test sets to create one data set.
2. Extracted only the measurements on the mean and standard deviation for each measurement.
3. Used descriptive activity names to name the activities in the data set.
4. Appropriately labeled the data set with descriptive variable names.
5. From the data set in step 4, created a second, independent tidy data set with the average of each variable for each activity and each subject.
   ## Please see the README.md for how the following instructions are implemented [README.md](https://github.com/gouthamt7/datasciencecoursera/blob/Master/3_Getting_and_Cleaning_Data/projects/README.md)

## Units
- Features are normalized and bounded.
- The units used for the accelerations (total and body) are 'g's (gravity of earth -> 9.80665 m/seg2).
- The gyroscope units are rad/seg.

## Additional Notes
- Features are normalized and bounded.
- Each feature vector is a row on the text file.

