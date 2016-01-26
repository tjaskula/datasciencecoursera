# Main entry point to run the whole analysis.
run_analysis <- function() {
  
  # references sub scripts for specific behavior.
  if(!exists("mergeDfs", mode="function")) source("mergedatasets.R")
  if(!exists("read_data", mode="function")) source("read_data.R")
  
  # call to merge between training set and test set.
  trainsetpath <- "./datasets/UCI HAR Dataset/train/X_train.txt"
  testsetpath <- "./datasets/UCI HAR Dataset/test/X_test.txt"
  headerspath <- "./datasets/UCI HAR Dataset/features.txt"
  
  # read headers
  headersDf <- read_data(headerspath)
  headers <- c(headersDf[,2])
  
  trainDf <- read_data(trainsetpath)
  testDf <- read_data(testsetpath)
  
  dfMerged <- mergeDfs(trainDf, testDf, headers)
  
  dfMerged
}