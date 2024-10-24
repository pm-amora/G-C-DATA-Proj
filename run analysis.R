# Load the required library
library(dplyr)

# Download and unzip dataset into working directory
if (!file.exists("./getcleandata")) dir.create("./getcleandata")
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", destfile = "./getcleandata/dataset.zip")
unzip("./getcleandata/dataset.zip", exdir = "./getcleandata")

# Load datasets
features <- read.table("./getcleandata/UCI HAR Dataset/features.txt")[, 2]
activityLabels <- read.table("./getcleandata/UCI HAR Dataset/activity_labels.txt", col.names = c("activityID", "activityType"))

# Function to load and label data
load_data <- function(type) {
  x <- read.table(paste0("./getcleandata/UCI HAR Dataset/", type, "/X_", type, ".txt"))
  y <- read.table(paste0("./getcleandata/UCI HAR Dataset/", type, "/y_", type, ".txt"), col.names = "activityID")
  subject <- read.table(paste0("./getcleandata/UCI HAR Dataset/", type, "/subject_", type, ".txt"), col.names = "subjectID")
  colnames(x) <- features
  cbind(y, subject, x)
}

# Merge training and test data
finaldataset <- rbind(load_data("train"), load_data("test"))

# Extract mean and std measurements
setforMeanandStd <- finaldataset %>% select(activityID, subjectID, contains("mean()"), contains("std()"))

# Add descriptive activity names
setWithActivityNames <- merge(setforMeanandStd, activityLabels, by = "activityID")

# Rename columns for clarity
names(setWithActivityNames) <- names(setWithActivityNames) %>%
  gsub("^t", "time", .) %>%
  gsub("^f", "frequency", .) %>%
  gsub("Acc", "Accelerometer", .) %>%
  gsub("Gyro", "Gyroscope", .) %>%
  gsub("Mag", "Magnitude", .) %>%
  gsub("BodyBody", "Body", .)

# Create tidy dataset with average of each variable per activity and subject
tidySet <- setWithActivityNames %>%
  group_by(subjectID, activityID, activityType) %>%
  summarise(across(everything(), mean))

# Save tidy dataset
write.table(tidySet, "tidySet.txt", row.names = FALSE)
