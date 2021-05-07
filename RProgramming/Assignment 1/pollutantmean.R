# Bruno Ariza
# 05/05/2021

formatNumber <- function(i) {
  formatted <- if(i < 10) {
    paste("00",i,sep="")
  } else if(i < 100) {
    paste("0",i,sep="")
  } else if(i >= 100) {
    i
  }
}

pollutantmean <- function(dir, pollutant, id) {

  fileName <- paste("./",dir,"/", formatNumber(id[1]),".csv",sep="")
  data <- read.csv(fileName)
  id <- setdiff(id, id[1])
  
  # Binding data
  for(i in id) {
    fileName <- paste("./",dir,"/", formatNumber(i),".csv",sep="")
    temp <- read.csv(fileName)
    data <- rbind(data, temp)
  }
  print(mean(data[[pollutant]], na.rm=T))
}


