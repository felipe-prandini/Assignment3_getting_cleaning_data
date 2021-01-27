library(dplyr)
library(reshape2)

# Step 0 - Download data, load it into R

##  Write here your preferred directory
directory <- "/Volumes/GoogleDrive/My Drive/JohnHopkinsDataScience/datasciencecoursera/Getting And Cleaning Data/Assignment3_getting_cleaning_data"

## Set the directory for the repo
setwd(directory)

## download and unzip the file inside the repo
filepath <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(filepath,"originaldata.zip", method = "curl")
unzip(zipfile = "originaldata.zip", exdir = getwd())

## Extract the activity labels and add proper variable names
activ_labels <- read.table("UCI HAR Dataset/activity_labels.txt")
activ_labels <- rename(activ_labels, activityid = V1, activityname = V2)

## Extract the feature labels and add proper variable names
features <- read.table("UCI HAR Dataset/features.txt")
features <- rename(features, featureid = V1, featuredescription = V2)


## Extract test data and load into R
test <- read.table("UCI HAR Dataset/test/X_test.txt")
test_y <- read.table("UCI HAR Dataset/test/y_test.txt")
subj_test <- read.table("UCI HAR Dataset/test/subject_test.txt")

## Extract train data and load into R
train <- read.table("UCI HAR Dataset/train/X_train.txt")
train_y <- read.table("UCI HAR Dataset/train/y_train.txt")
subj_train <- read.table("UCI HAR Dataset/train/subject_train.txt")

# Step 1 - Merges the training and test sets, creating one dataset

## Merges train and test data for each dataset
fulldata <- rbind(train, test)
subjects <- rbind(subj_train, subj_test)
activity <- rbind(train_y, test_y)

## Clean separate datasets from memory
rm(test, test_y, subj_test, train, train_y, subj_train)

## Change fulldata variables names to features
names(fulldata) <- features$featuredescription

# Step 2 - Extracts only the mean and standard deviation measurements

## Subsets fulldata to include only the mean and standard deviation variables
### I will NOT consider as mean:
####1 - the additional vectors described in the bottom of features_info.txt (e.g. gravityMean, tBodyAccMean, etc)
####2 - the meanFreq() variable
#### I'm doing so because as the project states, we want only the mean and standard deviation for each measurement and I'm considering those as additional calculations
sub_data <- fulldata[,grepl("mean\\()|std\\()",names(fulldata))]


# Step 3 - Use descriptive activity names to name the activities on the data set
## Adds subjects to the dataset
subjects <- rename(subjects, subjectid = V1)
sub_data$subject <- subjects$subjectid

## Adds activity label and remove activity id from sub_data
names(activity) <- "activityid"
sub_data$activityid <- activity$activityid
sub_data <- merge(sub_data, activ_labels, by = "activityid")
sub_data <- sub_data[,2:69]


# Step 4 - Appropriately labeling the data set with descriptive variables
## First I'll create 2 vectors of characters old with the data I want to replace and new with the substitute
old<- c("^tBodyAcc-",
               "^tGravityAcc-",
               "^tBodyAccJerk-",
               "^tBodyGyro-",
               "^tBodyGyroJerk-",
               "^tBodyAccMag-",
               "^tGravityAccMag-",
               "^tBodyAccJerkMag-",
               "^tBodyGyroMag-",
               "^tBodyGyroJerkMag-",
               "^fBodyAcc-",
               "^fBodyAccJerk-",
               "^fBodyGyro-",
               "^fBodyAccMag-",
               "^fBodyAccJerkMag-",
               "^fBodyGyroMag-",
               "^fBodyGyroJerkMag-",
               "^fBodyBodyAccJerkMag-",
               "^fBodyBodyGyroMag-",
               "^fBodyBodyGyroJerkMag-")
new <- c("time_body_acceleration-",
          "time_gravity_acceleration-" ,
          "time_body_acceleration_jerk-",
          "time_body_gyroscope-",
          "time_body_gyroscope_jerk-",
          "time_body_acceleration_magnitude-",
          "time_gravity_acceleration_magnitude-",
          "time_body_acceleration_jerk_magnitude-",
          "time_body_gyroscope_magnitude-",
          "time_body_gyroscope_jerk_magnitude-",
          "frequency_body_acceleration-",
          "frequency_body_acceleration_jerk-",
          "frequency_body_gyroscope-",
          "frequency_body_acceleration_magnitude-",
          "frequency_body_acceleration_jerk_magnitude-",
          "frequency_body_gyroscope_magnitude-",
          "frequency_body_gyroscope_jerk_magnitude-",
          "frequency_body_acceleration_jerk_magnitude-",
          "frequency_body_gyroscope_magnitude-",
          "frequency_body_gyroscope_jerk_magnitude-")
##Then I'll recursively substitute each pair of old_new characters using this for loop along the size of old
for (i in seq_along(old)){ names(sub_data) <- gsub(old[i], new[i], names(sub_data))}
## Now I'll replace "-std() and -mean() using the new style "_stdev"
names(sub_data) <- sub("-std\\()", "_stdev", names(sub_data))
names(sub_data) <- sub("-mean\\()", "_mean", names(sub_data))
##replace the "-X" axis description with the new style "_x"
names(sub_data) <- sub("-X", "_x", names(sub_data))
names(sub_data) <- sub("-Y", "_y", names(sub_data))
names(sub_data) <- sub("-Z", "_z", names(sub_data))
##Final adjustments, changing name of subject variable and lower case the activityname
sub_data <- rename(sub_data, subject_id = subject)
sub_data$activityname <- tolower(sub_data$activityname)
sub_data$activityname <- as.factor(sub_data$activityname)


# Step 5 - Create a second, independent tidy data set with the average of each variable for each activity and each subject
## I have chosen the tall-narrow format as it is still a tidy form, considering that each measure is a possible observation and the mean of those measures is the actual variable
final_data <- melt(sub_data, id.vars = c("subject_id", "activityname"))
final_data <- final_data %>% rename(measure = variable) %>% group_by(subject_id, activityname, measure) %>% summarise(mean = mean(value))

## write the final output
write.table(final_data, file = "final_tidy_data.txt", row.names = FALSE, sep = ",", dec = ".")

