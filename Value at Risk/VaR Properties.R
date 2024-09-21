

# multiply random variable by a positive number
# VaR multiplied by that number is the same


X <- rnorm(100000, 0, 1)

Y <- 3 * X

quantile(X, c(0.95)) * 3

quantile(Y, c(0.95))


# divided random variable by a positive number
# VaR divided by that number is the same

X <- rnorm(100000, 0, 1)

Y <- X / 10

quantile(X, c(0.95)) / 10

quantile(Y, c(0.95))


# multiplying or dividing by a negative doesn't work both ways
X <- rnorm(100000, 0, 1)

Y <- -X

quantile(X, c(0.95))

quantile(Y, c(0.95))


# works with exponential distribution as well

X <- rexp(1000, 1)

Y <- X * 9

quantile(X, c(0.95)) * 9

quantile(Y, c(0.95))

# VaR of a constant is the constant

X <- rep(5, 100)

quantile(X, c(0.95))

