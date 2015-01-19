getmean<-function(id=1:332,pollutant,directory=getwd()){
 getfilename <- sprintf("%03d.csv", id)
 getdir <- file.path(directory, getfilename)
     result <- read.csv(getdir)
mn <- mean(result[[pollutant]], na.rm = TRUE)
result    
mn
 }

submit()

