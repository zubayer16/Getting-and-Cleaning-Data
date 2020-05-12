x_train<-read.table("UCI HAR Dataset/train/X_train.txt")
x_test<-read.table("UCI HAR Dataset/test/X_test.txt")

#For merging the two datasets
mergedat<-merge(x_train,x_test,all=TRUE)

#For creating a dataframe of mean of all the columns
meanData<-summarise_each(mergedat, funs(mean))

#For creating a dataframe of  standard deviation of all the columns
sdData<-summarise_each(mergedat, funs(sd))

#Just changed names of 6 of the columns since it's really time consuming. If you know a better solution please let me know in the feedback
setnames(mergedat, old =c("V1","V2","V3","V4","V5","V6"), new = c('tBodyAcc-mean()-X','tBodyAcc-mean()-Y','tBodyAcc-mean()-Z','tBodyAcc-std()-X','tBodyAcc-std()-Y','tBodyAcc-std()-Z'))

#Writing data into a txt file
write.table(mergedat,file="corse3_project.txt",row.name = FALSE) 
