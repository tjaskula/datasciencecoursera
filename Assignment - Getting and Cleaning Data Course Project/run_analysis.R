library(dplyr)

# Main entry point to run the whole analysis.
run_analysis <- function() {
  
  # call to merge between training set and test set.
  trainsetpath <- "./datasets/UCI HAR Dataset/train/X_train.txt"
  trainactivitypath <- "./datasets/UCI HAR Dataset/train/Y_train.txt"
  testsetpath <- "./datasets/UCI HAR Dataset/test/X_test.txt"
  testactivitypath <- "./datasets/UCI HAR Dataset/test/Y_test.txt"
  headerspath <- "./datasets/UCI HAR Dataset/features.txt"
  activitylabelspath <- "./datasets/UCI HAR Dataset/activity_labels.txt"
  
  # read activity labels
  lbls <- read_data(activitylabelspath)
  trainlbls <- read_data(trainactivitypath)
  testlbls <- read_data(testactivitypath)
  
  trainsetlbls <- merge(trainlbls, lbls)
  testsetlbls <- merge(testlbls, lbls)
  
  lbls_all <- mergeDfs(trainsetlbls, testsetlbls, c("id", "activity"))
  
  # read headers
  headersDf <- read_data(headerspath)
  headers <- c(headersDf[,2])
  
  trainDf <- read_data(trainsetpath)
  testDf <- read_data(testsetpath)
  
  df_all <- mergeDfs(trainDf, testDf, headers) %>% 
            extractMeanStd %>%
            cbind(select(lbls_all, activity))
  
  df_all
}

# Reads csv file from a given @fromPath
read_data <- function(fromPath) {
  df <- read.csv(fromPath, sep = "", header = FALSE, colClasses = "character")
  df
}

# Extracts mean and standard deviation columns
extractMeanStd <- function(df) {
  df[,grep("(mean\\(\\)|std\\(\\))", names(df))]
}

# Appends train and test data frames together,
# Adds headers name to the data set.
mergeDfs <- function(train, test, headers) {
  
  dfJoined <- rbind(train, test)
  
  names(dfJoined) <- headers
  
  dfJoined
}