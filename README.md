Getting and Cleaning Data Project
===

## Project for the Getting and Cleaning Data course for the Data Science specialization on Coursera


This project gathers data from this [UCI Dataset](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones) on Human Activity gathered using the accelerometer and gyroscope in a smartphone.

My project assumes that the dataset is downloaded exactly in its original form and none of the file names or variable names are edited.

The attached code("run_analysis.R") exatracts and combines both the test and training datasets to create one final dataset. Then it adds columns for neatly named Activity Labels that each subject performed and a unique ID for each Subject.

Finally the script creates a tidy data set containing the mean of all the relevant variables in the data based on the principles defined by Hadley Wickham in his [paper on tidy data](http://vita.had.co.nz/papers/tidy-data.html).

I tried to be as through as possible and not exclude any relevant data. This meant keeping all variable which had any sort of mean or standard deviation in any direction for any observable. The final tidy data set produced by the script includes the means of all of the variable listed above based on both the ACtivity Label and the Subject ID.

To name each variable I created a function that's within the run_analysis file called col_Namer. This function uses clever regex expressions and other functions to rename the variable and expand on their names while also trying to keep certain things abbrevaited (like Standard Deviation) but still make it clearer what each variable represents.

In the code file, you will find that each step has comments for each line and should be readable but some major portions are outlined below:



Section below downloads the zip file and loads all relevant libraries:


### Import relevant libraries
```
library(plyr)
library(dplyr)
```

### Check to see if file already exists before downloading
```
if(!file.exists("dataset.zip")){
     url<-"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20
     HAR%20Dataset.zip"
     download.file(url,"C:/Users/Daud/Desktop/Coursera R/dataset.zip",mode="wb")
     unzip("dataset.zip")
}
```


The section below first reads the column names from the features.txt, the activity labels and subject IDs from both the "train" and test" sets


### Get column names from the features file

`col_names <- read.table("UCI HAR Dataset/features.txt")`

### Get table of all activity labels
`activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt")`

### Get table of all subjects
```
subjects_train <- read.table("UCI HAR Dataset/train/subject_train.txt")
subjects_test <- read.table("UCI HAR Dataset/test/subject_test.txt")
subjects <- rbind(subjects_train,subjects_test)
```

### Read Training data
```
data_train <- read.table("UCI HAR Dataset/test/X_test.txt",
                         col.names = col_names$V2)
```

### Read Test data
```
data_test <- read.table("UCI HAR Dataset/train/X_train.txt",
                         col.names = col_names$V2)
```

### Bind both data sets into 1 combined data set
`data_set <- rbind(data_train,data_test)`

### Select column names containing information about Mean and Standard Deviation
```
useful_features <- c(grep(".*-std\\(\\)", col_names$V2),
                    grep(".*-mean\\(\\)", col_names$V2))
```

### Extract Means and Standard Deviations from data_set
`subset<-select(data_set,useful_features)`

### Read activity for testing and training data
```
activity_data_train <- read.table("UCI HAR Dataset/train/y_train.txt")
activity_data_test <- read.table("UCI HAR Dataset/test/y_test.txt")
```

### Bind together for 1 big set of activity for training and testing data
`activity_data <- rbind(activity_data_train,activity_data_test)`

### Perform relevant conversions for following step
`activity_data$V1 <- as.character(activity_data$V1)`
`activity_labels$V2 <- as.list(activity_labels$V2)`

### Use "mapvalues" to map the names of Activities from the activity_label file onto the dataset of all activityand finally transpose to form a column with the right dimensions.
```
activity_data_final <- transpose(activity_data$V1<-mapvalues(activity_data$V1,
                         activity_labels$V1,activity_labels$V2))
```
### Column bind this activity name column to the overall dataset
`subset <- cbind(subset,activity_data_final,subjects)`


### Tediously created function that renames all variable names with more names based on original names. See codebook for more information.
```
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
```


### Call the Naming function to rename all columns in our dataset.

`subset<- colNamer(subset)`

### Use aggregate to aggregate on Activity Label and Subject ID to create a tidy data set

`tidy_data<-aggregate(.~Subject_ID+Activity_Label, subset, mean)`

### Sort tidy data primarily by SubjectID and then by Activity Label
`tidy_data <- tidy_data[order(tidy_data$Subject_ID,tidy_data$Activity_Label),]`