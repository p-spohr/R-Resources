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

X.5 <- rnorm(1000000, 0, 25)
Y.5 <- rnorm(1000000, 0, 25)
cov(X.5, Y.5)
cor(X.5, Y.5)

?rnorm

# the higher the standard deviation the higher n needs to be in order to reach 0
X.6 <- rnorm(10, 0, 1)
Y.6 <- rnorm(10, 0, 1)
cov(X.6, Y.6)

sigma <- seq(0,10, by = 0.1)
length(sigma)
C <- vector(mode = "numeric")
n <- 10000
for(sd in sigma) {
  X <- rnorm(n, 0, sd)
  Y <- rnorm(n, 0, sd)
  C <- append(C, cov(X, Y))
}
print(sd(C))
plot(sigma , C, type = "p", pch = 20, xlab = "sd", ylab = "cov")

# plot(sigma , C, type = "p", pch = "x", xlab = "sd", ylab = "cov") 
# pch can use character string

?append
?plot
