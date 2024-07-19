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
?seq

n <- 10000
t <- seq(1, n, 1)
Z <- rnorm(n, mean = 10, sd = 5)
cov(t, Z)
cor(t, Z)

tz <- t * Z

mean(tz) - mean(t) * mean(Z) # covariance of the t index and Z random variable

n <- seq(1, 10000, 1)
WN <- rnorm(n)
MA3 <- c()
for (i in n) {
  
  MA3[i] <- 1/3 * (WN[i-1] + WN[i] + WN[i+1])
  
}
is.na(MA3)
MA3 <- MA3[!is.na(MA3)]
length(MA3)
cov(MA3, MA3) # covariance is 1/3 of the sd when tau is 0
sd(WN) / 3

cov(MA3[1:(length(MA3)-1)], MA3[(1+1):length(MA3)]) # covariance is 2/9 times sd when tau is 1
sd(WN) * (2/9)

cov(MA3[1:(length(MA3)-2)], MA3[(1+2):length(MA3)]) # covariance is 1/9 times sd when tau is 2
sd(WN) / 9


M <- (0:50) ** 4
plot(M, type = 'l')
acf(M)
pacf(M)


T_1 <- 0:50
plot(T_1, type = 'l')
acf(T_1)
pacf(T_1)

T_cs <- cumsum(0:50)
plot(T_cs, type = 'l')
acf(T_cs)
pacf(T_cs)


ar_5 <- arima.sim(list(ar = c(0.2, -0.3, 0.1, -0.5, 0.5)), 1000)
plot(ar_5, type = 'l')
acf(ar_5)
pacf(ar_5) # pacf can roughly show the phis of an AR Process


ma_5 <- arima.sim(list(ma = c(0.2, -0.3, 0.1, -0.5, 0.5)), 1000)
plot(ma_5, type = 'l')
acf(ma_5) # ma process always stationary => as lag increases the ACF goes to zero
pacf(ma_5) # pacf can roughly show the phis of an AR Process


arma_5_diff <- ar_5 - ma_5
plot(arma_5_diff, type = 'l')
acf(arma_5_diff)
pacf(arma_5_diff)
