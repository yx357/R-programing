corr <- function(directory, threshold = 0) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the csv files
  
  ## 'threshold' is a numeric vector of length 1 indicating the
  ## the number of completely observed observations (on all
  ## variables) required to compute the correlation between
  ## nitrate and sulfate; the default is 0
  
  ## Reture a numeric vector of correlations
  ## NOTE: Do not round the result!
  ## ----------------------------------------------------
  
  temp <- list.files(directory, full.names = TRUE)
  df <- complete(directory)
  ids <- df[df["nobs"] > threshold, ]$id
  
  csvdata <- vector()
  corr <- numeric()
  
  for (i in ids) {
    csvdata <- na.omit(read.csv(temp[i]))
    corre <- cor(csvdata$sulfate, csvdata$nitrate)
    corr <- rbind(corr, corre)
  }
  
  corr
  
}