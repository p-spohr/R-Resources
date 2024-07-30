#### Logical Operations ####


## equality
# !!remember there is a big difference between = and ==
# very common error when using loops
5 == 5 # [1] TRUE
5 != 5 # [1] FALSE

## inequality
1 < 5 # [1] TRUE
5 > 10 # [1] FALSE
5 >= 5 # [1] TRUE
5 <= 4 # [1] FALSE

## combining operators
# AND &&
1 < 3 && 2 == 2 # [1] TRUE
1 < 3 && 2 != 2 # [1] FALSE
7 < 3 && 3 != 2 # [1] FALSE # two false comparisons
1 == 1 && 2 == 2 && 3 ==3 # [1] TRUE # can use more than two

# OR |
1 < 3 | 2 == 2 # [1] TRUE
1 < 3 | 2 != 2 # [1] TRUE
7 < 3 | 3 != 2 # [1] TRUE # two false comparisons
1 == 1 | 2 == 2 | 3 == 3 # [1] TRUE # all true
1 == 1 | 2 == 2 | 3 != 3 # [1] TRUE # all true but one
1 != 1 | 2 != 2 | 3 != 3 # [1] FALSE # none are true

## using logical operators to change values
?rnorm
movie_ratings <- rnorm(n = 20, mean = 2.5, sd= 2.5)
movie_ratings <- round(movie_ratings, digits = 2)
movie_ratings > 5 # returns logical index
movie_ratings < 0
movie_ratings[movie_ratings > 5] <- 5 # sets value where logical index is true
movie_ratings[movie_ratings < 0] <- 0
# test to see if everything was set correctly
movie_ratings > 5 | movie_ratings < 0 # should all be false
# second method to test if it is correct
# check if any of the elements fulfill the logical operation
any(movie_ratings < 0) # [1] FALSE
any(movie_ratings > 5) # [1] FALSE
any(movie_ratings > 3) # [1] TRUE

is.null(movie_ratings)
is.na(movie_ratings) # all false because none are NA

test_null <- NULL
is.null(test_null) # [1] TRUE

is.numeric(movie_ratings) # [1] TRUE
is.character(movie_ratings) # [1] FALSE

for (rating in movie_ratings) {
  print(rating)
}

movie_quality <- vector('character')
# changing the rating system from a qualitative to a quantitative one
for (rating in movie_ratings) {
  if (rating < 2) {
    movie_quality <- append(movie_quality, 'disliked') # make sure to assign!
  } else if ( rating >=2 && rating < 4) {
    movie_quality <- append(movie_quality, 'enjoyed')
  } else {
    movie_quality <- append(movie_quality, 'liked')
  }
}

?vector
?append


