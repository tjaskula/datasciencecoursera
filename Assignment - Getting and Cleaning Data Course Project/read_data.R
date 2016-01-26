# Reads csv file from a given @fromPath
read_data <- function(fromPath) {
  df <- read.csv(fromPath, sep = "", header = FALSE, colClasses = "character")
  df
}