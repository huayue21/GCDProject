#CodeBook for a Tidy Human Activity Dataset

## Data collection

The original data is collected by the team of orge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto from Smartlab - Non Linear Complex Systems Laboratory of Università degli Studi di Genova, Italy.

30 subjects labeled with ID 1-30 within 19-48 ages have joined the experiments. Each volunteer performed six activities wearing a smartphone (Samsung Galaxy S II) on the waist. In the experiments, three-axial linear acceleration and three-axial angular velocity singals are collected at a constant rate of 50Hz using the embedded accelerometer and gyroscope in the smartphone. The activity types of all the data are then labeled manually based on video records. 

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

## Overview of features in the original data

For each record, a 561-feature vector is provided as sensor data together with its activity label and subject identifier. 

The following are the time domain signals used to derive the 561 features. The prefix 't' in the variable name denotes time domain. All the singals come from the accelerometer and gyroscope 3-axial raw time domain signals tAcc-XYZ and tGyro-XYZ. Here Acc stands for accelaration, Gyro stands for gyroscope and Mag stands for magnitude.

| X,Y,Z Components of 3D time domain variable    |      Magnitude      |
|:----------:|:-------------|
|tBodyAcc-X,Y,Z|tBodyAccMag|
|tGravityAcc-X,Y,Z|tGravityAccMag|
|tBodyGyro-X,Y,Z|tBodyGyroMag|
|tBodyAccJerk-X,Y,Z|tBodyAccJerkMag|
|tBodyGyroJerk-X,Y,Z|tBodyGyroJerkMag|

The acceleration signal was separated into body and gravity acceleration signals (tBodyAcc-X,Y,Z and tGravityAcc-X,Y,Z) . The body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-X,Y,Z and tBodyGyroJerk-X,Y,Z). 

The magnitude of these three-dimensional signals were calculated (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. ('f' stands for frequency domain). 

| X,Y,Z Components of 3D Freqency domain variable  |      Magnitude      |
|:----------:|:-------------|
|fBodyAcc-X,Y,Z|fBodyAccMag|
|fBodyAccJerk-XYZ|fBodyAccJerkMag|
|fBodyGyro-XYZ|fBodyGyroMag|
||fBodyGyroJerkMag|

The statistical variables derived from the above 17 signals are listed as below. Among them we are interested in the mean value and the standard deviation of each measurement.

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

Based on the requirement, we merged the training data and the test data to get the full data set.

The variables choosed for the tidy data set are:
- 66 out of 561 features that are means and standard deviations of measurements
- activity types
- subject ID

To make the user better understand the data set, we enhanced the variable description by changing the name of the variables.
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

After these transformations, the variable names are all self-explaintory.
Here are table for the abbraviations:

| Acronym   |      Explanation      |
|:----------:|:-------------|
|ACC|accelaration|
|Gyro|gyroscopic measurement|
|std|standard deviation|
|Mag|Magnitude|

For instance, 'time.Gravity.Acc.mean.X' is the name for a time domain variable that measure the X-component value of the mean gravity acccelaration 3D vector.

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

We also use descriptive activity names to name the activities in the data set.

