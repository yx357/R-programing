complete <- function(directory, id=1:332) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the csv files
  
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  
  ## Return a data frame of the form:
  ## id nobs
  ## 1 117
  ## 2 1041
  ## ...
  ## Where 'id' is the monitor ID number and 'nobs' is the 
  ## number of complete cases
  
  temp <- list.files(directory, full.names = TRUE)[id]
  
  nc <- vector()
  
  for (i in 1:length(id)) {
    mydata <- read.csv(temp[i])
    #nc[i] <- sum(complete.cases(mydata))
    nc[i] <- nrow(na.omit(mydata))
  }
  ccase <- data.frame(cbind(id, nobs = nc))
  return(ccase)
  
}
