setwd("~/Desktop/Online Coursera/Coursera-R-Programming/week4/")

num_helper <- function(data, col_num, state, num) {
    state_subset <- data[data[, 7]==state, ]
    # get "attack", "failure" and "pneumonia" vector
    outcome_arr <- state_subset[, col_num]
    len <- dim(state_subset[!is.na(outcome_arr), ])[1]
    if (num == "worst") {
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

rankhospital <- function(state, outcome, num = "best") {
    ## Read outcome data
    ## Check that state and outcome are valid
    ## Return hospital name in that state with the given rank
    ## 30-day death rate
    
    # read the data file
    directory <- "./data/outcome-of-care-measures.csv"
    data <- read.csv(directory, colClasses="character")
    # change data type from character to numeric
    data[, 11] <- as.numeric(data[, 11]) # heart attack
    data[, 17] <- as.numeric(data[, 17]) # heart failure
    data[, 23] <- as.numeric(data[, 23]) # pneumonia
    valid_outcomes <- c("heart attack", "heart failure", "pneumonia")
    if (!state %in% data$State) {
        stop("invalid state")
    } else if(!outcome %in% valid_outcomes) {
        stop("invalid outcome")
    } else {
        if (num == "best") {
            rank <- beast(state, outcome)
        } else {
            if(outcome == "heart attack") {
                rank <- num_helper(data, 11, state, num) 
            } else if(outcome == "heart failure") {
                rank <- num_helper(data, 17, state, num) 
            } else {
                rank <- num_helper(data, 23, state, num) 
            }
        }
        result <- rank
        return(result)
    }
}

# tests
rankhospital("MN", "heart attack", 5000)
rankhospital("MD", "heart attack", "worst")
rankhospital("TX", "heart failure", 4)
