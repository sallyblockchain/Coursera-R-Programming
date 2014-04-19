setwd("~/Desktop/Online Coursera/Coursera-R-Programming/week4/")

num_helper <- function(state_subset, col_num, num) {
    # get "attack", "failure" and "pneumonia" vector
    outcome_arr <- as.numeric(state_subset[, col_num])
    len <- dim(state_subset[!is.na(outcome_arr), ])[1]
    if (num == "best") {
        rank <- rank_helper(state_subset, outcome_arr, 1)
    } else if (num == "worst") {
        rank <- rank_helper(state_subset, outcome_arr, len)
    } else if (num > len) {
        rank <- NA
    } else {
        rank <- rank_helper(state_subset, outcome_arr, num)
    }
    result <- rank
    return(result)
}

rank_helper <- function(state_subset, outcome_arr, num) {
    result <- state_subset[, 2][order(outcome_arr, state_subset[, 2])[num]]
    return(result)
}

rankall <- function(outcome, num = "best") {
    ## Read outcome data
    ## Check that state and outcome are valid
    ## For each state, find the hospital of the given rank
    ## Return a data frame with the hospital names and the
    ## (abbreviated) state name
    
    # read the data file
    directory <- "./data/outcome-of-care-measures.csv"
    data <- read.csv(directory, colClasses="character")
    valid_outcomes <- c("heart attack", "heart failure", "pneumonia")
    state_arr <- sort(unique(data$State))
    arr_len <- length(state_arr)
    hospital <- rep("", arr_len)
    
    if (!outcome %in% valid_outcomes) {
        stop("invalid outcome")
    } else {
        for(i in 1:arr_len) {
            # loop for each state
            state_subset <- data[data[, 7]==state_arr[i], ]
            if(outcome == "heart attack") {
                hospital[i] <- num_helper(state_subset, 11, num) 
            } else if (outcome == "heart failure") {
                hospital[i] <- num_helper(state_subset, 17, num) 
            } else {
                hospital[i] <- num_helper(state_subset, 23, num) 
            }
        }
    }
    # create the data frame to return
    df <- data.frame(hospital=hospital, state=state_arr)
    result <- df
    return(result)
}

# tests
head(rankall("heart attack", 20), 10)
tail(rankall("pneumonia", "worst"), 3)
tail(rankall("heart failure"), 10)
