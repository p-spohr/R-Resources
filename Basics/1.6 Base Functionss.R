
#### R functions (base) ####

library(help = "base")
## simple examples
sum(c(1,2,3)) # = 6
mean(c(1,2,3)) # = 2
cumsum(c(1,2,3)) # = (1 3 6)
factorial(4) # = 24

## list of trigonometric functions
## !!!use documentation
?Trig
pi # [1] 3.141593
sin(0)
cos(2 * pi)

## Combining matrices vectors
A <- matrix(1, nrow = 3, ncol = 3) ; A
cbind(A, c(2,2,2)) # does not happen in place
rbind(A, c(2,2,2))
A.new <- cbind(A, c(2,2,2)) ; A.new

breadworld.name <- c("Tom", "Carly", "Jane", "Juan", "Bill")
breadworld.salary <- c(55000, 60000, 80000, 60000, 45000)
breadworld.employees <- rbind(breadworld.employees, breadworld.salary)
class(breadworld.employees)

## Creating named vector
names(breadworld.salary) <- breadworld.name
breadworld.salary

breadworld.salary["Bill"]
breadworld.salary[1]

## Naming columns and rows in a matrix
colnames(A) # NULL return
colnames(A) <- c("First", "Second", "Third") ; A
rownames(A) <- c("First", "Second", "Third") ; A
rownames(breadworld.employees) <- c("Name", "Salary") ; breadworld.employees

## Accessing info from vector using [:] slice
breadworld.names <- c("Tom", "Carly", "Jane", "Juan", "Bill")
breadworld.names[1] # first entry is one !!!different from other languages
breadworld.names[1:1] # same as above

breadworld.names[1:3] # select first three names

breadworld.names[5] # select last name
breadworld.names[6] # NA !!!does not throw an error

breadworld.names[-2] # selects all but second position
breadworld.names[-1:-3] # selects all but first three

breadworld.names[1:3]

## Analyzing some observations
mean(breadworld.salary)

breadworld.salary > mean(breadworld.salary)
greater.mean <- breadworld.salary > mean(breadworld.salary) ; greater.mean
breadworld.salary[greater.mean]

# do it all in one line
breadworld.salary[breadworld.salary > mean(breadworld.salary)]


