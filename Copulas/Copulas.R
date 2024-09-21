X <- rnorm(10000, -1, 6)
Y <- rnorm(10000, 4, 4)

plot(X, X + Y, xlim = c(-20,20), ylim= c(-20,20))


hist(X)
hist(Y)
