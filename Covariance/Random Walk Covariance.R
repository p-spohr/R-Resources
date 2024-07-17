# Random Walk Covariance

wn <- rnorm(1000)

var(wn)
cov(wn, wn)
cov(wn[1:(length(wn) - 1)], wn[2:length(wn)])


rw <- cumsum(wn)

var(rw)
cov(rw, rw)
cov(rw[1:(length(rw) - 1)], rw[(1+1):length(rw)]) # tau 1
cov(rw[1:(length(rw) - 2)], rw[(1+2):length(rw)]) # tau 2
cov(rw[1:(length(rw) - 3)], rw[(1+3):length(rw)]) # tau 3
acf(rw, type = 'covariance')
acf(rw)
pacf(rw)


plot(rw, type = 'l')


# random walk with t = var
n <- 20
t <- seq(0, n, by = 0.2)
wn1 <- rnorm(t, 0, n)

var(wn1)
cov(wn1, wn1)
cov(wn1[1:(length(wn1) - 1)], wn1[2:length(wn1)])


rw1 <- cumsum(wn1)

(n * var(wn1)) - var(rw1)

cov(rw1, rw1)
cov(rw1[1:(length(rw1) - 1)], rw1[(1+1):length(rw1)]) # tau 1
cov(rw1[1:(length(rw1) - 2)], rw1[(1+2):length(rw1)]) # tau 2
cov(rw1[1:(length(rw1) - 3)], rw1[(1+3):length(rw1)]) # tau 3
acf(rw1, type = 'covariance')
acf(rw1)
pacf(rw1)


plot(rw1, type = 'l')

wn2 <- wn1[1:(length(wn1) - 1)] * wn1[2:length(wn1)]
var(wn2)
var(wn1) * var(wn1)
var(wn1)

wn3 <- rnorm(10000, mean = 0, sd = 2)
wn4 <- wn3[1:(length(wn3) - 1)] * wn3[2:length(wn3)]
var(wn4)
var(wn3) * var(wn3)
var(wn3)
cov(wn3[1:(length(wn3) - 1)], wn3[2:length(wn3)])
