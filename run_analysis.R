# run_analysis.R

# Set working directory (and create data subdirectory if one doesn't exist)
getwd()
setwd("C:\\Users\\roback\\Documents\\Data Science")
if (!file.exists("data")) {
  dir.create("data")
}

# Read in the appropriate data sets from the UCI HAR Dataset folder
library(data.table)
Xtrain <- read.table(".\\UCI HAR Dataset\\train\\X_train.txt", header=F)
Ytrain <- read.table(".\\UCI HAR Dataset\\train\\y_train.txt", header=F)
strain <- read.table(".\\UCI HAR Dataset\\train\\subject_train.txt", header=F)
Xtest <- read.table(".\\UCI HAR Dataset\\test\\X_test.txt", header=F)
Ytest <- read.table(".\\UCI HAR Dataset\\test\\y_test.txt", header=F)
stest <- read.table(".\\UCI HAR Dataset\\test\\subject_test.txt", header=F)

features <- read.table(".\\UCI HAR Dataset\\features.txt", header=F)
activity <- read.table(".\\UCI HAR Dataset\\activity_labels.txt", header=F)

# Assign column names in Xtrain from the list in features.txt
Xtrain <- setNames(Xtrain, features[,2])

# Combine the 3 training data tables, each of which has 7352 observations in the
# same order.  Xtrain contains the 561 measured features, Ytrain contains the 
# activity being performed (1-6), and strain contains the subject ID
train <- data.table(strain, Ytrain, Xtrain)

# Only the first 2 columns of train were missing names after merging
setnames(train, 1:2, c("subject","activity"))

# Take a peek to make sure train looks like we expect
train[1:9,1:9,with=F]

# Repeat the above steps with the data sets set aside for testing a model
Xtest <- setNames(Xtest, features[,2])
test <- data.table(stest, Ytest, Xtest)
setnames(test, 1:2, c("subject","activity"))
test[1:9,1:9,with=F]

# Combine the test and train data tables.  Each contains the same 563 columns, so
# whole will have those 563 columns and 7352+2947 rows
whole <- rbindlist(list(train,test), use.names=T)

# Change entries in the activity column from integers 1-6 to labels describing
# each activity (WALKING, SITTING, etc.)
whole$activity <- factor(whole$activity, levels = activity[,1], labels = activity[,2])
whole[1:9,1:9,with=F]

# Find the column names in whole which contain mean() or std().  Cols.to.keep
# contains the column numbers for features containing mean() or std(), as well as 
# column 1 (subject) and 2 (activity).
names(whole)
cols.with.mean <- grep("mean\\(\\)", names(whole))
cols.with.std <- grep("std\\(\\)", names(whole))
cols.to.keep <- sort(c(1, 2, cols.with.mean, cols.with.std))

# Keeper contains a subset of the columns in whole (68 columns)
library(dplyr)
keeper <- whole[,cols.to.keep, with=F]

# Create more descriptive column names in keeper, mainly by spelling out
# cryptic abbreviations.
betternames <- gsub("^t","time",names(keeper))
betternames <- gsub("^f","frequency",betternames)
betternames <- gsub("Acc","Accelerometer",betternames)
betternames <- gsub("Gyro","Gyroscope",betternames)
betternames <- gsub("Mag","Magnitude",betternames)
betternames <- gsub("mean\\(\\)","Mean",betternames)
betternames <- gsub("std\\(\\)","SD",betternames)
betternames <- gsub("X$","Xaxis",betternames)
betternames <- gsub("Y$","Yaxis",betternames)
betternames <- gsub("Z$","Zaxis",betternames)
names(keeper) <- betternames

# The final data set contains means of all 66 features containing mean() or
# std() by subject and activity, for a total of 180 rows.
final <- keeper %>% group_by(subject, activity) %>% summarize_all(mean)

# Write the final data set as a .csv file.  This file is a tidy data set that 
# can be imported and analyzed by future researchers. 
write.csv(final, ".\\data\\course3project.csv", row.names=F)
# File can be read in using read.csv(".\\data\\course3project.csv")

# Write the final data set as a .txt file.  This file is a tidy data set that 
# can be imported and analyzed by future researchers. 
write.table(final, ".\\data\\course3project.txt", row.names=F)
# file can be read in using read.table(".\\data\\course3project.txt", header=T)