
sub_train <- read.csv("train/subject_train.txt", sep="", header=FALSE, strip.white=TRUE)
train_data <- read.csv("train/X_train.txt", sep="", header=FALSE, strip.white=TRUE)
train_labels <- read.csv("train/y_train.txt", sep="", header=FALSE, strip.white=TRUE)
train <- cbind(sub_train, train_labels, train_data)

sub_test <- read.csv("test/subject_test.txt", sep="", header=FALSE, strip.white=TRUE)
test_data <- read.csv("test/X_test.txt", sep="", header=FALSE, strip.white=TRUE)
test_labels <- read.csv("test/y_test.txt", sep="", header=FALSE, strip.white=TRUE)
test <- cbind(sub_test, test_labels, test_data)

data <- rbind(train, test)

data <- data[,c(1:8,43:48, 83:88, 123:128, 163:168, 203:204, 216:217, 229:230, 242:243, 255:256, 268:273, 347:352, 426:431, 505:506, 518:519, 531:532, 544:545)]

d <- sub("1", "Walking", data[,2])
d <- sub("2", "Walking_Upstairs", d)
d <- sub("3", "Walking_Downstairs", d)
d <- sub("4", "Sitting", d)
d <- sub("5", "Standing", d)
d <- sub("6", "Laying", d)

data[,2] <- d

colnames(data)[1:8] <- c("Subject", "Activity", "tBodyAcc-mean-X", "tBodyAcc-mean-Y", "tBodyAcc-mean-Z", "tBodyAcc-std-X", "tBodyAcc-std-Y", "tBodyAcc-std-Z")
colnames(data)[9:14] <- c("tGravityAcc-mean-X", "tGravityAcc-mean-Y", "tGravityAcc-mean-Z", "tGravityAcc-std-X", "tGravityAcc-std-Y", "tGravityAcc-std-Z")
colnames(data)[15:20] <- c("tBodyAccJerk-mean-X", "tBodyAccJerk-mean-Y", "tBodyAccJerk-mean-Z", "tBodyAccJerk-std-X", "tBodyAccJerk-std-Y", "tBodyAccJerk-std-Z")
colnames(data)[21:26] <- c("tBodyGyro-mean-X", "tBodyGyro-mean-Y", "tBodyGyro-mean-Z", "tBodyGyro-std-X", "tBodyGyro-std-Y", "tBodyGyro-std-Z")
colnames(data)[27:32] <- c("tBodyGyroJerk-mean-X", "tBodyGyroJerk-mean-Y", "tBodyGyroJerk-mean-Z", "tBodyGyroJerk-std-X", "tBodyGyroJerk-std-Y", "tBodyGyroJerk-std-Z")
colnames(data)[33:34] <- c("tBodyAccMag-mean", "tBodyAccMag-std")
colnames(data)[35:36] <- c("tGravityAccMag-mean", "tGravityAccMag-std")
colnames(data)[37:38] <- c("tBodyAccJerkMag-mean", "tBodyAccJerkMag-std")
colnames(data)[39:40] <- c("tBodyGyroMag-mean", "tBodyGyroMag-std")
colnames(data)[41:42] <- c("tBodyGyroJerkMag-mean", "tBodyGyroJerkMag-std")
colnames(data)[43:48] <- c("fBodyAcc-mean-X", "fBodyAcc-mean-Y", "fBodyAcc-mean-Z", "fBodyAcc-std-X", "fBodyAcc-std-Y", "fBodyAcc-std-Z")
colnames(data)[49:54] <- c("fBodyAccJerk-mean-X", "fBodyAccJerk-mean-Y", "fBodyAccJerk-mean-Z", "fBodyAccJerk-std-X", "fBodyAccJerk-std-Y", "fBodyAccJerk-std-Z")
colnames(data)[55:60] <- c("fBodyGyro-mean-X", "fBodyGyro-mean-Y", "fBodyGyro-mean-Z", "fBodyGyro-std-X", "fBodyGyro-std-Y", "fBodyGyro-std-Z")
colnames(data)[61:62] <- c("fBodyAccMag-mean", "fBodyAccMag-std")
colnames(data)[63:64] <- c("fBodyBodyAccJerkMag-mean", "fBodyBodyAccJerkMag-std")
colnames(data)[65:66] <- c("fBodyBodyGyroMag-mean", "fBodyBodyGyroMag-std")
colnames(data)[67:68] <- c("fBodyBodyGyroJerkMag-mean", "fBodyBodyGyroJerkMag-std")

datamelt <- melt(data, id=c("Subject", "Activity"))

