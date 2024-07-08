# Brownian Motion


t <- 100
t_i <- seq(1, t, 0.1)
BB <- rnorm(length(t_i), 0, t)
plot(t_i, BB)
BB_growth <- diff(BB)
mean(BB)
mean(BB_growth)
BB_pfad <- cumsum(BB)
plot(BB_pfad, type = 'l')
plot(BB_growth, type = 'l')

WN <- rnorm(length(t_i), 0, 1)
RW <- cumsum(WN)
plot(t_i, RW, type = 'l')
RW_growth <- diff(RW)
mean(RW_growth)


WN <- rnorm(length(t_i), 0, 1)
WN_ns <- 0.5 * sin(t_i) + WN
mean(WN)
plot(t_i, WN_ns)
NSRW <- cumsum(WN_ns)
plot(t_i, NSRW, type = 'l')

WN <- rnorm(length(t_i), 0, 1)
WN_ns <- 0.5 * sqrt(t_i) * WN
mean(WN)
plot(t_i, WN_ns)
NSRW <- cumsum(WN_ns)
plot(t_i, NSRW, type = 'l')

WN <- rnorm(length(t_i), 0, 1)
WN_ns <- 0.5 * t_i * WN * sin(t_i)
mean(WN)
plot(t_i, WN_ns)
NSRW <- cumsum(WN_ns)
plot(t_i, NSRW, type = 'l')

WN <- rnorm(length(t_i), 0, 1)
WN_ns <- 0.5 * t_i * WN * sin(t_i)
mean(WN)
plot(t_i, WN_ns)
NSRW <- cumsum(WN_ns)

sum(NSRW / length(t_i)) / length(t_i)


plot(t_i, NSRW / length(t_i), type = 'l')
plot(t_i, NSRW, type = 'l')

ren <- NSRW / length(t_i)

stock <- 100 + cumsum(ren)

plot(t_i, stock, type = 'l')

# simulate returns and then stock price

# white noise
t <- 100
t_i <- seq(1, t, 0.1)
WN <- rnorm(length(t_i), 0, 1)

# path 
WN_ns <- sqrt(t_i) * WN * sin(t_i)

# total return
sum(WN_ns / t)

# initial stock price plus returns
stock_ret <- cumsum(WN_ns)
stock <- t + stock_ret

  
if (sum(stock < 0) > 0) {
  
  print("Bankrupt!")
  
  
} else {
  
  plot(t_i, stock, type = 'l')
  
}

mean(stock)
sd(stock)

