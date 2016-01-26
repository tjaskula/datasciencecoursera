# Reads two files from a given paths @trainPath and @testPath,
# Merges them together and writes back a merged file into the @toPath
mergeDfs <- function(trainPath, testPath, headers, toPath) {
  
  dfTrain <- read.csv(trainPath, sep = "", header = FALSE, colClasses = "character")
  dfTest <- read.csv(testPath, sep = "", header = FALSE, colClasses = "character")
  
  dfJoined <- rbind(dfTrain, dfTest)
  
  names(dfJoined) <- headers
  
  write.csv(dfJoined, toPath)
  
  dfJoined
}