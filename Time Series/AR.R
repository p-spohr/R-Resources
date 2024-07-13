# AR

n <- 200
mu <- 0
sd <- 1
wn <- rnorm(n, mu, sd)

plot(wn, type = 'l')

phi_1 <- 0.9
ar_1 <- phi_1 * wn[2:length(wn)] + wn[1:(length(wn)-1)]
plot(ar_1, type = 'l')
lines(wn, col = 'blue')

0 / (1 - phi_1)
mean(ar_1)
mean(wn)

# random walk is not stationary
rw <- cumsum(wn)
plot(rw, type = 'l')

ar_1 <- 0.9 * rw[2:length(rw)] + wn[1:(length(rw)-1)]
lines(ar_1, col = 'blue')

wn[1] / (1 - 0.9)
mean(ar_1)

ar_1_stat <- ar_1 - mean(ar_1) # (wn[1] / (1 - 0.9))

plot(ar_1_stat, type = 'l')

ar_2 <- 0.5 * rw[2:(length(rw)-1)] + 0.2 * rw[3:length(rw)] + wn[1:(length(rw)-2)]
lines(ar_2, col = 'red')


t <- seq(0, 50, 0.2)
wn_1 <- rnorm(length(t), 0, 0.25)
y_sin <- sin(t) + wn_1

plot(y_sin, type = 'l')

ar_sin_1 <- 0.90 * y_sin[2:length(y_sin)] + wn_1[1:(length(wn_1)-1)]
lines(ar_sin_1, col = 'blue')
acf(ar_sin_1)
acf(y_sin)
f