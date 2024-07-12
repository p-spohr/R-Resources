# Component Modelling

n <- 1000
t <- seq(1, n, by = 1)
wn <- rnorm(n)
rw <- cumsum(wn)

B_0 <- 0.0
B_1 <- 0.01
B_2 <- 0.001

X <- B_0 + B_1 * t + B_2 * (t ** 2) + wn

plot(t, X, type = "l")

X_diff <- diff(X, 1)
plot(X_diff, type = 'l')
mean(X_diff)

X_diff_2 <- diff(X, 2)
plot(X_diff_2, type = 'l')
mean(X_diff_2)


X_diff_3 <- diff(X, 3)
plot(X_diff_3, type = 'l')
mean(X_diff_3)


X_diff_1_2 <- diff(X, lag = 1, differences = 2)
plot(X_diff_1_2, type = 'l')
mean(X_diff_1_2)

?filter

plot(rw, type = 'l')
ma_15 <- filter(rw, rep(1,15) / 15, method = "convolution", sides = 2)
lines(ma_15, col = 'red')
seq(1,15)
rep(1, 15)
?diff


?matrix
a <- matrix(c(-1, 0, 0, 1), nrow = 4, ncol = 1) ; a
b <- matrix(c(-1, 1), nrow = 1, ncol = 2) ; b

c <- a %*% b ; c

z <- 1:3
y <- 4:6
M <- convolve(z, y, conj = FALSE, type = 'open') ; M
?convolve


