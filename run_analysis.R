##
## Getting and Cleaning Data Course Project
## 
## This R script accomplishes the following tasks as laid out for
## the programming assignment for the  Getting and Cleaning Data Course:
##
##  1. Merges the training and the test sets to create one data set.
##
##  2. Extracts only the measurements on the mean and standard deviation 
##     for each measurement.
##
##  3. Uses descriptive activity names to name the activities in the data set
##
##  4. Appropriately labels the data set with descriptive variable names
##
##  5. From the data set in step 4, creates a second, independent tidy data set 
##     with the average of each variable for each activity and each subject.
##
## The output from the function is tidy data set from step 5: a data frame with 
## the average of each variable for each activity and each subject.

## Need to load 'dplyr'

library("dplyr")

run_analysis <- function() {

   ## Read the "features" variable names into a vector so we can label the
   ## "train" and "test" data columns when we read them in with descriptive
   ## labels
	
   var_names <- pull(read.table("Dataset/features.txt"), V2)
   
   ## Read the training and testing data, activity labels, & subjects 
   ## into tables
   
   train_data     <- read.table("Dataset/Train/train_measures.txt", col.names = var_names)
   train_subject  <- read.table("Dataset/Train/train_subjects.txt", col.names = "Subject")
   train_activity <- read.table("Dataset/Train/train_activities.txt", col.names = "Activity")
   
   test_data     <- read.table("Dataset/Test/test_measures.txt", col.names = var_names)
   test_subject  <- read.table("Dataset/Test/test_subjects.txt", col.names = "Subject")
   test_activity <- read.table("Dataset/Test/test_activities.txt", col.names = "Activity")
   
   ## Extract only the mean and standard deviation for each measurement and then merge 
   ## tables together to create a single dataset
   
   train_data <- select(train_data, matches("std()|mean()"))
   test_data  <- select(test_data,  matches("std()|mean()"))
   
   all_data <- bind_rows(
       bind_cols(train_subject, train_activity, train_data),
	   bind_cols(test_subject,  test_activity,  test_data))
	   
   ## Read in the descriptive activity names into a vector and then substitute
   ## the activity name in the merged dataset in place of the activity number
   
   activity_names <- pull(read.table("Dataset/activity_labels.txt"), V2)
   all_data <- mutate(all_data, Activity = activity_names[Activity])
   
   ## Create and return a new tidy dataset with the average of each variable grouped 
   ## by subject and then activity type
   
   all_data %>%
      group_by(Subject, Activity) %>%
	    summarise(across(3:50, mean))
   
}