# Retrieve the meta data(features,activity labels)
# We assume that the extracted data is in the
# current working directory
feature   <- read.table('features.txt')
activity  <- read.table('activity_labels.txt')

# Retrieve the train data
subject.train <- read.table('train/subject_train.txt')
X.train   <- read.table('train/X_train.txt')
y.train   <- read.table('train/y_train.txt')

# Retrieve the test data
subject.test <- read.table('test/subject_test.txt')
X.test   <- read.table('test/X_test.txt')
y.test   <- read.table('test/y_test.txt')

# Merge X, select the mean and std. columns
X <- rbind(X.train,X.test)
feature.mean_and_std <- grep("-(mean|std)\\(\\)", feature[, 2])
X <- X[,feature.mean_and_std]

# Enhance the names of the columns for X
names(X) <- feature[feature.mean_and_std, 2]
names(X) <- gsub("^t", "time.", names(X))
names(X) <- gsub("^f", "freq.", names(X))

names(X) <- gsub("Acc", "Acc.", names(X))
names(X) <- gsub("Gyro", "Gyro.", names(X))

names(X) <- gsub("Gravity", "Gravity.", names(X))
names(X) <- gsub("BodyBody", "Body", names(X))
names(X) <- gsub("Body", "Body.", names(X))
names(X) <- gsub("Jerk", "Jerk.", names(X))

names(X) <- gsub("Mag", "Mag.", names(X))
names(X) <- gsub("-X$", ".X", names(X))
names(X) <- gsub("-Y$", ".Y", names(X))
names(X) <- gsub("-Z$", ".Z", names(X))

names(X) <- gsub("-mean\\(\\)", "mean", names(X))
names(X) <- gsub("-std\\(\\)", "std", names(X))


# Merge y, replace activity ID with descriptive activity names
# Name the column
y <- rbind(y.train,y.test)
y[,1] <- activity[y[, 1], 2]
names(y) <- c("activity")

# Merge the subject data
subject <- rbind(subject.train,subject.test)
names(subject) <- c("subject.id")

# Merge All the data
X.y.subject <- cbind(X, y, subject)

#
suppressMessages(library(dplyr))
Xmean.y.subject <- X.y.subject %>% group_by(subject.id,activity) %>% summarise_each(funs(mean))
write.table(Xmean.y.subject, "Xmean.y.subject.txt", row.name=FALSE)
