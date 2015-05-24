# README
README file for the repo of Peer Assessments /Getting and Cleaning Data Course Project.

Files included in this repo:

- **run_analysis.R** : The R code used to merge the training and test data,extract mean and std variables, change the activity values and alter the variable names. The outputs are two tidy datasets, and the latter one is saved in a text file.
- **CodeBook.md** : Description of the variables in the tidy dataset. Explanation the original dataset and variables, and the data transformations applied. 
- **README.md** : This file explains how all the files work and how they are connected.
- **Xmean.y.subject.txt** : The data file of a tidy data set with the average of each variable for each activity and each subject described in the CodeBook.

The pipeline of the processing in the **run_analysis.R** script is described as follows,  
  
Step1. Retrieve the meta data(features,activity labels) from features.txt and activity_labels.txt;  
Step2. Retrieve the train data. There are three parts: the subject values are retrieved from train/subject_train.txt, the X values from train/X_train.txt and the y values(the labels of activities) from 'train/y_train.txt';  
Step3. Retrieve the test data. Following the logic described in Step2, but from test/subject_test.txt, test/X_test.txt and test/y_test.txt;  
Step4. Merge `X` observations from both train and test datasets, and select the mean and std. columns;  
Step5. Enhance the names of the columns from merged `X` (The details of the naming convention can be found in the CodeBook);  
Step6. Merge `y`, replace activity ID with descriptive activity names. change the variable name to `activity`;  
Step7. Merge the `subject` data and change the variable name to `subject.id`;  
Step9. Merge all the columns from `X`,`y` and `subject` to a dataset `X.y.subject`;  
Step10. Generate the dataset `Xmean.y.subject` with the average of each variable for each activity and each subject.  