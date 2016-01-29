# Extracts mean and standard deviation columns
extractMeanStd <- function(df) {
  df[,grep("(mean\\(\\)|std\\(\\))", names(df))]
}