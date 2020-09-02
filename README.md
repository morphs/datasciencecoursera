# DataScience specialization Getting and Cleaning Data Course Project

## This repository contains files associated with Getting and cleaning Data.

The project of this course is on [**run_analysis.R**](https://github.com/morphs/datasciencecoursera/blob/master/run_analysis.R), it gets, unzips and cleans the dataset.
**Other files are related to the course but not the project.**
### The project requests are:

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.


### To complete the steps above, it was needed to:

1. Load the files,i.e, datasets, labels and descriptions. 
2. Rename columns to properly identify each variable
3. Merge labels,descriptions and subjects before merging test and train datasets
4. Filter the variables requested, from the 561 variables listed on features, only 66 were about mean or standart deviation, giving 69 total variables if you count label, label description and subjects (30 subjects).
5. Fix bad columns names, removing "-", "()" etc.
6. Save first dataset to a .csv file, ordered, cleaned.
7. Create a summary of the averages of each variable based on each activity and each subject.
8. Write to a .txt file to submit the dataset.

### Other relevant comments:

The code also has comments detailing each step. I also decided to remove unused variables and mantain variable names whenever possible, as R keeps variables on memory and if you have bigger datasets it gets really bad. The dyplr package was used because merge can change the order of the rows and inner_join doesn't have this problem.

More information about the dataset can be found [**here**](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).

#### Attribute Information:

For each record in the dataset it is provided:
- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope.
- A 561-feature vector with time and frequency domain variables.
- Its activity label.
- An identifier of the subject who carried out the experiment.

Besides, there is a README.txt file with the dataset for more details.

#### Codebook
Variable Name         | Variable Detail
----------------------|----------------------------------------
activitityDescription | Activity label
subject | Subject Number
tBodyAccmeanX | X axis time body acceleration mean
tBodyAccmeanY | Y axis time body acceleration mean
tBodyAccmeanZ | Z axis time body acceleration mean
tBodyAccstdX  | X axis time body acceleration standard deviation
tBodyAccstdY | Y axis time body acceleration standard deviation
tBodyAccstdZ | Z axis time body acceleration standard deviation
tGravityAccmeanX | X axis time Gravity acceleration mean
tGravityAccmeanY | Y axis time Gravity acceleration mean
tGravityAccmeanZ | Z axis time Gravity acceleration mean
tGravityAccstdX | X axis time Gravity acceleration standard deviation
tGravityAccstdY | Y axis time Gravity acceleration standard deviation
tGravityAccstdZ | Z axis time Gravity acceleration standard deviation
tBodyAccJerkmeanX | X axis time body jerk acceleration mean
tBodyAccJerkmeanY | Y axis time body jerk acceleration mean
tBodyAccJerkmeanZ | Z axis time body jerk acceleration mean
tBodyAccJerkstdX |  X axis time body jerk acceleration standard deviation
tBodyAccJerkstdY | Y axis time body jerk acceleration standard deviation
tBodyAccJerkstdZ | Z axis time body jerk acceleration standard deviation
tBodyGyromeanX | X axis time body gyro mean
tBodyGyromeanY | Y axis time body gyro mean
tBodyGyromeanZ | Z axis time body gyro mean
tBodyGyrostdX | X axis time body gyro standard deviation
tBodyGyrostdY | Y axis time body gyro standard deviation
tBodyGyrostdZ | Z axis time body gyro standard deviation
tBodyGyroJerkmeanX | X axis time body gyro jerk mean 
tBodyGyroJerkmeanY | Y axis time body gyro jerk mean
tBodyGyroJerkmeanZ | Z axis time body gyro jerk mean
tBodyGyroJerkstdX | X axis time body gyro jerk standard deviation
tBodyGyroJerkstdY | Y axis time body gyro jerk standard deviation
tBodyGyroJerkstdZ | Z axis time body gyro jerk standard deviation
tBodyAccMagmean | time body magnitude acceleration mean
tBodyAccMagstd | time body acceleration magnitude standard deviation
tGravityAccMagmean | time gravity acceleration magnitude mean
tGravityAccMagstd | time gravity acceleration magnitude standard deviation
tBodyAccJerkMagmean | time body acceleration jerk magnitude mean
tBodyAccJerkMagstd | time body acceleration jerk magnitude standard deviation
tBodyGyroMagmean | time body gyro magnitude mean
tBodyGyroMagstd | time body gyro magnitude standard deviation
tBodyGyroJerkMagmean | time body gyro jerk magnitude mean
tBodyGyroJerkMagstd | time body gyro jerk magnitude standard deviation
fBodyAccmeanX | X axis frequency body acceleration mean
fBodyAccmeanY | Y axis frequency body acceleration mean
fBodyAccmeanZ | Z axis frequency body acceleration mean
fBodyAccstdX | X axis frequency body acceleration standard deviation
fBodyAccstdY | Y axis frequency body acceleration standard deviation
fBodyAccstdZ | Z axis frequency body acceleration standard deviation
fBodyAccJerkmeanX | X axis frequency body acceleration jerk mean
fBodyAccJerkmeanY | Y axis frequency body acceleration jerk mean
fBodyAccJerkmeanZ | Z axis frequency body acceleration jerk mean
fBodyAccJerkstdX | X axis frequency body acceleration jerk standard deviation
fBodyAccJerkstdY | Y axis frequency body acceleration jerk standard deviation  
fBodyAccJerkstdZ |Z axis frequency body acceleration jerk standard deviation
fBodyGyromeanX | X axis frequency body gyro mean
fBodyGyromeanY | Y axis frequency body gyro mean
fBodyGyromeanZ | Z axis frequency body gyro mean
fBodyGyrostdX | X axis frequency body gyro standard deviation
fBodyGyrostdY | Y axis frequency body gyro standard deviation
fBodyGyrostdZ | Z axis frequency body gyro standard deviation
fBodyAccMagmean | frequency body acceleration magnitude mean
fBodyAccMagstd | frequency body acceleration magnitude standard deviation
fBodyAccJerkMagmean | frequency body acceleration jerk magnitude mean
fBodyAccJerkMagstd | frequency body acceleration jerk magnitude standard deviation
fBodyGyroMagmean | frequency body gyro magnitude mean 
fBodyGyroMagstd | frequency body gyro magnitude standard deviation
fBodyGyroJerkMagmean | frequency body gyro jerk mean
fBodyGyroJerkMagstd | frequency body gyro jerk standard deviation
activity | Activity number


#### Citation request for the dataset:

Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. A Public Domain Dataset for Human Activity Recognition Using Smartphones. 21th European Symposium on Artificial Neural Networks, Computational Intelligence and Machine Learning, ESANN 2013. Bruges, Belgium 24-26 April 2013.
