#### Covariance ####

?cov
cov(c(1,2,3), c(1,2,3))

X.1 <- (1:10)
Y.1 <- (1:10)
cov(X.1, Y.1)

X.2 <- (1:10)
Y.2 <- (10:1)
cov(X.2, Y.2)
cov(Y.2, X.2)

X.3 <- (1:10)
Y.3 <- (1:10)^2
cov(X.3, Y.3)

X.4 <- rnorm(10000, 0, 1)
Y.4 <- rnorm(10000, 0, 1)
cov(X.4, Y.4)

X.5 <- rnorm(10000, 0, 1)
Y.5 <- rnorm(10000, 0, 1)
cov(X.5, Y.5)
cor(X.5, Y.5)

?rnorm
