
# small delta t
n <- 1
delta <- 0.001
t <- seq(0, n, delta)
WN <- rnorm(length(t), 0, delta)
var(WN)

BB <- cumsum(WN)

mean(BB)
var(BB)

plot(t, BB, type = 'l')

# larger delta t
n <- 10000
delta <- 1
t <- seq(0, n, delta)
WN <- rnorm(length(t), 0, delta)

BB <- cumsum(WN)

mean(BB)
var(BB[1:800])
var(WN[1:100])

plot(t, BB, type = 'l')

# simulation of BB with drift (according to Prof Hillebrand's lecture)

mu <- 0
delta <- 0.001
sigma <- 1
t <- seq(0, 1, delta)

B <- rnorm(length(t), 0, sqrt(delta)) # delta is the variance, but needs to be standard deviation

X <- mu * delta + sigma * B

X_t <- cumsum(X)

plot(t, X_t, type = 'l')

mean(X_t)
var(X_t)

mean_array <- vector('numeric')
var_array <- vector('numeric')

for (i in 1:10000) {
  
  mu <- 0
  delta <- 0.001
  sigma <- 1
  t <- seq(0, 1, delta)
  
  B <- rnorm(length(t), 0, sqrt(delta)) # delta is variance, but needs to be standard deviation
  
  X <- mu * delta + sigma * B
  
  X_t <- cumsum(X)
  
  mean_array[i] <- mean(X_t)
  var_array[i] <- var(X_t)
  
  
}

mean(mean_array)
mean(var_array)
median(var_array)
