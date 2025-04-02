
# simulation of BB with drift (according to Prof Hillebrand's lecture)

mu <- 0
delta <- 0.001
sigma <- 1
t <- seq(0, 100, delta)

B <- rnorm(length(t), 0, sqrt(delta)) # delta is varianz, but needs to be standard deviation
B1 <- rnorm(length(t), 0, sqrt(delta)) # delta is varianz, but needs to be standard deviation

diff(B) %*% diff(B1)

B %*% B1

mean(B)
var(B)
var(diff(B))

X <- mu * delta + sigma * B

X_t <- cumsum(X)

plot(t, X_t, type = 'l')

\mean(X_t)
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


# 2 dimensional BB

t_2d <- seq(0, 1000, 1)

BB_1 <- cumsum(rnorm(length(t_2d), 0, 1))
BB_2 <- cumsum(rnorm(length(t_2d), 0, 1))

var(BB_1)
var(BB_2)

plot(BB_1, BB_2, type = 'l')


# increasing t
t <- 0.001
n <- seq(0, 1, t)
mu <- rep(0, length(n))

wn <- rnorm(length(n), mu, sqrt(n))

bb <- cumsum(wn)

mean(bb)
var(bb)

plot(n, bb, type = 'l')

# check mean and var over many iterations
?vector

mean_array <- vector('numeric')
var_array <- vector('numeric')

for (i in 1:10000) {
  
  wn <- rnorm(length(n), mu, sqrt(n))
  bb <- cumsum(wn)
  mean_array[i] <- mean(bb)
  var_array[i] <- var(bb)
  
  
}

# constant t
t_1 <- 0.001
n_1 <- seq(0, 1, t_1)
mu_1 <- rep(0, length(n_1))

wn_1 <- rnorm(length(n_1), mu_1, sqrt(t_1))

bb_1 <- cumsum(wn_1)

mean(bb_1)
var(bb_1)

plot(n_1, bb_1, type = 'l')

# check mean and var over many iterations
?vector

mean_array_1 <- vector('numeric')
var_array_1 <- vector('numeric')

for (i in 1:10000) {
  
  wn_1 <- rnorm(length(n_1), mu_1, sqrt(t_1))
  bb_1 <- cumsum(wn_1)
  mean_array_1[i] <- mean(bb_1)
  var_array_1[i] <- var(bb_1)
  
  
}

mean(mean_array_1)
mean(var_array_1)
median(var_array_1)
?var
plot(mean_array_1, type = 'l')
plot(var_array_1, type = 'l')
