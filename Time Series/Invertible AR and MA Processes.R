# Invertible AR and MA processes

?arima.sim

# white noise
wn <- arima.sim(list(), n = 1000)

plot(wn, type = 'l')
mean(wn)
var(wn)

ar1 <- arima.sim(list(ar = c(0.5)), n = 1000)
plot(ar1, type = 'l')
mean(ar1)
var(ar1)

ar1_fit <- arima(ar1, order = c(1, 0, 1))
ar1_fit
summary(ar1_fit)
ar1_fit$sigma2

cov(ar1[1:(length(ar1)-1)], wn[2:length(wn)])


n <- 5000
wn2 <- rnorm(n, 0, 500)
X <- 1:5000


ar1_wn2 <- 0.5 * X[1:(length(X) - 1)] + wn2[2:length(wn2)]
plot(ar1_wn2, type = 'l')
arima(ar1_wn2, order = c(2, 0, 2))


i <- 0:1000
j <- 0.5 ** i
cumsum(j)

wn3 <- rnorm(5000)
X_wn3 <- 2.5 + 0.4 * wn3[1:(length(wn3)-2)] + 0.5 * wn3[2:(length(wn3)-1)] + wn3[3:(length(wn3))]
arima(X_wn3, order = c(0, 0, 2))
ma2 <- arima.sim(model = list(ma = c(0.5, 0.4)), n = 5000)
arima(ma2, order = c(0, 0, 2))

ma2_1 <- 2.5 + arima.sim(list(ma = c(0.5, 0.4)), n = 5000)
var(ma2_1) ; 1.41 # correct for n -> infinity
arima(ma2_1, order = c(0, 0, 2))
ma2_1_acf <- acf(ma2_1, type = 'covariance')
round(ma2_1_acf$acf, 4)

ma2_1_acorrf <- acf(ma2_1, type = 'correlation')
round(ma2_1_acorrf$acf, 4)
cov(ma2_1, ma2_1)
