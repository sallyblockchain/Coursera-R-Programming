# Quiz 4.
# Problem 1.
set.seed(1)
rpois(5, 2) # A vector with the numbers 1, 1, 2, 4, 1
# Problem 3.
# set.seed(): It ensures that the sequence of random numbers is reproducible.
# Problem 4.
# inverse cumulative distribution function for the Poisson distribution: qpois
# Problem 5.
set.seed(10)
x <- rbinom(10, 10, 0.5)
e <- rnorm(10, 0, 20)
y <- 0.5 + 2 * x + e # Generate data from a Normal linear model
# Problem 7.
# the profiler keeps track of: the function call back 
# when an R expression is evaluated.
# Problem 8.
library(datasets)
Rprof()
fit <- lm(y ~ x1 + x2)
Rprof(NULL) # lm: 100%
# Problem 9.
# When using 'system.time()', the user time is: the time spent by the CPU evaluating an expression