#### Assignment Operations ####

## assignment operators
# use <- to assign objects to variable
x <- 2 # common
y = 3 # not standard for R
# use ';' to split code in one line
x ; y # outputs x and y at the same time

x + y # = 5

x <- 0 # overwrite value in current x variable

y / x # = Inf (!!!code will still run but will cause problems later)

## naming conventions
# be descriptive
n <- "Tim" # this is not helpful (!!!nightmare to find later in longer code)
name <- "Tim" # better but needs to be descriptive
# use '_' or '.' to combine words
customer_name <- "Tim"
customer.name <- "Tim"
# numbers only work after first position
# 5_year_returns <- 0.2 ERROR
year_returns_5 <- 0.2 # works!

