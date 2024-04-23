
#### Introduction to R Studio ####

## use '#' in front to create comment (will not be run)

## CTRL + ENTER => run line
12345 # output 12345

## CTRL + L => clear console

## Select Line(s) + CTRL + SHIFT + C => turn lines into comment (works in reverse)
# a
# b
# c
# (unfortunately no multiline comment available in R)

## CTRL + F => go to find and replace !!!use for long code

# CTRL + ALT + Right Mouse => use multiple cursors !!!speed up your coding
# Hi, my name is Patrick. I wrote this all in one go!
# Hi, my name is Patrick. I wrote this all in one go!
# Hi, my name is Patrick. I wrote this all in one go!

## CTRL + SHIFT + H => Choose Current Working Directory
# (Files tab in docket show files and folders in CWD)

## Select Line(s) + ALT + Up/Down Arrow
# move line of code up or down without affecting other lines
# move two or more lines of code by highlighting


#### Operators ####

## addition
10 + 10 # = 20

## subtraction
8 - 4 # = 4

## multiplication
2 * 2 # = 4

## division
100 / 20 # = 5

## exponential
9^2 # = 81
9**2 # = 81

## PEMDAS (parenthesis, exponents, multiplication, division, add, subtract)
#!!!it is always better to use parenthesis to ensure desired results
(1 + 1) + 2^2 - 10 / 5 * 2 # = 2
# 2 + 4 - 2 * 2
(1 + 1) + 2^2 - 10 / (5 * 2) # = 5
# 2 + 4 - 1

# modulo (return remainder of division)
# !!! useful for problems that require finding odd and even numbers
5 %% 5 # = 0
20 %% 5 # = 0
20 %% 18 # = 2
if (5%%2 > 0) print("odd")
if (6%%2 == 0) print("even")


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


#### Basic Object Types ####

# https://www.w3schools.com/r/r_data_types.asp
# numeric - (10.5, 55, 787)
22.22 # float

# integer - (1L, 55L, 100L, where the letter "L" declares this as an integer)
3L == 3.0 # [1] TRUE !!!R finds no distinction even if class is different
class(3L) # [1] "integer"
class(3) # [1] "numeric"

# complex - (9 + 3i, where "i" is the imaginary part)
?complex # check for specific use cases
com <- 2 + 3i
class(com) # [1] "complex"

# character (a.k.a. string) - ("k", "R is exciting", "FALSE", "11.5")
"HI" # [1] "HI"
'HEY' # [1] "HEY"

# logical (a.k.a. boolean) - (TRUE or FALSE)
TRUE # [1] TRUE
T # [1] TRUE
FALSE # [1] FALSE
F # [1] FALSE

"TRUE" == TRUE # [1] TRUE !!!be careful as these are the same even if type is different
"FALSE" == FALSE # [1] TRUE
class("FALSE") # [1] "character"
class(FALSE) # [1] "logical"
"F" == F [1] FALSE # doesn't work for initial F

t <- 10
class(t) # [1] "numeric" 
name <- "Fred"
class(name) # [1] "character"
# !!! important for debugging and when working with other packages
class(factorial) # [1] "function"

#### Advanced Object Types ####

# vectors
c(1,2,3)
class(c(1,2,3))
1:3 == (1:3)
c(1,5,3) == 1:3

c(1,2,3) + 2 # scalar operations
c(1,2,3) - 2
c(1,2,3) / 2
c(1,2,3) * 2

c(1,1,1) + c(1,1,1) # vector operations
c(1,1,1) - c(1,1,1)
c(1,1,1) / c(1,1,1)
c(1,1,1) * c(1,1,1)
c(1,1,1) + c(1,1) # ERROR length is not the same


c(1,2,"3")
class(c(1,2,"3")) # !!!converted to character

# other vector operations
?union
union(1:5, 3:8)
intersect(1:5, 3:8)
setdiff(1:5, 3:8)
setequal(1:5, 3:8)
is.element(1:5, 3:8) # returns logical vector

?array
array(1:3, c(3,3)) # creates matrix

?append
append(1:3, 4) # add 4 to end of list
append(1:3, 4, after = 0) # add 4 to beginning of list



# matrix
A <- matrix(5, nrow = 3, ncol = 3) ; A
B <- matrix(c(1,2,3), nrow = 3, ncol = 3) ; B
C <- matrix(c(1,2,3), nrow = 3, ncol = 3, byrow = TRUE) ; C
d <- c(1,2,3,4,5,6,7,8,9)
D <- matrix(d, nrow = 3, ncol = 3, byrow = TRUE) ; D
?matrix

# matrix operations
?matrix
N <- matrix(1, nrow=2, ncol = 2) ; N
N + N
N - N
N / N
N * N # element wise multiplication
N %*% N # matrix multiplication
N * N == N%*%N # ALL FALSE

N + 2 # scalar operations work just like vectors
N - 2
N / 2
N * 2

M <- matrix(1:9)
dim(M) # [1] 9 1
M.T <- t(M) # transpose matrix
dim(M.T) # [1] 1 9



#### R functions (base) ####

library(help = "base")
# examples
sum(c(1,2,3)) # = 6
mean(c(1,2,3)) # = 2
cumsum(c(1,2,3)) # = (1 3 6)
factorial(4) # = 24

# list of trigonometric functions
?Trig
pi # [1] 3.141593
sin(0)
cos(2 * pi)


#### Other General Functions ####

## getting and setting working directory
# !!!!important for saving files
getwd() # outputs current working directory

## set working directory using a path
dir <- "C:/users/my_name/my_class/assignments" # example directory
# setwd(dir) # sets new working directory
# !!! can also set working directory by going to...
# Session->Set Working Directory->Choose Directory

## getting help
?help # go to documentation using '?' before function
?setwd # go to setwd documentation
?print # go to print documentation

## removing variables from cache
rm(list = ls()) # clears all variables
rm(x, y) # clears x and y variables

## using third party packages
# !!!from image processing to machine learning everything is available
# !!!don't reinvent the wheel
install.packages("cowsay") # install package from online repository
library(cowsay) # use package in current environment (Packages tab => check mark)
?say
say(what = "Let's learn R!", by = "goldfish")

## R setup
?options
options()

## get current date
date()




