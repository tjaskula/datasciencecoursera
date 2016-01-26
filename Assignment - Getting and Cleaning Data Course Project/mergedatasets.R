# Appends train and test data frames together,
# Adds headers name to the data set.
mergeDfs <- function(train, test, headers) {
  
  dfJoined <- rbind(train, test)
  
  names(dfJoined) <- headers
  
  dfJoined
}