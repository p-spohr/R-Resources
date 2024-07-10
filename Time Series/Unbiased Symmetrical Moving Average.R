# Moving Average
# is a symmetrical MA unbiased

library(forecast)

# generate random walk
n <- 100000 # convergance only becomes clear with many observations
t <- seq(1,n, by = 1)
WN <- rnorm(n) # white noise
RW <- cumsum(WN) # random walk without drift

# plot the random walk
plot(t, RW, type = 'l')

# moving average of order 3
RW_ma <- ma(RW, 3)

# discard NA values
RW_ma <- RW_ma[!is.na(RW_ma)]

# plot MA
t_ma <- seq(1, length(RW_ma), by = 1)
plot(t_ma, RW_ma, type = 'l')

# check to see if the means converge
mean(RW)
mean(RW_ma)

?sd
cov(RW_ma, RW_ma)
var(RW_ma)

cov(WN, WN) # covariance of white noise is 1 because index is the same
cov(WN[1:(length(WN)-1)], WN[(1+1):length(WN)]) # covariance is 0 when index is different

cov(RW, RW) # covariance of random walk is not 1 because they are not independent


wn_1 <- rnorm(500)
wn_ma_3 <- ma(wn_1, order = 3)
wn_ma_3 <- wn_ma_3[!is.na(wn_ma_3)]

wn_ma_5 <- ma(wn_1, order = 5)
wn_ma_5 <- wn_ma_5[!is.na(wn_ma_5)]

wn_ma_6 <- ma(wn_1, order = 6)
wn_ma_6 <- wn_ma_6[!is.na(wn_ma_6)]

wn_ma_10 <- ma(wn_1, order = 10)
wn_ma_10 <- wn_ma_10[!is.na(wn_ma_10)]

U <- 1:15
ma(U, 10, centre = TRUE)
?ma

# expected value of MA from white noise is 0
mean(wn_ma_3)
mean(wn_ma_10)


# autocovariance
autocov <- function(V, tau = 0) {
  V_1 <- V[1:(length(V)-tau)]
  V_2 <- V[(1+tau):length(V)]
  print(cov(V_1, V_2))
}

wn_2 <- rnorm(10000)
autocov(wn_2)
autocov(wn_2, 1)


wn_2_ma_3 <- ma(wn_2, 3)
wn_2_ma_3 <- wn_2_ma_3[!is.na(wn_2_ma_3)]
var(wn_2)
var(wn_2_ma_3) # ma is 1/3 the variance of wn
autocov(wn_2_ma_3) # autocov with tau 0 is 1/3 the variance of wn
autocov(wn_2_ma_3, 1) # autocov with tau 1 is 2/9 the variance of wn
autocov(wn_2_ma_3, 2) # autocov with tau 1 is 1/9 the variance of wn
var(wn_2) * 1/9
autocov(wn_2_ma_3, 3) # autocov with tau 1 is 1/9 the variance of wn
