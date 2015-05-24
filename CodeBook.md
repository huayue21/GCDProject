#CodeBook for the Tidy Human Activity Dataset

## Information about the Original Dataset

This section is based on the description in [1]. 

The *Human Activity Recognition Using Smartphones* Data Set can be found in the UCI Machine Learning Repository.The original data is collected by the team of orge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto from Smartlab - Non Linear Complex Systems Laboratory of Università degli Studi di Genova, Italy.

Thirty volunteers( or subjects) labeled with ID 1 to 30 within 19 to 48 ages have joined the experiments. Each volunteer performed six activities wearing a smartphone (Samsung Galaxy S II) on the waist. In the experiments, three-axial linear acceleration and three-axial angular velocity singals are collected at a constant rate of 50Hz using the embedded accelerometer and gyroscope in the smartphone. The activity types of all the data are then labeled manually based on video records. 

Here is a table of the labels for the six activity types.

| Label   |      Activity Type      |
|:----------:|:-------------|
| 1 |  WALKING |
| 2 |    WALKING_UPSTAIRS   |
| 3 | WALKING_DOWNSTAIRS |
| 4 | SITTING|
|5 | STANDING|
|6| LAYING|

70% of the data was randomly selected as the training data and the rest 30% was used as test data. 

## Overview of Features in the Original Dataset

This is an overview of the features in the original data set, the understanding of which is crucial for our data extraction and cleaning. The following summary is based on the feature-info.txt included in the dataset[1].

For each observation in the original dataset, a 561-feature vector is provided as sensor data together with its activity label and subject identifier. 

The signals used to estimate the feature vectors can be divided into two categories: time-domain and frequency-domain.  
  
  
In the following table are the ten time domain signals. The prefix 't' in the variable name denotes time domain. All the singals come from the accelerometer and gyroscope 3-axial raw time domain signals tAcc-XYZ and tGyro-XYZ. Here *Acc* stands for accelaration, *Gyro* stands for gyroscope and *Mag* stands for magnitude.

| X,Y,Z Components of 3D Time Domain Signal    |      Magnitude      |
|:----------:|:-------------|
|tBodyAcc-X,Y,Z|tBodyAccMag|
|tGravityAcc-X,Y,Z|tGravityAccMag|
|tBodyGyro-X,Y,Z|tBodyGyroMag|
|tBodyAccJerk-X,Y,Z|tBodyAccJerkMag|
|tBodyGyroJerk-X,Y,Z|tBodyGyroJerkMag|

The acceleration signal is separated into *body* and *gravity* acceleration signals (in the table shown as tBodyAcc-X,Y,Z and tGravityAcc-X,Y,Z) . The body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-X,Y,Z and tBodyGyroJerk-X,Y,Z). The magnitude of these three-dimensional signals were calculated (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Here the prefix 'f' stands for frequency domain). Here is a table of all the seven frequency-domain variables.

| X,Y,Z Components of 3D Freqency domain variable  |      Magnitude      |
|:----------:|:-------------|
|fBodyAcc-X,Y,Z|fBodyAccMag|
|fBodyAccJerk-XYZ|fBodyAccJerkMag|
|fBodyGyro-XYZ|fBodyGyroMag|
||fBodyGyroJerkMag|

The statistical and angle variables derived from the above 17 signals are listed as below. Among them we are interested in the mean value and the standard deviation of each measurement only.

| statistics   |      Explanation      |
|:----------:|:-------------|
|mean()|Mean value|
|std()| Standard deviation|
|mad()| Median absolute deviation |
|max()| Largest value in array|
|min()| Smallest value in array|
|sma()| Signal magnitude area|
|energy()|Energy measure. Sum of the squares divided by the number of values. |
|iqr()| Interquartile range |
|entropy()| Signal entropy|
|arCoeff()| Autorregresion coefficients with Burg order equal to 4|
|correlation()| correlation coefficient between two signals|
|maxInds()| index of the frequency component with largest magnitude|
|meanFreq()| Weighted average of the frequency components to obtain a mean frequency|
|skewness()|skewness of the frequency domain signal |
|kurtosis()|kurtosis of the frequency domain signal |
|bandsEnergy()| Energy of a frequency interval within the 64 bins of the FFT of each window.|
|angle()| Angle between two vectors.|  

These are used in angle() variables:
- gravityMean
- tBodyAccMean
- tBodyAccJerkMean
- tBodyGyroMean
- tBodyGyroJerkMean

## Data Transformation

Based on the requirement of the project, we first merged the training data and the test data to get the full data set.

The variables chosen for the tidy data set are:
- 66 out of 561 features that are means and standard deviations of measurements;
- activity types;
- subject ID.

We only extract the means and standard deviations of measurements, i.e. only 66 out of 561 features are extracted.   
As required, the activity IDs' in the original data set are transformed to activity names to make them look more evident.  
To make the user better understand the data set, we enhanced the variable description by changing the name of the variables through the following string operations on the variable name list,

- the prefix 't' is replaced by 'time.'
- the prefix 'f' is replaced by 'freq.'
- 'ACC' is repalced by 'ACC.'
- 'Gyro' is repalced by 'Gyro.'
- 'Body' is repalced by 'Body.'
- 'Jerk' is repalced by 'Jerk.'
- 'Mag' is repalced by 'Mag.'
- '-mean()' is repalced by 'mean'
- '-std()' is repalced by 'std'



## Tidy Data Information

After the variable name transformations, the variable names are all self-explanatory.  
Here is the table for the abbreviations used in the variable name:

| Abbreviation   |      Explanation      |
|:----------:|:-------------|
|Acc|accelaration|
|Gyro|gyroscopic measurement|
|std|standard deviation|
|Mag|Magnitude|

For instance, *time.Gravity.Acc.mean.X* is the name for a time domain variable that measure the X-component value of the mean gravity acceleration 3D vector.  

Here is the full list of all the variables in the tidy dataset. You can infer the meaning of the variable names readily as shown in the instance. 

 [1] "time.Body.Acc.mean.X"        
 [2] "time.Body.Acc.mean.Y"        
 [3] "time.Body.Acc.mean.Z"        
 [4] "time.Body.Acc.std.X"         
 [5] "time.Body.Acc.std.Y"         
 [6] "time.Body.Acc.std.Z"         
 [7] "time.Gravity.Acc.mean.X"     
 [8] "time.Gravity.Acc.mean.Y"     
 [9] "time.Gravity.Acc.mean.Z"     
[10] "time.Gravity.Acc.std.X"      
[11] "time.Gravity.Acc.std.Y"      
[12] "time.Gravity.Acc.std.Z"      
[13] "time.Body.Acc.Jerk.mean.X"   
[14] "time.Body.Acc.Jerk.mean.Y"   
[15] "time.Body.Acc.Jerk.mean.Z"   
[16] "time.Body.Acc.Jerk.std.X"    
[17] "time.Body.Acc.Jerk.std.Y"    
[18] "time.Body.Acc.Jerk.std.Z"    
[19] "time.Body.Gyro.mean.X"       
[20] "time.Body.Gyro.mean.Y"       
[21] "time.Body.Gyro.mean.Z"       
[22] "time.Body.Gyro.std.X"        
[23] "time.Body.Gyro.std.Y"        
[24] "time.Body.Gyro.std.Z"        
[25] "time.Body.Gyro.Jerk.mean.X"  
[26] "time.Body.Gyro.Jerk.mean.Y"  
[27] "time.Body.Gyro.Jerk.mean.Z"  
[28] "time.Body.Gyro.Jerk.std.X"   
[29] "time.Body.Gyro.Jerk.std.Y"   
[30] "time.Body.Gyro.Jerk.std.Z"   
[31] "time.Body.Acc.Mag.mean"      
[32] "time.Body.Acc.Mag.std"       
[33] "time.Gravity.Acc.Mag.mean"   
[34] "time.Gravity.Acc.Mag.std"    
[35] "time.Body.Acc.Jerk.Mag.mean"  
[36] "time.Body.Acc.Jerk.Mag.std"  
[37] "time.Body.Gyro.Mag.mean"     
[38] "time.Body.Gyro.Mag.std"      
[39] "time.Body.Gyro.Jerk.Mag.mean"  
[40] "time.Body.Gyro.Jerk.Mag.std"   
[41] "freq.Body.Acc.mean.X"        
[42] "freq.Body.Acc.mean.Y"        
[43] "freq.Body.Acc.mean.Z"        
[44] "freq.Body.Acc.std.X"         
[45] "freq.Body.Acc.std.Y"         
[46] "freq.Body.Acc.std.Z"         
[47] "freq.Body.Acc.Jerk.mean.X"   
[48] "freq.Body.Acc.Jerk.mean.Y"   
[49] "freq.Body.Acc.Jerk.mean.Z"   
[50] "freq.Body.Acc.Jerk.std.X"    
[51] "freq.Body.Acc.Jerk.std.Y"    
[52] "freq.Body.Acc.Jerk.std.Z"    
[53] "freq.Body.Gyro.mean.X"       
[54] "freq.Body.Gyro.mean.Y"       
[55] "freq.Body.Gyro.mean.Z"       
[56] "freq.Body.Gyro.std.X"        
[57] "freq.Body.Gyro.std.Y"        
[58] "freq.Body.Gyro.std.Z"        
[59] "freq.Body.Acc.Mag.mean"      
[60] "freq.Body.Acc.Mag.std"       
[61] "freq.Body.Acc.Jerk.Mag.mean"   
[62] "freq.Body.Acc.Jerk.Mag.std"  
[63] "freq.Body.Gyro.Mag.mean"     
[64] "freq.Body.Gyro.Mag.std"      
[65] "freq.Body.Gyro.Jerk.Mag.mean"  
[66] "freq.Body.Gyro.Jerk.Mag.std"  
[67] "activity"  
[68] "subject.id"

Here is the values used for the `activity` variable.

| Activity|
|:-------------|
|  WALKING |
|  WALKING_UPSTAIRS|
| WALKING_DOWNSTAIRS |
| SITTING|
| STANDING|
| LAYING|

The subject.id variable values in the range [1,30].

From the dataset generated as described above, we generate one more dataset of 180 rows with the average of each variable for each activity and each subject.

## References

[1] [Human Activity Recognition Using Smartphones Data Set](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones) . Last Retrieved on 05/23/2015.