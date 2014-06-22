# Read in activity labels
    activities <- read.table("activity_labels.txt", header=FALSE, col.names=c("activityid", "activity"))
    
# Read in features and filter out unnecessary ones
    features <- read.table("features.txt", header=FALSE)
    data_cols <- grep(".*mean\\(\\)|.*std\\(\\)", features$V2)
    features[,2] = gsub('[-()]', '', features[,2])
    
# Read in test data
    data_testsubject <- read.table("./test/subject_test.txt", header=FALSE, col.names=c("id"))
    data_testx <- read.table("./test/X_test.txt", header=FALSE, col.names=features$V2)[,data_cols]
    data_testy <- read.table("./test/y_test.txt", header=FALSE, col.names=c("id"))
    
# Read in training data
    data_trainsubject <- read.table("./train/subject_train.txt", header=FALSE, col.names=c("id"))
    data_trainx <- read.table("./train/X_train.txt", header=FALSE, col.names=features$V2)[,data_cols]
    data_trainy <- read.table("./train/y_train.txt", header=FALSE, col.names=c("id"))
    
# Add subject and activity columns to datasets
    data_testx$activityid <- data_testy$id
    data_trainx$activityid <- data_trainy$id

    data_testx$subjectid <- data_testsubject$id
    data_trainx$subjectid <- data_trainsubject$id
    
    data <- rbind(data_testx, data_trainx)
    
# Add descriptive activity labels
    data <- merge(data, activities)
    
    
    ids <- c("activityid", "activity", "subjectid")
# Melt the data and cast for tidy set, calculating means
    library(reshape2)
    
    measure_vars <- setdiff(colnames(data), ids)
    melted_data <- melt(data, id=ids, measure.vars=measure_vars)
    tidy_data <- dcast(melted_data, activity + subjectid ~ variable, mean)    
    
# Finally, write the tidy dataset to file
    write.table(tidy_data, "tidy.txt")

