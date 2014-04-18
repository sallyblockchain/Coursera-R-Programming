# Quiz 2
# Problem 1.
cube <- function(x, n){
    x^3
}
cube(3) # 27
# Problem 2.
x <- 1:10
if(x > 5) {
    x <- 0
} # warning
# Problem 3.
f <- function(x) {
    g <- function(y) {
        y + z
    }
    z <- 4
    x + g(x)
}
z <- 10
f(3) # 10
# Problem 4.
x <- 5
y <- if(x < 3) {
    NA
} else {
    10
}
y # 10
# Problem 5.
h <- function(x, y = NULL, d = 3L) {
    z <- cbind(x, d)
    if(!is.null(y))
        z <- z + y
    else
        z <- z + f
    g <- x + y / z
    if(d == 3L)
        return(g)
    g <- g + 10
    g
}
# free variable: f
f <- function(x, y) {
    x^2 + y / z
} # free variable: z
# Problem 6.
# environment: a collection of symbol/value pair.
# Problem 7.
# type of scoping rule for resolving free variables: Lexical scoping
# Problem 8.
# free variables in R functions are resolved by:
# The values of free variables are searched for in the environment 
# in which the function was defined.
# Problem 9.
# one of the consequences of the scoping rules used in R:
# All objects must be stored in memory.
# Problem 10.
# parent theme: it is the environment in which a function was called.


