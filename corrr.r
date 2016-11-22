corrr <- function(directory, threshold = 0) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the csv files
  
  ## 'threshold' is a numeric vector of length 1 indicating the
  ## the number of completely observed observations (on all
  ## variables) required to compute the correlation between
  ## nitrate and sulfate; the default is 0
  
  ## Reture a numeric vector of correlations
  ## NOTE: Do not round the result!
  ## ----------------------------------------------------
  
  ## define variables
  csvdata <- vector()
  mydatafull <- vector()
  mydata <- vector()
  
  
  temp <- list.files(directory, full.names = TRUE)

  ## Initialize the first vector with header
  ## mydatafull <- na.omit(read.csv(temp[1]))
  
  ## Find the whole complete cases observations
  for (i in 1:length(temp)) {
    csvdata <- read.csv(temp[i])
    mydatafull <- rbind(mydatafull, na.omit(csvdata))
  }
  
  ## upbond limit
  limit <- nrow(mydatafull)
  
  if (threshold > limit) {
    numeric()
  }  else {
    mydata <- mydatafull[1:threshold, ]
    x <- mydata$sulfate
    y <- mydata$nitrate
    cor(x, y)
  }
  
}