# CodeBook for Human Activity Recognition Using Smartphones Dataset

The original "Human Activity Recognition Using Smartphones Dataset" was used as a base for transformations.

## The original dataset description

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

### Original features

The dataset contains:

* A 561-feature vector with time and frequency domain variables. 
* Its activity label. 
* An identifier of the subject who carried out the experiment.

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

tBodyAcc-XYZ  
tGravityAcc-XYZ  
tBodyAccJerk-XYZ  
tBodyGyro-XYZ  
tBodyGyroJerk-XYZ  
tBodyAccMag  
tGravityAccMag  
tBodyAccJerkMag  
tBodyGyroMag  
tBodyGyroJerkMag  
fBodyAcc-XYZ  
fBodyAccJerk-XYZ  
fBodyGyro-XYZ  
fBodyAccMag  
fBodyAccJerkMag  
fBodyGyroMag  
fBodyGyroJerkMag  

The set of variables that were estimated from these signals are: 

mean(): Mean value  
std(): Standard deviation  
mad(): Median absolute deviation   
max(): Largest value in array  
min(): Smallest value in array  
sma(): Signal magnitude area  
energy(): Energy measure. Sum of the squares divided by the number of values.   
iqr(): Interquartile range   
entropy(): Signal entropy  
arCoeff(): Autorregresion coefficients with Burg order equal to 4  
correlation(): correlation coefficient between two signals  
maxInds(): index of the frequency component with largest magnitude  
meanFreq(): Weighted average of the frequency components to obtain a mean frequency  
skewness(): skewness of the frequency domain signal   
kurtosis(): kurtosis of the frequency domain signal   
bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.  
angle(): Angle between to vectors.  

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

gravityMean  
tBodyAccMean  
tBodyAccJerkMean  
tBodyGyroMean  
tBodyGyroJerkMean  

## Transformations

The following transformations has been applied to the original dataset:

### Merge of train and test set

The train and test set has been merged together. In the original version they were splitted into two files.

### Extraction of mean and standard deviation features

Only features for mean and standard deviations measures were kept. That means that from the original 561 feature vector we reduce it to 66 features.

### Add feauture about subject and activity

The subject and activity features has been added to the data set. The subject is an integer ranging from 1 to 30 and the activity is the factor vector describing 6 activities:

WALKING   
WALKING_UPSTAIRS  
WALKING_DOWNSTAIRS  
SITTING  
STANDING  
LAYING  

### Renaming columns

The columns has been renamed into readable and clean names. The following pattern has been used:

* Original name: `tBodyGyroJerk-mean()-X`
* Renamed: `time.body.gyroscope.jerk.mean.x`

The new names are in lower case and each word is separated by the `.`.

Different words were renamed to something more explicit:

* t to time
* f to frequency
* Acc to accelerometer
* Gyro to gyroscope
* Mag to magnitude
* `-` and `()` were deleted 

### Aggregating data

All the values are means, aggregated over 30 subjects and 6 activities, hence the resulting dataset is 180 rows by 68 columns.

## Resulting Tidy dataset

Below is the transformed dataset:

| Feature                                              | Values                     |
|------------------------------------------------------|----------------------------|
|subject                                               |							|
|activity                                          	   |							|
|time.body.accelerometer.mean.x                        |							|
|time.body.accelerometer.mean.y                        |							|
|time.body.accelerometer.mean.z                        |							|
|time.body.accelerometer.std.x                         |							|
|time.body.accelerometer.std.y                         |							|
|time.body.accelerometer.std.z                         |							|
|time.gravity.accelerometer.mean.x                     |							|
|time.gravity.accelerometer.mean.y                     |							|
|time.gravity.accelerometer.mean.z                     |							|
|time.gravity.accelerometer.std.x                      |							|
|time.gravity.accelerometer.std.y                      |							|
|time.gravity.accelerometer.std.z                      |							|
|time.body.accelerometer.jerk.mean.x                   |							|
|time.body.accelerometer.jerk.mean.y                   |							|
|time.body.accelerometer.jerk.mean.z                   |							|
|time.body.accelerometer.jerk.std.x                    |							|
|time.body.accelerometer.jerk.std.y                    |							|
|time.body.accelerometer.jerk.std.z                    |							|
|time.body.gyroscope.mean.x                            |							|
|time.body.gyroscope.mean.y                            |							|
|time.body.gyroscope.mean.z                            |							|
|time.body.gyroscope.std.x                             |							|
|time.body.gyroscope.std.y                             |							|
|time.body.gyroscope.std.z                             |							|
|time.body.gyroscope.jerk.mean.x                       |							|
|time.body.gyroscope.jerk.mean.y                       |							|
|time.body.gyroscope.jerk.mean.z                       |							|
|time.body.gyroscope.jerk.std.x                        |							|
|time.body.gyroscope.jerk.std.y                        |							|
|time.body.gyroscope.jerk.std.z                        |							|
|time.body.accelerometer.magnitude.mean                |							|
|time.body.accelerometer.magnitude.std                 |							|
|time.gravity.accelerometer.magnitude.mean             |							|
|time.gravity.accelerometer.magnitude.std              |							|
|time.body.accelerometer.jerk.magnitude.mean           |							|
|time.body.accelerometer.jerk.magnitude.std            |							|
|time.body.gyroscope.magnitude.mean                    |							|
|time.body.gyroscope.magnitude.std                     |							|
|time.body.gyroscope.jerk.magnitude.mean               |							|
|time.body.gyroscope.jerk.magnitude.std                |							|
|fequency.body.accelerometer.mean.x                    |							|
|fequency.body.accelerometer.mean.y                    |							|
|fequency.body.accelerometer.mean.z                    |							|
|fequency.body.accelerometer.std.x                     |							|
|fequency.body.accelerometer.std.y                     |							|
|fequency.body.accelerometer.std.z                     |							|
|fequency.body.accelerometer.jerk.mean.x               |							|
|fequency.body.accelerometer.jerk.mean.y               |							|
|fequency.body.accelerometer.jerk.mean.z               |							|
|fequency.body.accelerometer.jerk.std.x                |							|
|fequency.body.accelerometer.jerk.std.y                |							|
|fequency.body.accelerometer.jerk.std.z                |							|
|fequency.body.gyroscope.mean.x                        |							|
|fequency.body.gyroscope.mean.y                        |							|
|fequency.body.gyroscope.mean.z                        |							|
|fequency.body.gyroscope.std.x                         |							|
|fequency.body.gyroscope.std.y                         |							|
|fequency.body.gyroscope.std.z                         |							|
|fequency.body.accelerometer.magnitude.mean            |							|
|fequency.body.accelerometer.magnitude.std             |							|
|fequency.body.body.accelerometer.jerk.magnitude.mean  |							|
|fequency.body.body.accelerometer.jerk.magnitude.std   |							|
|fequency.body.body.gyroscope.magnitude.mean           |							|
|fequency.body.body.gyroscope.magnitude.std            |							|
|fequency.body.body.gyroscope.jerk.magnitude.mean      |							|
|fequency.body.body.gyroscope.jerk.magnitude.std       |                            |