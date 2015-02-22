library(reshape2)

# Load the test datasets 
test.subject <- read.table(".\\test\\subject_test.txt") 
test.x <- read.table(".\\test\\X_test.txt") 
test.y <- read.table(".\\test\\y_test.txt") 

# Load the train datasets
train.subject <- read.table(".\\train\\subject_train.txt") 
train.x <- read.table(".\\train\\X_train.txt") 
train.y <- read.table(".\\train\\y_train.txt") 

#Load features and activity labels
features <- read.table(".\\features.txt") 
activity.labels <- read.table(".\\activity_labels.txt") 

# Merge the test and train subject datasets 
subject <- rbind(test.subject, train.subject) 
colnames(subject) <- "subject" 

# Combine the test and train subject's activity labels 
label <- rbind(test.y, train.y) 
label <- merge(label, activity.labels, by=1)[,2] 

# Combine the test and train main dataset and add the feature labels 
data <- rbind(test.x, train.x) 
colnames(data) <- features[, 2] 

# Combine the subject, activity label with the test and train datasets 
data <- cbind(subject, label, data) 

# Extracts only the measurements on the mean and standard deviation for each 
# measurement
search <- grep("-mean|-std", colnames(data)) 
data.mean.std <- data[,c(1,2,search)] 

#Compute the means, grouped by subject/label 
melted = melt(data.mean.std, id.var = c("subject", "label")) 
means = dcast(melted , subject + label ~ variable, mean) 

#Save the resulting dataset 
write.table(means, file=".\\data\\tidy_data.txt", row.name=FALSE )
 

# Output final dataset 
means 

