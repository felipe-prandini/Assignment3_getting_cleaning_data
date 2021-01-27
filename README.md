# Assignment submission - Getting and Cleaning Data
This repo is the submission for the course project on [Getting and Cleaning data](https://www.coursera.org/learn/data-cleaning?specialization=jhu-data-science)
This course is part of the [data science specialization by Johns Hopkins University on Coursera](https://www.coursera.org/specializations/jhu-data-science)

## TL;DR Instructions
- Read this README file to understand the background of the problem
- Read the CodeBook.md to understand the output variables of the tidy_dataset
- Open the following R script: [run_analysis.R]()
- Update the directory variable to your prefered working directory
- Source the code
- Output is a tidy dataset as described by the problem statement



## Objective
The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis.
You will be required to submit:
1. a tidy data set as described below, [final_tidy_data.txt]()
2. a link to a Github repository with your script for performing the analysis, [here](https://github.com/felipe-prandini/Assignment3_getting_cleaning_data) 
3. a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called [CodeBook.md]()

You should also include a README.md in the repo with your scripts. This repo explains how all of the scripts work and how they are connected

## Context
One of the most exciting areas in all of data science right now is wearable computing. Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at [the site where the data was obtained](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)
The exercise uses [this dataset](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

## Steps performed by the run_analysis.R

### 0. Download data, load it into R and get it ready for the cleaning process
Packages dependencies: dplyr and reshape2
You need to set manually your prefered directory by updating the "directory" variable
The codes then download the data, unzip it and saves to the /UCI HAR Dataset directory
It reads activity_labels.txt, features.txt and saves as labels variables
It also reads the X_test, y_test and subject_test.txt files and does the same for the train sets

### 1. Merges the training and the test sets to create one data set
It merges the test and train sets together, resulting in 3 variables:
fulldata, containing the measures
subjects, containing subject labels for each row of fulldata
activity, containing activity labels for each row of fulldata
It also adds the features description as headers of fulldata data frame

### 2. Extracts only the measurements on the mean and standard deviation for each measurement
**Disclaimer**
I will consider as mean only the -mean() variables
I won't consider as mean variables:
- the additional vectors described in the bottom of features_info.txt (e.g. gravityMean, tBodyAccMean, etc) since they are obtained using a time window sample and will conflict with the final step
- the meanFreq() variable since it's not the pure mean for each measure and it's rather the mean of frequency components


### 3. Use descriptive activity names to name the activities on the data set
I'm considering the label of activities already descpriptive enough since it already describes the action being performed by the subject

### 4. Appropriately labels the data set with descriptive variable names









