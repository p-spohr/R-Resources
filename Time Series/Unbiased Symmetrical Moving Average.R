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

