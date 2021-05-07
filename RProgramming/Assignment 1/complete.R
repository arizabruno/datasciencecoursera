############################################
# Author: Bruno Ariza
############################################

complete <- function(dir, id = 1:322) {
  
  df <- data.frame(id=integer(),nobs=integer())
  
  for(i in id) {
    
    # File Path
    formattedPath <- if(i < 10) {
      paste("./",dir,"/","00",i,".csv",sep="")
    } else if(i < 100) {
      paste("./",dir,"/","0",i,".csv",sep="")
    } else if(i >= 100) {
      paste("./",dir,"/",i,".csv",sep="")
    }
    
    temp <- read.csv(formattedPath)
    comp <- subset(temp, (!is.na(nitrate) & !is.na(sulfate)))
    record <- c(i,nrow(comp))
    df <- rbind(df,record)
    
  }
  
  names(df) <- c("id","nobs")
  
  df
  
}