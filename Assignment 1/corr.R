############################################
# Author: Bruno Ariza
############################################

corr <- function(directory, threshold = 0) {
  
  files <- list.files(directory)
  setwd(directory)
  dfs <- lapply(files, read.csv)
  
  aboveThreshold <- sapply(dfs, function(x) {
    n<-nrow(subset(x, (!is.na(nitrate) & !is.na(sulfate))))
    if(n > threshold) {
      T
    } else {
      F
    }
    }
  )
  
  setwd("..")
  
  dfs <- dfs[aboveThreshold]
  
  correlations <- sapply(dfs, function(x) {
    temp <- cor(x$nitrate, x$sulfate, use="complete.obs")
  })
  correlations  
}