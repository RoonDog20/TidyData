### Getting and Cleaning Data Course Project 

The purpose of this project is to demonstrate the ability to collect, 
work with, and clean a data set. The goal is to prepare tidy data that 
can be used for later analysis. The project includes the following:

Tidy data is defined as data that is:

   a. Each variable forms a column
   b. Each observations forms a row
   c. Each type of observational unit forms a table

The dataset produced by this project meets this deinition.

The project includes the following files:

   1. README.md - this file, gives overal description and structure of the
        project.
   2. CODEBOOK.md - describes the variable in the tidy data set, how they
        were computed and units
   3. TIDY_MEAN_DATA.txt - the tidy dataset in text format with a header
        row and spaces seperating values
   4. run_analysis.R - an R script that contains a single function,
        run_analysis() that computers the tidy dataset above based on
		source data layed out as described below:
   5. Dataset/ - directory containing the source dataset used to create
        the tidy dataset
      a. features_info.txt'- Shows information about the variables used on the feature vector.
      b. features.txt' - List of all features.
      c. activity_labels.txt - Links the class labels with their activity name.
      d. Train/train_activities.txt - Activity type for each row of training measurements
	  e. Train/train_measures.txt - Measurement data for each training observations
	  f. Train/train_subjects - Subject identified for each of row of treaining measurements
      g. Test/test_activities.txt - Activity type for each row of test measurements
	  h. Test/test_measures.txt - Measurement data for each test observations
	  i. Test/test_subjects - Subject identified for each of row of test measurements

The data for the project was obtained from:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR 
%20Dataset.zip 

run_analysis.R does the following. 

1. Merges the training and the test sets to create one data set. 
2. Extracts only the measurements on the mean and standard deviation for each 
   measurement. This is accomplished by only selecting columns that have either
   'mean()' or 'std()' within the field name
3. Uses descriptive activity names to name the activities in 
   the data set. Numeric activity labels are replaced with their
   text descriptions
4. Appropriately labels the data set with descriptive variable 
   names. Variable names are taken from the the codebook
5. From the data set in step 4, creates a second, independent tidy
   data set with the average of each variable for each activity and each 
   subject. 
   
The final merged, tidyied dataset can be read back into R with the following line:

   read.table("TIDY_MEAN_DATA.txt", header = TRUE)

