# This file uses Google's R naming convention
# https://google.github.io/styleguide/Rguide.xml
library(dplyr)

# Main entry point to run the whole analysis.
RunAnalysis <- function() {
  
  # file path definitions
  basePath <- "./datasets/UCI HAR Dataset"
  trainsetPath <- file.path(basePath, "train/X_train.txt")
  trainActivityPath <- file.path(basePath, "train/Y_train.txt")
  trainSubjectPath <- file.path(basePath, "train/subject_train.txt")
  testsetPath <- file.path(basePath, "test/X_test.txt")
  testActivityPath <- file.path(basePath, "test/Y_test.txt")
  testSubjectPath <- file.path(basePath, "test/subject_test.txt")
  headersPath <- file.path(basePath, "features.txt")
  activityLabelsPath <- file.path(basePath, "activity_labels.txt")
  
  # read activity labels
  lbls <- ReadData(activityLabelsPath)
  trainLbls <- ReadData(trainActivityPath)
  testLbls <- ReadData(testActivityPath)
  
  # merging ids of activities with its labels
  trainsetLbls <- merge(trainLbls, lbls)
  testsetLbls <- merge(testLbls, lbls)
  
  # append train and test together with column names
  lblsAll <- MergeDfs(trainsetLbls, testsetLbls, c("id", "activity"))
  
  # read subjects
  trainSubjectIds <- ReadData(trainSubjectPath)
  testSubjectIds <- ReadData(testSubjectPath)
  
  # merge train and test subject into one file adding column name
  subjectAll <- MergeDfs(trainSubjectIds, testSubjectIds, "subject")
  
  # read feature headers
  headersDf <- ReadData(headersPath)
  headers <- c(headersDf[ ,2])
  
  trainDf <- ReadData(trainsetPath)
  testDf <- ReadData(testsetPath)
  
  dfAll <- MergeDfs(trainDf, testDf, headers) %>% 
            ExtractMeanStd %>%
            cbind(select(lblsAll, activity)) %>%
            cbind(subjectAll)
  
  dfAll
}

# Reads csv file from a given @fromPath
ReadData <- function(fromPath) {
  df <- read.csv(fromPath, sep = "", header = FALSE, colClasses = "character")
  df
}

# Extracts mean and standard deviation columns
ExtractMeanStd <- function(df) {
  df[,grep("(mean\\(\\)|std\\(\\))", names(df))]
}

# Appends train and test data frames together,
# Adds headers name to the data set.
MergeDfs <- function(train, test, headers) {
  
  dfJoined <- rbind(train, test)
  
  names(dfJoined) <- headers
  
  dfJoined
}