
## Import relevant libraries
library(plyr)
library(dplyr)


## Check to see if file already exists before downloading
if(!file.exists("dataset.zip")){
     url<-"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20
     HAR%20Dataset.zip"
     download.file(url,"C:/Users/Daud/Desktop/Coursera R/dataset.zip",mode="wb")
     unzip("dataset.zip")
}


## Get column names from the features file
col_names <- read.table("UCI HAR Dataset/features.txt")

## Get table of all activity labels
activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt")

## Get table of all subjects
subjects_train <- read.table("UCI HAR Dataset/train/subject_train.txt")
subjects_test <- read.table("UCI HAR Dataset/test/subject_test.txt")
subjects <- rbind(subjects_train,subjects_test)

## Read Training data
data_train <- read.table("UCI HAR Dataset/test/X_test.txt",
                         col.names = col_names$V2)

## Read Test data
data_test <- read.table("UCI HAR Dataset/train/X_train.txt",
                         col.names = col_names$V2)

## Bind both data sets into 1 combined data set
data_set <- rbind(data_train,data_test)

## Select column names containing information about Mean and Standard Deviation
useful_features <- c(grep(".*-std\\(\\)", col_names$V2),
                    grep(".*-mean\\(\\)", col_names$V2))

## Extract Means and Standard Deviations from data_set
subset<-select(data_set,useful_features)

## Read activity for testing and training data
activity_data_train <- read.table("UCI HAR Dataset/train/y_train.txt")
activity_data_test <- read.table("UCI HAR Dataset/test/y_test.txt")

## Bind together for 1 big set of activity for training and testing data
activity_data <- rbind(activity_data_train,activity_data_test)

## Perform relevant conversions for following step
activity_data$V1 <- as.character(activity_data$V1)
activity_labels$V2 <- as.list(activity_labels$V2)

## Use "mapvalues" to map the names of Activities from the activity_label
## file onto the dataset of all activityand finally transpose to form a 
## coolumn with the right dimensions.
activity_data_final <- transpose(activity_data$V1<-mapvalues(activity_data$V1,
                         activity_labels$V1,activity_labels$V2))

## Column bind this activity name column to the overall dataset
subset <- cbind(subset,activity_data_final,subjects)


## Tediously created function that renames all variable names with more
## names based on original names. See README for more information.
colNamer <- function (x){
     
colnames(x)[ncol(x)] <- "Subject_ID"
colnames(x)[ncol(x)-1] <- "Activity_Label"

for (i in grep("^t.+.mean",colnames(x))){
     colnames(x)[i]<-paste("Time-MeanOf",substr(colnames(x)[i],2,
          regexpr("mean",colnames(x)[i])[1]-2),substr(colnames(x)[i],
               nchar(colnames(x)[i]),nchar(colnames(x)[i])),sep="")
}

for (i in grep("^f.+.mean",colnames(x))){
     colnames(x)[i]<-paste("F-MeanOf",substr(colnames(x)[i],2,
          regexpr("mean",colnames(x)[i])[1]-2),substr(colnames(x)[i],
               nchar(colnames(x)[i]),nchar(colnames(x)[i])),sep="")
}

for (i in grep("^f.+.std",colnames(x))){
     colnames(x)[i]<-paste("F-StdDevOf",substr(colnames(x)[i],2,
          regexpr("std",colnames(x)[i])[1]-2),substr(colnames(x)[i],
               nchar(colnames(x)[i]),nchar(colnames(x)[i])),sep="")
}

for (i in grep("^t.+.std",colnames(x))){
     colnames(x)[i]<-paste("Time-StdDevOf-",substr(colnames(x)[i],2,
          regexpr("std",colnames(x)[i])[1]-2),substr(colnames(x)[i],
                nchar(colnames(x)[i]),nchar(colnames(x)[i])),sep="")
}
names(x)<- gsub("Acc","Acceleration",names(x))
names(x)<- gsub("Gyro","Gyroscope",names(x))


return(x)
}


## Call the Naming function to rename all columns in our dataset.
subset<- colNamer(subset)

tidy_data<-aggregate(.~Subject_ID+Activity_Label, subset, mean)

tidy_data <- tidy_data[order(tidy_data$Subject_ID,tidy_data$Activity_Label),]

