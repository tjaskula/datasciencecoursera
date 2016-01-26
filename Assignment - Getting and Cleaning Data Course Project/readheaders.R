readHeaders <- function(fromPath) {
  headers <- read.csv(fromPath, sep = "", header = FALSE, colClasses = "character")
  headerst <- as.data.frame(t(headers[,2]))
  headerst
}