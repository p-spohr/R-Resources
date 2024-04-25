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