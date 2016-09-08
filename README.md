# Coursera-project
Project files for the Getting and Cleaning Data course project

run_analysis.R is a commented R script which starts with "raw" data downloaded from the UCI HAR Dataset and creates a tidy data set as specified in the project instructions for Course 3 on Getting and Cleaning Data

codebook.md describes the variables contained in the final tidy data set

course3project.txt is the final tidy data set.  It can be read into R using: read.csv(".\\data\\course3project.txt", header=T) assuming you stored it in the data folder of your working directory


Further notes about the R script and the data wrangling process:

Data for this project was obtained from: 
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

We ignored the triaxial data and focused on those features that represented means and standard deviations (denoted by mean() or std() within the feature name).  The R script "run_analysis.R" contains commented and detailed R code, but the general process is described below:

1. Read in the appropriate data sets from the UCI HAR Dataset folder.

2. Combine the 3 training data tables, each of which has 7352 observations in the same order.  Xtrain contains the 561 measured features, Ytrain contains the activity being performed (1-6), and strain contains the subject ID.  Feature names for Xtrain must be uploaded from a separate data set, as well as activity labels.

3. The 3 test data tables are combined in a similar manner, and then the training and test data tables are combined.  Each contains the same 563 columns, so the combined data will have those 563 columns and 7352+2947 rows (since 70% of the original data was used for training (n=7352) and the other 30% was set aside for testing (n=2947).

4. We are only interested in features which contain mean() or std() - i.e. they represent means and standard deviations of observed features.  This reduces the number of columns from 563 to 68.

5. We create more descriptive column names in our "keeper" data set, mainly by spelling out cryptic abbreviations in variable names by using regular expressions.

6. The final (tidy) data set contains means of all 66 features containing mean() or std() by subject and activity, for a total of 180 rows and 68 columns.  The final data set is written as a .csv file called "course3project.txt".  

7. Finally, after downloading the tidy data set "course3project.txt" from https://github.com/proback/Coursera-project, the data set can be read in R using: read.table(".\\data\\course3project.txt", header=T) assuming you stored it in the data folder of your working directory.
