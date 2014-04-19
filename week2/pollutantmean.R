setwd("~/Desktop/Online Coursera/Coursera-R-Programming/week2/")
#getwd()
#list.files()

pollutantmean <- function(directory, pollutant = "sulfate", id = 1:332) {
    ## 'directory' is a character vector of length 1 indicating
    ## the location of the CSV files
    
    ## 'pollutant' is a character vector of length 1 indicating
    ## the name of the pollutant for which we will calculate the
    ## mean; either "sulfate" or "nitrate".
    
    ## 'id' is an integer vector indicating the monitor ID numbers
    ## to be used
    
    ## Return the mean of the pollutant across all monitors list
    ## in the 'id' vector (ignoring NA values)
    
    # set working directory
    if(grep("specdata", directory) == 1) {
        directory <- ("./specdata/")
    }
    # initialize a vector to hold the pollutant data
    mean_vector <- c()
    # find all files in the specdata folder
    all_files <- as.character( list.files(directory) )
    file_paths <- paste(directory, all_files, sep="")
    for(i in id) {
        current_file <- read.csv(file_paths[i], header=T, sep=",")
        head(current_file)
        pollutant
        na_removed <- current_file[!is.na(current_file[, pollutant]), pollutant]
        mean_vector <- c(mean_vector, na_removed)
    }
    result <- mean(mean_vector)
    return(round(result, 3)) 
}

# tests
pollutantmean("specdata", "sulfate", 1:10) == 4.064
pollutantmean("specdata", "nitrate", 70:72) == 1.706
pollutantmean("specdata", "nitrate", 23) == 1.281
