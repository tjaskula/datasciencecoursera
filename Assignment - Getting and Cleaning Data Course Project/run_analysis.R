# Main entry point to run the whole analysis.
run_analysis <- function() {
  
  # references sub scripts for specific behavior.
  if(!exists("mergeDfs", mode="function")) source("mergedatasets.R")
  if(!exists("readHeaders", mode="function")) source("readheaders.R")
  
  # call to merge between training set and test set.
  trainsetpath <- "./datasets/UCI HAR Dataset/train/X_train.txt"
  testsetpath <- "./datasets/UCI HAR Dataset/test/X_test.txt"
  headersPath <- "./datasets/UCI HAR Dataset/features.txt"
  
  # read headers
  headers <- readHeaders(headersPath)
  
  dfMerged <- mergeDfs(trainsetpath, testsetpath, headers)
}