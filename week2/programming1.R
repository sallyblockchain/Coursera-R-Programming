source("http://d396qusza40orc.cloudfront.net/rprog%2Fscripts%2Fsubmitscript1.R")
submit()

> setwd("C:/Users/Dad/Documents/R/JHop")
> ## develope file reading
> file <- read.csv("./specdata/023.csv")
> ## create data frame
> df <- data.frame(Date=as.Date(character()),
+                  sulfate=numeric(), 
+                  nitrate=numeric(), 
+                  ID=integer())
> ## variable name for directory - combine three dirrerent 
> directory <- "specdata"
> id <- 23
> file <- read.csv(paste("./", directory, "/", sprintf("%03d", id), ".csv", sep=""))
> df<-rbind(df, file)
> id<-1
> file1<- read.csv(paste("./", directory, "/", sprintf("%03d", id), ".csv", sep=""))
> df<-rbind(df, file1)
> id<-2
> file2<- read.csv(paste("./", directory, "/", sprintf("%03d", id), ".csv", sep=""))
> df<-rbind(df, file2)
> ## - mean
>  
> mean(file$nitrate, na.rm=TRUE)          #calculate mean
[1] 1.280833
>  
> #develop column name variable to calculate mean
> pollutant <- "nitrate"
> avector <- as.vector(file[pollutant])   #extract column to vector
> avector2 <-avector[!is.na(avector)]     #remove and N/A from vector
> mean(avector2)
[1] 1.280833
>  
> #combining statemente to reduce coding
> pollutant <- "nitrate"
> avector <- as.vector(file[pollutant])   #extract column to vector
> mean(avector[!is.na(avector)])          #remove any N/A and calculate mean
[1] 1.280833
