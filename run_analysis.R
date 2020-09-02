library(dplyr)
if(sum(dir()=="features.txt")==0){
  if(file.exists("getdata_projectfiles_UCI HAR Dataset.zip") | file.exists("project_data.zip")){
    if(sum(dir()=="UCI HAR Dataset")==0){
      #Extract data
      unzip("getdata_projectfiles_UCI HAR Dataset.zip")  
    }else{
      #set dirs
      setwd(dir = "UCI HAR Dataset")
    }
  }else{
    if(file.exists("getdata_projectfiles_UCI HAR Dataset.zip")){
      if(sum(ls()=="UCI HAR Dataset")==0){
        #Extract data
        unzip("project_data.zip")  
      }
      
    }else{
      #Get data
      download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip",destfile = "project_data.zip")  
      #Extract data
      unzip("project_data.zip")
    }
    
  }  
}
#getwd()

#Load Features and activity labels
features<-read.csv("features.txt",sep=" ",col.names = cbind("index","names"),header=F)
activity_labels<-read.csv("activity_labels.txt",sep=" ",col.names = cbind("activity","activitityDescription"),header=F)

#Load Train using labels as columns
train_set<-read.csv("train/X_train.txt",sep="",header = F,strip.white = T)
train_labels<-read.csv("train/y_train.txt",sep="",header = F,col.names="activity")

#Load Test using labels as columns
test_set<-read.csv("test/X_test.txt",sep="",header = F,strip.white = T)
test_labels<-read.csv("test/y_test.txt",sep="",header = F,col.names="activity")

#Load subjects
train_subjects<-read.csv("train/subject_train.txt",header=F,sep="",col.names="subject")
test_subjects<-read.csv("test/subject_test.txt",header=F,sep="",col.names="subject")

#Rename columns to describe each variable
names(train_set)<-features[,2]
names(test_set)<-features[,2]

#Add subjects (same names, wasting RAM is a bad practice)
train_set<-cbind(train_set,train_subjects)
test_set<-cbind(test_set,test_subjects)
rm(train_subjects,test_subjects)

#Add labels/activities (same names, wasting RAM is a bad practice)
train_labels<-inner_join(x=train_labels,y=activity_labels,by="activity")
test_labels<-inner_join(x=test_labels,y=activity_labels,by="activity")
train_set<-cbind(train_set,train_labels)
test_set<-cbind(test_set,test_labels)
rm(activity_labels,train_labels,test_labels)

#Merge data and remove not needed variables
merged_set<-rbind(train_set,test_set)
rm(test_set,train_set)
#Select average and standart deviation
merged_set<-merged_set[,append(grep(x=features[,2],pattern = "[M,m]ean\\(\\)|std\\(\\)"),562:564)]
rm(features)

#Fix remaining names 
names(merged_set)<-gsub(pattern = "BodyBody",replacement = "Body",x=names(merged_set))
names(merged_set)<-gsub(pattern = "-",replacement = "",x=names(merged_set))
names(merged_set)<-gsub(pattern = "\\(\\)",replacement = "",x=names(merged_set))

#Write first tidy dataset on a single file for later use
write.csv(x = merged_set,file = "mean_std_merged_full_set.csv")

#Create averages for each activity and each subject
if(sum(ls()=="merged_set")==0){
  merged_set<-read.csv("mean_std_merged_full_set.csv")
}
merged_set<-summarise_each(group_by(merged_set,activitityDescription,subject),funs = (mean))

#Write second tidy dataset on a single file for later use
write.csv(x = merged_set,file = "averages_summarized_by_activity_subject.csv")

#write second tidy dataset on write.table to submit
write.table(x = merged_set,file = "averages_summarized_by_activity_subject.txt",row.names = F)


#Reading data later:
#merged_set<-read.csv("mean_std_merged_full_set.csv")
#View(merged_set)
#summarized_set<-read.csv("averages_summarized_by_activity_subject.csv")
#View(summarized_set)