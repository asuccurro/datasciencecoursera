require(data.table)
#change <- function(dt, an, )
setwd("~/classes/coursera_jhu_datascience/datasciencecoursera/02_gettingandcleaningdata/assignment")

pathToData = "./UCI\ HAR\ Dataset/"
pathToTestData = paste(pathToData,"test/",sep="")
pathToTrainData = paste(pathToData,"train/",sep="")
activity_labels <- fread(paste(pathToData,"activity_labels.txt",sep=""), header=FALSE)
features_labels <- fread(paste(pathToData,"features.txt",sep=""), header=FALSE)
al <- activity_labels[[2]]
fl <- features_labels[[2]]
dt_y_test <-fread(paste(pathToTestData,"y_test.txt",sep=""), header=FALSE)
#TASK 3
dt_y_test[,ActivityType:=al[V1],by=V1]
dt_y_test[,V1:=NULL]
#THESE TWO LINES ACHIEVE THE SAME AS
#setnames(dt_y_test, "ActivityType")
#dt_y_test[,ActivityType:=as.character(ActivityType)]
#for(i in 1:length(al)){
#  dt_y_test[dt_y_test$ActivityType==as.character(i), ActivityType:=al[i]]
#}
dt_subject_test <-fread(paste(pathToTestData,"subject_test.txt",sep=""), header=FALSE)
setnames(dt_subject_test, "Subject")
#dt_X_test <-fread(paste(pathToTestData,"X_test.txt",sep=""), header=FALSE)
df1 <- read.table(paste(pathToTestData,"X_test.txt",sep=""), header=FALSE)
dt_X_test <- data.table(df1)
setnames(dt_X_test, fl)
dt_test <- data.table(dt_subject_test, dt_y_test, dt_X_test)

#TASKS

#1
#Merges the training and the test sets to create one data set.


#2
#Extracts only the measurements on the mean and standard deviation for each measurement. 

#TASK 3
#Uses descriptive activity names to name the activities in the data set

#4
#Appropriately labels the data set with descriptive variable names. 

#5
#From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
