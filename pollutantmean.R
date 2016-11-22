pollutantmean <- function(directory, pollutant, id=1:332) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the csv file
  
  ## 'pollutant' is a character vector of length 1 indicating
  ## the name of the pollutant for which we will calculate the
  ## the mean; either "sulfate" or "nitrate".
  
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used.
  
  ## return the mean of the pollutant across all monitors list
  ## in the 'id' vector (ignoring NA values)
  ## NOTE: Do not round the results!
  
  ## ---------- Codes Start here
  ## Getting File Paths into a Vector
  temp <- list.files(directory, full.names = TRUE)[id]

  nf <- length(id)
  total_poll <- vector()
  nrow_poll <- vector()
  
  for (i in 1:nf) {
    mydata <- read.csv(temp[i])
    total_poll[i] <- sum(mydata[[pollutant]], na.rm = TRUE)
    x <- mydata[[pollutant]]
    nrow_poll[i] <- sum(!is.na(x))
  }
  
  sum(total_poll)/sum(nrow_poll)
  
}
