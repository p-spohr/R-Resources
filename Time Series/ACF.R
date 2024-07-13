# ACF

n <- 20
n / 0.2
t <- seq(0, n, 0.2)
x_sin <- sin(t)

plot(x_sin, type = 'l')

x_sin_acf <- acf(x_sin)

max(x_sin_acf$acf)
min(x_sin_acf$acf)

# smallest acf is at lag 16
x_sin_acf$lag[x_sin_acf$acf == min(x_sin_acf$acf)]


b <- x_sin > -1 & x_sin < -0.995
x_sin_min <- x_sin
x_sin_min[!b] <- 0
plot(x_sin_min, col = 'red')
lines(x_sin, type = 'l')

sum(b)

t[x_sin == min(x_sin)]

?acf
acf(x_sin, lag.max = 50)
plot(x_sin, type = 'l')


plot(t, type = 'l')
acf(t, type = 'correlation')
acf(t, type = 'covariance')
acf(t, type = 'partial')
pacf(t)
?pacf
