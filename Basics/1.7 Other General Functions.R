
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













